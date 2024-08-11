<?php

namespace App\Http\Controllers\API;

use App\Models\Fakultas;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Resources\CrudResource;

class FakultasAPI extends Controller
{
    function index(Request $request)
    {
        $search = $request->search;
        $limit = $request->limit;
        $data = Fakultas::where('nm_fakultas', 'like', "%$search%")
            ->orderBy('nm_fakultas', 'asc')
            ->paginate($limit);
        return new CrudResource('success', 'Data Fakultas', $data);
    }

    function all(Request $request)
    {
        $search = $request->search;
        $data = Fakultas::where('nm_fakultas', 'like', "%$search%")
            ->orderBy('nm_fakultas', 'asc')
            ->get();
        return new CrudResource('success', 'Data Fakultas', $data);
    }
}
