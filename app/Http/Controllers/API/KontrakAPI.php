<?php

namespace App\Http\Controllers\API;

use App\Models\Kontrak;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Resources\CrudResource;
use App\Models\KontrakDet;

class KontrakAPI extends Controller
{
    function index(Request $request)
    {
        $limit = $request->limit;
        $semester = $request->semester;
        $tahun = $request->tahun;
        $mhs_id = $request->mhs_id;
        $data = KontrakDet::with(['kontrak', 'mhs.prodi', 'jadwal.matkul'])
            ->whereHas('kontrak', function ($query) use ($semester, $tahun) {
                $query->when($semester, function ($query) use ($semester) {
                    $query->where('semester', $semester);
                });
                $query->when($tahun, function ($query) use ($tahun) {
                    $query->where('tahun', $tahun);
                });
            })
            ->whereHas('mhs', function ($query) use ($mhs_id) {
                $query->when($mhs_id, function ($query) use ($mhs_id) {
                    $query->where('mhs_id', $mhs_id);
                });
            })
            ->paginate($limit);
        return new CrudResource('success', 'Data Fakultas', $data);
    }

    function all(Request $request)
    {
        $semester = $request->semester;
        $tahun = $request->tahun;
        $mhs_id = $request->mhs_id;
        $prodi_id = $request->prodi_id;
        $data = KontrakDet::with(['kontrak', 'mhs.prodi', 'jadwal.matkul'])
            ->whereHas('kontrak', function ($query) use ($semester, $tahun) {
                $query->when($semester, function ($query) use ($semester) {
                    $query->where('semester', $semester);
                });
                $query->when($tahun, function ($query) use ($tahun) {
                    $query->where('tahun', $tahun);
                });
            })
            ->when($mhs_id, function ($query) use ($mhs_id) {
                $query->whereHas('mhs', function ($query) use ($mhs_id) {
                    $query->where('mhs_id', $mhs_id);
                });
            })
            ->when($prodi_id, function ($query) use ($prodi_id) {
                $query->whereHas('mhs', function ($query) use ($prodi_id) {
                    $query->where('prodi_id', $prodi_id);
                });
            })
            ->get();
        return new CrudResource('success', 'Data Fakultas', $data);
    }
}
