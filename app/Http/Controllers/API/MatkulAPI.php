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
        $data = Matkul::where('nm_matkul', 'like', "%$search%")
            ->orderBy('nm_matkul', 'asc')
            ->paginate($limit);
        return new CrudResource('success', 'Data Matkul', $data);
    }

    function all(Request $request)
    {
        $search = $request->search;
        $data = Matkul::where('nm_matkul', 'like', "%$search%")
            ->orderBy('nm_matkul', 'asc')
            ->get();
        return new CrudResource('success', 'Data Matkul', $data);
    }
}
