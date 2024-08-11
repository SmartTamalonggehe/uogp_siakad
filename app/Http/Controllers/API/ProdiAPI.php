<?php

namespace App\Http\Controllers\API;

use App\Models\Prodi;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Resources\CrudResource;

class ProdiAPI extends Controller
{
    function index(Request $request)
    {
        $search = $request->search;
        $limit = $request->limit;
        $data = Prodi::with('fakultas')
            ->where('nm_prodi', 'like', "%$search%")
            ->orderBy('nm_prodi', 'asc')
            ->paginate($limit);
        return new CrudResource('success', 'Data Prodi', $data);
    }

    function all(Request $request)
    {
        $search = $request->search;
        $fakultas_id = $request->fakultas_id;
        $data = Prodi::with('fakultas')
            ->where('nm_prodi', 'like', "%$search%")
            ->when($fakultas_id, function ($query) use ($fakultas_id) {
                $query->where('fakultas_id', $fakultas_id);
            })
            ->orderBy('fakultas_id', 'asc')
            ->orderBy('nm_prodi', 'asc')
            ->get();
        return new CrudResource('success', 'Data Prodi', $data);
    }
}
