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
        $data = Jadwal::with(['dosen', 'dosen_1', 'matkul', 'ruangan', 'prodi.fakultas'])
            ->where([
                ['semester', 'like', "%$semester%"],
                ['tahun', 'like', "%$tahun%"],
                ['prodi_id', 'like', "%$prodi_id%"],
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
                $query->where('dosen_id', $dosen_id)
                    ->orWhere('dosen_id_1', $dosen_id);
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
                $query->where('dosen_id', $dosen_id)
                    ->orWhere('dosen_id_1', $dosen_id);
            })
            ->orderByRaw("FIELD(hari, 'Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu')")
            ->orderBy('mulai')
            ->get();
        return new CrudResource('success', 'Data Jadwal', $data);
    }

    public function show($id)
    {
        $data = Jadwal::with('dosen', 'dosen_1', 'matkul', 'ruangan', 'prodi')->findOrFail($id);
        return new CrudResource('success', 'Data Jadwal', $data);
    }
}
