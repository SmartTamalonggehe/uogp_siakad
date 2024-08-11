<?php

namespace App\Http\Controllers\CRUD;

use App\Models\Matkul;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Resources\CrudResource;
use Illuminate\Support\Facades\Validator;

class MatkulController extends Controller
{
    protected function spartaValidation($request, $id = "")
    {
        $required = "";
        if ($id == "") {
            $required = "required";
        }
        $rules = [
            'prodi_id' => 'required',
            'kd_matkul' => 'required|unique:matkul,kd_matkul,' . $id,
        ];

        $messages = [
            'prodi_id.required' => 'Prodi harus diisi.',
            'kd_matkul.required' => 'Kode matkul harus diisi.',
            'kd_matkul.unique' => 'Kode matkul sudah terdaftar.',
        ];
        $validator = Validator::make($request, $rules, $messages);

        if ($validator->fails()) {
            $message = [
                'judul' => 'Gagal',
                'type' => 'error',
                'message' => $validator->errors()->first(),
            ];
            return response()->json($message, 400);
        }
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $search = $request->search;
        $prodi_id = $request->prodi_id;
        $sortby = $request->sortby;
        $order = $request->order;
        $data = Matkul::with('prodi.fakultas')
            ->where(function ($query) use ($search) {
                $query->where('singkat', 'like', "%$search%")
                    ->orWhere('nm_matkul', 'like', "%$search%")
                    ->orWhere('kd_matkul', 'like', "%$search%");
            })
            ->when($sortby, function ($query) use ($sortby, $order) {
                $query->orderBy($sortby, $order ?? 'asc');
            })
            ->where('prodi_id', 'like', "%$prodi_id%")
            ->paginate(10);
        return new CrudResource('success', 'Data Matkul', $data);
    }
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $data_req = $request->all();
        // return $data_req;
        $validate = $this->spartaValidation($data_req);
        if ($validate) {
            return $validate;
        }
        Matkul::create($data_req);

        $data = Matkul::with('prodi.fakultas')
            ->latest()->first();

        return new CrudResource('success', 'Data Berhasil Disimpan', $data);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $data_req = $request->all();
        // return $data_req;
        $validate = $this->spartaValidation($data_req, $id);
        if ($validate) {
            return $validate;
        }

        Matkul::find($id)->update($data_req);

        $data = Matkul::with('prodi.fakultas')
            ->find($id);

        return new CrudResource('success', 'Data Berhasil Diubah', $data);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $data = Matkul::findOrFail($id);
        // delete data
        $data->delete();

        return new CrudResource('success', 'Data Berhasil Dihapus', $data);
    }
}
