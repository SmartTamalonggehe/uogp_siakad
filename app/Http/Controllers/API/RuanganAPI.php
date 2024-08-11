<?php

namespace App\Http\Controllers\API;

use App\Models\Ruangan;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Resources\CrudResource;

class RuanganAPI extends Controller
{
    function index(Request $request)
    {
        $search = $request->search;
        $limit = $request->limit;
        $data = Ruangan::with('fakultas')
            ->where('nm_ruangan', 'like', "%$search%")
            ->orderBy('fakultas_id', 'asc')
            ->orderBy('nm_ruangan', 'asc')
            ->paginate($limit);
        return new CrudResource('success', 'Data Ruangan', $data);
    }

    function all(Request $request)
    {
        $search = $request->search;
        $data = Ruangan::with('fakultas')
            ->where('nm_ruangan', 'like', "%$search%")
            ->orderBy('fakultas_id', 'asc')
            ->orderBy('nm_ruangan', 'asc')
            ->get();
        return new CrudResource('success', 'Data Ruangan', $data);
    }
}
