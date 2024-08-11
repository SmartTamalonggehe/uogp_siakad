<?php

namespace App\Http\Controllers\CRUD;

use App\Models\Kontrak;
use App\Models\KontrakDet;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use App\Http\Resources\CrudResource;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Validator;

class KontrakController extends Controller
{
    protected function spartaValidation($request, $id = "")
    {
        $required = "";
        if ($id == "") {
            $required = "required";
        }
        $rules = [
            'prodi_id' => 'required',
        ];

        $messages = [
            'prodi_id.required' => 'Prodi harus diisi.',
        ];
        $validator = Validator::make($request, $rules, $messages);

        if ($validator->fails()) {
            $message = [
                'type' => 'error',
                'message' => $validator->errors()->first(),
            ];
            return response()->json($message, 400);
        }
    }
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $search = $request->search;
        $prodi_id = $request->prodi_id;
        $semester = $request->semester;
        $tahun = $request->tahun;

        $data = Kontrak::with(['kontrakDet' => function ($query) {
            $query->with(['mhs.prodi', 'jadwal.matkul']);
        }])
            ->where(['prodi_id' => $prodi_id, 'semester' => $semester, 'tahun' => $tahun])
            ->whereHas('kontrakDet.mhs', function ($query) use ($search) {
                $query->where('nm_mhs', 'like', "%$search%");
            })
            ->paginate(10);

        return new CrudResource('success', 'Data Kontrak', $data);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $data_req = $request->all();
        // return $data_req;
        $validate = $this->spartaValidation($data_req);
        if ($validate) {
            return $validate;
        }
        // get kontrak
        $dtKontrak = Kontrak::where(['prodi_id' => $data_req['prodi_id'], 'semester' => $data_req['semester'], 'tahun' => $data_req['tahun']])->pluck('id')->toArray();
        if ($dtKontrak) {
            // find in kontrak det
            $dtKontrakDet = KontrakDet::whereIn('kontrak_id', $dtKontrak)->where('mhs_id', $data_req['mhs_id'])->first();
            if ($dtKontrakDet) {
                return response()->json([
                    'judul' => 'Gagal',
                    'type' => 'error',
                    'message' => "Mahasiswa sudah terdaftar di semester ini",
                ], 400);
            }
        }
        DB::beginTransaction();
        try {
            $req_kontrak = Arr::except($data_req, ['det', 'mhs_id']);
            $req_kontrak_det = Arr::only($data_req, ['det']);
            Kontrak::create($req_kontrak);
            $data = Kontrak::with(['prodi'])->latest()->first();
            // looping kontrak det
            foreach ($req_kontrak_det["det"] as $value) {
                // input data kontrak_det
                KontrakDet::create([
                    'kontrak_id' => $data->id,
                    'jadwal_id' => $value['id'],
                    'mhs_id' => $data_req['mhs_id'],
                ]);
            }
            DB::commit();
            return new CrudResource('success', 'Data Berhasil Disimpan', $data);
        } catch (\Throwable $th) {
            // jika terdapat kesalahan
            DB::rollback();
            $message = [
                'judul' => 'Gagal',
                'type' => 'error',
                'message' => $th->getMessage(),
            ];
            return response()->json($message, 400);
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $data_req = $request->all();
        // return $data_req;
        $validate = $this->spartaValidation($data_req);
        if ($validate) {
            return $validate;
        }

        Kontrak::find($id)->update($data_req);

        $data = Kontrak::with(['mhs.prodi', 'jadwal.matkul'])->find($id);

        return new CrudResource('success', 'Data Berhasil Diubah', $data);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $data = Kontrak::findOrFail($id);
        // delete data
        $data->delete();

        return new CrudResource('success', 'Data Berhasil Dihapus', $data);
    }
}
