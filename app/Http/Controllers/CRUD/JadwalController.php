<?php

namespace App\Http\Controllers\CRUD;

use App\Models\Jadwal;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Resources\CrudResource;
use Illuminate\Support\Facades\Validator;

class JadwalController extends Controller
{
    protected function spartaValidation($request, $id = "")
    {
        $required = "";
        if ($id == "") {
            $required = "required";
        }
        $rules = [
            'dosen_id' => 'required',
            'prodi_id' => 'required',
            'matkul_id' => 'required',
            'ruangan_id' => 'required',
            'hari' => 'required',
            'mulai' => 'required',
            'seles' => 'required',
            'semester' => 'required',
            'tahun' => 'required',
        ];

        $messages = [
            'dosen_id.required' => 'Dosen harus diisi.',
            'matkul_id.required' => 'Matkul harus diisi.',
            'ruangan_id.required' => 'Ruangan harus diisi.',
            'prodi_id.required' => 'Prodi harus diisi.',
            'hari.required' => 'Hari harus diisi.',
            'mulai.required' => 'Jam Mulai harus diisi.',
            'seles.required' => 'Jam Selesai harus diisi.',
            'semester.required' => 'Semester harus diisi.',
            'tahun.required' => 'Tahun harus diisi.',
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
        $semester = $request->semester;
        $tahun = $request->tahun;
        $search = $request->search;
        $prodi_id = $request->prodi_id;
        $fakultas_id = $request->fakultas_id;
        $reguler = $request->reguler;
        $data = Jadwal::with(['dosen', 'dosen_1', 'matkul', 'ruangan', 'prodi'])
            ->where(function ($query) use ($search) {
                $query->where('hari', 'like', "%$search%")
                    ->orWhereHas('matkul', function ($mhs) use ($search) {
                        $mhs->where('nm_matkul', 'like', "%$search%")
                            ->orWhere('singkat', 'like', "%$search%");
                    });
            })
            ->when($fakultas_id, function ($query) use ($fakultas_id) {
                $query->whereHas('prodi', function ($prodi) use ($fakultas_id) {
                    $prodi->where('fakultas_id', $fakultas_id);
                });
            })
            ->when($prodi_id, function ($query) use ($prodi_id) {
                $query->where('prodi_id', $prodi_id);
            })
            ->when($reguler, function ($query) use ($reguler) {
                $query->where('reguler', $reguler);
            })
            ->where([
                ['semester', $semester],
                ['tahun', $tahun],
            ])
            ->orderByRaw("FIELD(hari, 'Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu')")
            ->orderBy('mulai')
            ->paginate(10);
        return new CrudResource('success', 'Data Jadwal', $data);
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
        Jadwal::create($data_req);

        $data = Jadwal::with(['dosen', 'matkul', 'ruangan', 'prodi'])->latest()->first();

        return new CrudResource('success', 'Data Berhasil Disimpan', $data);
    }

    /**
     * Display the specified resource.
     */
    public function show($id)
    {
        $data = Jadwal::with(['dosen', 'matkul', 'ruangan', 'prodi'])->find($id);

        return new CrudResource('success', 'Data Jadwal', $data);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, $id)
    {
        $data_req = $request->all();
        // return $data_req;
        $validate = $this->spartaValidation($data_req);
        if ($validate) {
            return $validate;
        }

        Jadwal::find($id)->update($data_req);

        $data = Jadwal::with(['dosen', 'matkul', 'ruangan', 'prodi'])->find($id);

        return new CrudResource('success', 'Data Berhasil Diubah', $data);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        $data = Jadwal::findOrFail($id);
        // delete data
        $data->delete();

        return new CrudResource('success', 'Data Berhasil Dihapus', $data);
    }
}
