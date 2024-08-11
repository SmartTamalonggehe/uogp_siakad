<?php

namespace App\Http\Controllers\API;

use App\Models\Jadwal;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use App\Http\Resources\CrudResource;

class JadwalAPI extends Controller
{
    public function index(Request $request)
    {
        $semester = $request->semester;
        $tahun = $request->tahun;
        $search = $request->search;
        $prodi_id = $request->prodi_id;
        $data = Jadwal::with(['dosen', 'matkul', 'ruangan', 'prodi.fakultas'])
            ->where(function ($query) use ($search) {
                $query->where('hari', 'like', "%$search%")
                    ->orWhereHas('matkul', function ($mhs) use ($search) {
                        $mhs->where('nm_mhs', 'like', "%$search%")
                            ->orWhere('singkat', 'like', "%$search%");
                    })
                    ->orWhereHas('dosen', function ($mhs) use ($search) {
                        $mhs->where('nm_dosen', 'like', "%$search%");
                    });
            })
            ->where([
                ['semester', 'like', "%$semester%"],
                ['tahun', 'like', "%$tahun%"],
                ['prodi_id', 'like', "%$prodi_id%"],
            ])
            ->orderByRaw("FIELD(hari, 'Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu')")
            ->orderBy('mulai')
            ->paginate(10);
        return new CrudResource('success', 'Data Jadwal', $data);
    }
    public function byDosen(Request $request)
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

    public function byDosenFull(Request $request)
    {
        $semester = $request->semester;
        $tahun = $request->tahun;
        $search = $request->search;
        $prodi_id = $request->prodi_id;
        $fakultas_id = $request->fakultas_id;
        $dosen_id = $request->dosen_id;

        $data = Jadwal::with(['dosen', 'matkul', 'ruangan', 'prodi.fakultas'])
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
                return $query->whereHas('dosen', function ($query) use ($dosen_id) {
                    $query->where('dosen_id', 'like', $dosen_id);
                });
            })
            ->where([
                ['semester',  $semester],
                ['tahun',  $tahun],
            ])
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

        $data = Jadwal::with('dosen', 'matkul', 'ruangan', 'prodi')
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
        $ruangan_id = $request->ruangan_id;
        $fakultas_id = $request->fakultas_id;
        // convert ruangan_id to array
        $ruangan_array = array_map('intval', explode(',', $ruangan_id));

        $data = Jadwal::with(['dosen', 'matkul', 'ruangan', 'prodi.fakultas'])
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
            ->when($ruangan_id, function ($query) use ($ruangan_array) {
                return $query->whereIn('ruangan_id', $ruangan_array);
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
            ->where([
                ['semester',  $semester],
                ['tahun',  $tahun],
            ])
            ->orderByRaw("FIELD(hari, 'Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu')")
            ->orderBy('mulai')
            ->get();
        return new CrudResource('success', 'Data Jadwal', $data);
    }

    public function show($id)
    {
        $data = Jadwal::with('dosen', 'matkul', 'ruangan', 'prodi')->findOrFail($id);
        return new CrudResource('success', 'Data Jadwal', $data);
    }
}