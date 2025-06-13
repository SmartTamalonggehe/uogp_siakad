<?php

namespace App\Http\Controllers\API;

use App\Models\Jadwal;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use App\Http\Resources\CrudResource;
use Illuminate\Database\Eloquent\Builder;

class JadwalAPI extends Controller
{
    public function index(Request $request)
    {
        try {
            // Get filter parameters
            $semester = $request->get('semester');
            $tahun = $request->get('tahun');
            $search = $request->get('search');
            $prodi_id = $request->get('prodi_id');
            $hari = $request->get('hari');
            $dosen_id = $request->get('dosen_id');
            $limit = $request->get('limit', 10);

            // Start building query with relationships
            $query = Jadwal::with([
                'dosen:id,nm_dosen',
                'matkul:id,nm_matkul,kd_matkul,singkat,sks',
                'ruangan:id,nm_ruangan',
                'prodi:id,nm_prodi',
                'prodi.fakultas:id,nm_fakultas'
            ]);

            // Apply exact match filters (only if not empty)
            if (!empty($semester)) {
                $query->where('semester', $semester);
            }

            if (!empty($tahun)) {
                $query->where('tahun', $tahun);
            }

            if (!empty($prodi_id)) {
                $query->where('prodi_id', $prodi_id);
            }

            if (!empty($hari)) {
                $query->where('hari', $hari);
            }

            if (!empty($dosen_id)) {
                $query->where(function (Builder $q) use ($dosen_id) {
                    $q->where('dosen_id', $dosen_id);
                });
            }

            // Apply search filter (only if not empty)
            if (!empty($search)) {
                $searchTerm = trim($search);
                $query->where(function (Builder $q) use ($searchTerm) {
                    // Search in hari
                    $q->where('hari', 'like', "%{$searchTerm}%")
                        // Search in mata kuliah
                        ->orWhereHas('matkul', function (Builder $matkul) use ($searchTerm) {
                            $matkul->where('nm_matkul', 'like', "%{$searchTerm}%")
                                ->orWhere('kd_matkul', 'like', "%{$searchTerm}%")
                                ->orWhere('singkat', 'like', "%{$searchTerm}%");
                        })
                        // Search in dosen (dosen utama)
                        ->orWhereHas('dosen', function (Builder $dosen) use ($searchTerm) {
                            $dosen->where('nm_dosen', 'like', "%{$searchTerm}%");
                        })
                        // Search in ruangan
                        ->orWhereHas('ruangan', function (Builder $ruangan) use ($searchTerm) {
                            $ruangan->where('nm_ruangan', 'like', "%{$searchTerm}%");
                        })
                        // Search in program studi
                        ->orWhereHas('prodi', function (Builder $prodi) use ($searchTerm) {
                            $prodi->where('nm_prodi', 'like', "%{$searchTerm}%");
                        });
                });
            }

            // Apply ordering
            $data = $query
                ->orderByRaw("FIELD(hari, 'Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu')")
                ->orderBy('mulai')
                ->paginate((int) $limit);

            return new CrudResource('success', 'Data Jadwal berhasil diambil', $data);
        } catch (\Exception $e) {
            return new CrudResource('error', 'Gagal mengambil data jadwal: ' . $e->getMessage(), null);
        }
    }

    /**
     * Get filter options for jadwal
     */
    public function filterOptions()
    {
        try {
            $data = [
                'tahun' => Jadwal::distinct()
                    ->whereNotNull('tahun')
                    ->orderBy('tahun', 'desc')
                    ->pluck('tahun')
                    ->filter()
                    ->values(),

                'hari' => ['Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu'],

                'prodi' => \App\Models\Prodi::with('fakultas:id,nm_fakultas')
                    ->select('id', 'nm_prodi', 'fakultas_id')
                    ->whereHas('jadwal') // Only prodi that have jadwal
                    ->orderBy('nm_prodi')
                    ->get(),

                'dosen' => \App\Models\Dosen::select('id', 'nm_dosen')
                    ->where(function (Builder $q) {
                        $q->whereHas('jadwal_as_dosen');
                    })
                    ->orderBy('nm_dosen')
                    ->get(),
            ];

            return new CrudResource('success', 'Filter options berhasil diambil', $data);
        } catch (\Exception $e) {
            return new CrudResource('error', 'Gagal mengambil filter options: ' . $e->getMessage(), null);
        }
    }

    /**
     * Show specific jadwal
     */
    public function show($id)
    {
        try {
            $jadwal = Jadwal::with([
                'dosen:id,nm_dosen',
                'dosen_1:id,nm_dosen',
                'matkul:id,nm_matkul,kd_matkul,singkat,sks',
                'ruangan:id,nm_ruangan',
                'prodi:id,nm_prodi',
                'prodi.fakultas:id,nm_fakultas'
            ])->findOrFail($id);

            return new CrudResource('success', 'Detail jadwal berhasil diambil', $jadwal);
        } catch (\Exception $e) {
            return new CrudResource('error', 'Jadwal tidak ditemukan: ' . $e->getMessage(), null);
        }
    }

