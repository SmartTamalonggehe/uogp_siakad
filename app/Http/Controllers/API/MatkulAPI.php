<?php

namespace App\Http\Controllers\API;

use App\Models\Matkul;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Resources\CrudResource;

class MatkulAPI extends Controller
{
    function index(Request $request)
    {
        $search = $request->search;
        $limit = $request->limit;
        $prodi_id = $request->prodi_id;
        $data = Matkul::where('nm_matkul', 'like', "%$search%")
            ->when($prodi_id, function ($query) use ($prodi_id) {
                return $query->where('prodi_id', $prodi_id);
            })
            ->orderBy('nm_matkul', 'asc')
            ->paginate($limit);
        return new CrudResource('success', 'Data Matkul', $data);
    }

    function all(Request $request)
    {
        $search = $request->search;
        $prodi_id = $request->prodi_id;
        $data = Matkul::where('nm_matkul', 'like', "%$search%")
            ->when($prodi_id, function ($query) use ($prodi_id) {
                return $query->where('prodi_id', $prodi_id);
            })
            ->orderBy('nm_matkul', 'asc')
            ->get();
        return new CrudResource('success', 'Data Matkul', $data);
    }
}
