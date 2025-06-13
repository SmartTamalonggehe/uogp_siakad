<?php

namespace App\Http\Controllers\API;

use App\Models\Dosen;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Resources\CrudResource;

class DosenAPI extends Controller
{

    function index(Request $request)
    {
        $search = $request->search;
        $limit = $request->limit;
        $jabatan = $request->jabatan ?? 'dosen';
        $struktural = $request->struktural ?? false;
        $data = Dosen::with('struktural.prodi.fakultas')->where('nm_dosen', 'like', "%$search%")
            ->where('jabatan', $jabatan)
            ->when($struktural, function ($query) {
                return $query->whereHas('struktural');
            })
            ->orderBy('nm_dosen', 'asc')
            ->paginate($limit);
        return new CrudResource('success', 'Data dosen', $data);
    }

    function show($id)
    {
        $data = Dosen::findOrFail($id);
        return new CrudResource('success', 'Data Dosen', $data);
    }

    function all(Request $request)
    {
        $search = $request->search;
        $jabatan = $request->jabatan ?? 'dosen';
        $semua = $request->semua ?? false;
        $struktural = $request->struktural ?? false;
        $data = Dosen::with('struktural.prodi.fakultas')->where('nm_dosen', 'like', "%$search%")
            ->when(!$semua, function ($query) use ($jabatan) {
                return $query->where('jabatan', $jabatan);
            })
            ->when($struktural, function ($query) {
                return $query->whereHas('struktural');
            })
            ->orderBy('nm_dosen', 'asc')
            ->get();
        return new CrudResource('success', 'Data dosen', $data);
    }
}
