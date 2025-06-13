<?php

namespace App\Http\Controllers\API;

use App\Models\Mhs;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Resources\CrudResource;

class MhsAPI extends Controller
{
    function index(Request $request)
    {
        $search = $request->search;
        $limit = $request->limit ?? 15; // Default 15 items per page
        $prodi_id = $request->prodi_id;
        $jenkel = $request->jenkel;
        $thn_angkatan = $request->thn_angkatan;
        $status = $request->status;
        $sort_by = $request->sort_by ?? 'nm_mhs'; // Default sort by name
        $sort_order = $request->sort_order ?? 'asc'; // Default ascending

        $query = Mhs::with(['prodi.fakultas', 'statusMhs']);

        // Search filter - Enhanced untuk NPM gabungan
        if ($search) {
            $query->where(function ($q) use ($search) {
                $q->where('nm_mhs', 'like', "%$search%")
                    ->orWhere('NPM', 'like', "%$search%")
                    // Filter berdasarkan NPM gabungan (kode_prodi + tahun_angkatan + NPM)
                    ->orWhereHas('prodi', function ($prodiQuery) use ($search) {
                        $prodiQuery->whereRaw("CONCAT(prodi.kode, mhs.thn_angkatan, mhs.NPM) LIKE ?", ["%{$search}%"]);
                    });
            });
        }

        // Program Studi filter
        if ($prodi_id) {
            $query->where('prodi_id', $prodi_id);
        }

        // Jenis Kelamin filter
        if ($jenkel && $jenkel !== 'all') {
            $query->where('jenkel', $jenkel);
        }

        // Tahun Angkatan filter
        if ($thn_angkatan) {
            $query->where('thn_angkatan', $thn_angkatan);
        }

        // Status filter
        if ($status && $status !== 'all') {
            switch ($status) {
                case 'active':
                    $query->whereDoesntHave('statusMhs')
                        ->where('status', '!=', 'tidak aktif');
                    break;
                case 'inactive':
                    $query->where(function ($q) {
                        $q->whereHas('statusMhs')
                            ->orWhere('status', 'tidak aktif');
                    });
                    break;
                case 'lulus':
                    $query->where('status', 'lulus');
                    break;
            }
        }

        // Sorting
        $allowedSortFields = ['nm_mhs', 'NPM', 'thn_angkatan', 'created_at', 'status'];
        if (in_array($sort_by, $allowedSortFields)) {
            if ($sort_by === 'prodi') {
                $query->join('prodi', 'mhs.prodi_id', '=', 'prodi.id')
                    ->orderBy('prodi.nm_prodi', $sort_order)
                    ->select('mhs.*'); // Ensure we only select mhs fields
            } else {
                $query->orderBy($sort_by, $sort_order);
            }
        } else {
            $query->orderBy('nm_mhs', 'asc'); // Default fallback
        }

        // Secondary sort by name for consistency
        if ($sort_by !== 'nm_mhs') {
            $query->orderBy('nm_mhs', 'asc');
        }

        $data = $query->paginate($limit);

        return new CrudResource('success', 'Data Mhs', $data);
    }

    // Method khusus untuk search berdasarkan NPM gabungan
    public function searchByNpmFull(Request $request)
    {
        $npmFull = $request->npm_full;
        $limit = $request->limit ?? 15;

        if (!$npmFull) {
            return new CrudResource('error', 'NPM gabungan harus diisi', null);
        }

        $query = Mhs::with(['prodi.fakultas', 'statusMhs'])
            ->whereHas('prodi', function ($q) use ($npmFull) {
                $q->whereRaw("CONCAT(prodi.kode, mhs.thn_angkatan, mhs.NPM) = ?", [$npmFull]);
            });

        $data = $query->paginate($limit);

        return new CrudResource('success', 'Data Mhs berdasarkan NPM Gabungan', $data);
    }

    public function kontrak(Request $request)
    {
        $search = $request->search;
        $semester = $request->semester;
        $tahun = $request->tahun;
        $id = $request->id;

        $data = Mhs::with(['kontrakDet' => function ($query) {
            $query->with(['jadwal.matkul']);
        }])
            ->whereHas('kontrakDet.jadwal.matkul', function ($query) use ($search) {
                $query->where('nm_matkul', 'like', "%$search%");
            })
            ->whereHas('kontrakDet.kontrak', function ($query) use ($semester, $tahun) {
                $query->where(['semester' => $semester, 'tahun' => $tahun]);
            })
            ->when($id, function ($query) use ($id) {
                $query->where('id', $id);
            })
            ->first();

        return new CrudResource('success', 'Data Kontrak', $data);
    }

