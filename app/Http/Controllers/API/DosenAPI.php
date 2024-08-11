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
        $data = Dosen::where('nm_dosen', 'like', "%$search%")
            ->orderBy('nm_dosen', 'asc')
            ->paginate($limit);
        return new CrudResource('success', 'Data Dosen', $data);
    }

    function all(Request $request)
    {
        $search = $request->search;
        $data = Dosen::where('nm_dosen', 'like', "%$search%")
            ->orderBy('nm_dosen', 'asc')
            ->get();
        return new CrudResource('success', 'Data Dosen', $data);
    }
}
