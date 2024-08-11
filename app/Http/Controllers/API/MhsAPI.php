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
        $limit = $request->limit;
        $data = Mhs::with('prodi.fakultas')
            ->where('nm_mhs', 'like', "%$search%")
            ->orderBy('nm_mhs', 'asc')
            ->paginate($limit);
        return new CrudResource('success', 'Data Mhs', $data);
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
        $data = Mhs::with('prodi.fakultas')
            ->where('nm_mhs', 'like', "%$search%")
            ->when($prodi_id, function ($query) use ($prodi_id) {
                $query->where('prodi_id', $prodi_id);
            })
            ->orderBy('prodi_id', 'asc')
            ->orderBy('nm_mhs', 'asc')
            ->get();
        return new CrudResource('success', 'Data Mhs', $data);
    }
}