    function all(Request $request)
    {
        $search = $request->search;
        $prodi_id = $request->prodi_id;

        $query = Mhs::with(['prodi.fakultas', 'statusMhs']);

        // Enhanced search untuk NPM gabungan
        if ($search) {
            $query->where(function ($q) use ($search) {
                $q->where('nm_mhs', 'like', "%$search%")
                    ->orWhere('NPM', 'like', "%$search%")
                    ->orWhereHas('prodi', function ($prodiQuery) use ($search) {
                        $prodiQuery->whereRaw("CONCAT(prodi.kode, mhs.thn_angkatan, mhs.NPM) LIKE ?", ["%{$search}%"]);
                    });
            });
        }

        if ($prodi_id) {
            $query->where('prodi_id', $prodi_id);
        }

        $data = $query->orderBy('prodi_id', 'asc')
            ->orderBy('nm_mhs', 'asc')
            ->get();

        return new CrudResource('success', 'Data Mhs', $data);
    }

    function active(Request $request)
    {
        $search = $request->search;
        $prodi_id = $request->prodi_id;
        $mhsId = $request->mhs_id;

        $query = Mhs::with(['prodi.fakultas', 'statusMhs'])
            ->whereDoesntHave('statusMhs');

        // Enhanced search untuk NPM gabungan
        if ($search) {
            $query->where(function ($q) use ($search) {
                $q->where('nm_mhs', 'like', "%$search%")
                    ->orWhere('NPM', 'like', "%$search%")
                    ->orWhereHas('prodi', function ($prodiQuery) use ($search) {
                        $prodiQuery->whereRaw("CONCAT(prodi.kode, mhs.thn_angkatan, mhs.NPM) LIKE ?", ["%{$search}%"]);
                    });
            });
        }

        if ($prodi_id) {
            $query->where('prodi_id', $prodi_id);
        }

        if ($mhsId) {
            $mhs_id = explode(',', $mhsId);
            $query->whereIn('id', $mhs_id);
        }

        $data = $query->orderBy('prodi_id', 'asc')
            ->orderBy('nm_mhs', 'asc')
            ->get();

        return new CrudResource('success', 'Data Mhs', $data);
    }

    /**
     * Get unique filter options
     */
    public function filterOptions(Request $request)
    {
        // Get unique tahun angkatan
        $tahunAngkatan = Mhs::distinct()
            ->orderBy('thn_angkatan', 'desc')
            ->pluck('thn_angkatan')
            ->values();

        // Get unique prodi with fakultas
        $prodi = Mhs::with('prodi.fakultas')
            ->select('prodi_id')
            ->distinct()
            ->get()
            ->pluck('prodi')
            ->filter()
            ->unique('id')
            ->values();

        // Get status statistics
        $totalMahasiswa = Mhs::count();
        $mahasiswaAktif = Mhs::whereDoesntHave('statusMhs')
            ->where('status', '!=', 'tidak aktif')
            ->count();
        $mahasiswaTidakAktif = Mhs::where(function ($q) {
            $q->whereHas('statusMhs')->orWhere('status', 'tidak aktif');
        })->count();
        $mahasiswaLulus = Mhs::where('status', 'lulus')->count();

        return new CrudResource('success', 'Filter Options', [
            'tahun_angkatan' => $tahunAngkatan,
            'prodi' => $prodi,
            'statistics' => [
                'total' => $totalMahasiswa,
                'aktif' => $mahasiswaAktif,
                'tidak_aktif' => $mahasiswaTidakAktif,
                'lulus' => $mahasiswaLulus,
            ]
        ]);
    }

    /**
     * Get mahasiswa statistics
     */
    public function statistics(Request $request)
    {
        $prodi_id = $request->prodi_id;
        $thn_angkatan = $request->thn_angkatan;

        $query = Mhs::with(['prodi', 'statusMhs']);

        if ($prodi_id) {
            $query->where('prodi_id', $prodi_id);
        }

        if ($thn_angkatan) {
            $query->where('thn_angkatan', $thn_angkatan);
        }

        $allMahasiswa = $query->get();

        // Group by prodi
        $byProdi = $allMahasiswa->groupBy('prodi.nm_prodi')->map(function ($group) {
            return [
                'total' => $group->count(),
                'aktif' => $group->filter(function ($mhs) {
                    return !$mhs->statusMhs && $mhs->status !== 'tidak aktif';
                })->count(),
                'tidak_aktif' => $group->filter(function ($mhs) {
                    return $mhs->statusMhs || $mhs->status === 'tidak aktif';
                })->count(),
                'lulus' => $group->filter(function ($mhs) {
                    return $mhs->status === 'lulus';
                })->count(),
            ];
        });

        // Group by tahun angkatan
        $byAngkatan = $allMahasiswa->groupBy('thn_angkatan')->map(function ($group) {
            return [
                'total' => $group->count(),
                'aktif' => $group->filter(function ($mhs) {
                    return !$mhs->statusMhs && $mhs->status !== 'tidak aktif';
                })->count(),
            ];
        });

        // Group by jenis kelamin
        $byJenkel = $allMahasiswa->groupBy('jenkel')->map->count();

        return new CrudResource('success', 'Statistics', [
            'total' => $allMahasiswa->count(),
            'by_prodi' => $byProdi,
            'by_angkatan' => $byAngkatan,
            'by_jenkel' => $byJenkel,
        ]);
    }
}