    public function bydosen(Request $request)
    {
        $dosen_id = $request->dosen_id;
        $semester = $request->semester;
        $tahun = $request->tahun;

        $jadwals = Jadwal::with('matkul')->select('matkul_id', DB::raw('GROUP_CONCAT(id) as jadwal_ids'))
            ->where([
                ['semester', 'like', "%$semester%"],
                ['tahun', 'like', "%$tahun%"],
                ['dosen_id', $dosen_id],
            ])
            ->groupBy('matkul_id')
            ->get();

        $result = [];
        foreach ($jadwals as $jadwal) {
            $result[] = [
                'id' => $jadwal->jadwal_ids,
                'matkul_id' => $jadwal->matkul_id,
                'nm_matkul' => $jadwal->matkul->nm_matkul,
            ];
        }
        return new CrudResource('success', 'Data Jadwal', $result);
    }

    public function bydosenFull(Request $request)
    {
        $semester = $request->semester;
        $tahun = $request->tahun;
        $search = $request->search;
        $prodi_id = $request->prodi_id;
        $fakultas_id = $request->fakultas_id;
        $dosen_id = $request->dosen_id;

        $data = Jadwal::with(['dosen', 'dosen_1', 'matkul', 'ruangan', 'prodi.fakultas'])
            ->where([
                ['semester',  $semester],
                ['tahun',  $tahun],
            ])
            ->where(function ($query) use ($search) {
                $query->where('hari', 'like', "%$search%")
                    ->orWhereHas('matkul', function ($mhs) use ($search) {
                        $mhs->where('nm_matkul', 'like', "%$search%")
                            ->orWhere('singkat', 'like', "%$search%");
                    })
                    ->orWhereHas('dosen', function ($mhs) use ($search) {
                        $mhs->where('nm_dosen', 'like', "%$search%");
                    });
            })
            ->when($fakultas_id, function ($query) use ($fakultas_id) {
                return $query->whereHas('prodi', function ($query) use ($fakultas_id) {
                    $query->where('fakultas_id', 'like', $fakultas_id);
                });
            })
            ->when($prodi_id, function ($query) use ($prodi_id) {
                return $query->whereHas('prodi', function ($query) use ($prodi_id) {
                    $query->where('prodi_id', 'like', $prodi_id);
                });
            })
            ->when($dosen_id, function ($query) use ($dosen_id) {
                $query->where('dosen_id', $dosen_id);
            })

            ->orderByRaw("FIELD(hari, 'Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu')")
            ->orderBy('mulai')
            ->get();
        return new CrudResource('success', 'Data Jadwal', $data);
    }

    public function byJadwal(Request $request)
    {
        $jadwal_id = $request->jadwal_id;
        $array = array_map('intval', explode(',', $jadwal_id));
        $search = $request->search;

        $data = Jadwal::with('dosen', 'dosen_1', 'matkul', 'ruangan', 'prodi')
            ->where(function ($query) use ($search) {
                $query->where('hari', 'like', "%$search%")
                    ->orWhereHas('matkul', function ($mhs) use ($search) {
                        $mhs->where('nm_matkul', 'like', "%$search%")
                            ->orWhere('singkat', 'like', "%$search%");
                    })
                    ->orWhereHas('dosen', function ($mhs) use ($search) {
                        $mhs->where('nm_matkul', 'like', "%$search%");
                    });
            })
            ->whereIn('id', $array)
            ->get();

        return new CrudResource('success', 'Data Jadwal', $data);
    }

    public function byTahunSemester(Request $request)
    {
        $semester = $request->semester;
        $tahun = $request->tahun;
        $search = $request->search;
        $prodi_id = $request->prodi_id;
        $fakultas_id = $request->fakultas_id;
        $dosen_id = $request->dosen_id;

        $data = Jadwal::with(['dosen', 'dosen_1', 'matkul', 'ruangan', 'prodi.fakultas'])
            ->where([
                ['semester',  $semester],
                ['tahun',  $tahun],
            ])
            ->where(function ($query) use ($search) {
                $query->where('hari', 'like', "%$search%")
                    ->orWhereHas('matkul', function ($matkul) use ($search) {
                        $matkul->where('nm_matkul', 'like', "%$search%")
                            ->orWhere('singkat', 'like', "%$search%");
                    })
                    ->orWhereHas('dosen', function ($dosen) use ($search) {
                        $dosen->where('nm_dosen', 'like', "%$search%");
                    });
            })
            ->when($fakultas_id, function ($query) use ($fakultas_id) {
                return $query->whereHas('prodi', function ($query) use ($fakultas_id) {
                    $query->where('fakultas_id', 'like', $fakultas_id);
                });
            })
            ->when($prodi_id, function ($query) use ($prodi_id) {
                $query->where('prodi_id', $prodi_id);
            })
            ->when($dosen_id, function ($query) use ($dosen_id) {
                $query->where('dosen_id', $dosen_id);
            })

            ->orderByRaw("FIELD(hari, 'Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu')")
            ->orderBy('mulai')
            ->get();
        return new CrudResource('success', 'Data Jadwal', $data);
    }

    // public function show($id)
    // {
    //     $data = Jadwal::with('dosen', 'dosen_1', 'matkul', 'ruangan', 'prodi')->findOrFail($id);
    //     return new CrudResource('success', 'Data Jadwal', $data);
    // }

}
