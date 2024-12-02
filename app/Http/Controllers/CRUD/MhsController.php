<?php

namespace App\Http\Controllers\CRUD;

use App\Models\Mhs;
use App\Models\User;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use App\Http\Resources\CrudResource;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use App\Http\Controllers\CRUD\LoginMhsController;
use App\Http\Controllers\TOOLS\MakeAccountController;

class MhsController extends Controller
{
    protected $makeAccount;

    // make construct
    public function __construct()
    {
        $this->makeAccount = new MakeAccountController();
    }

    protected function spartaValidation($request, $id = "")
    {
        $required = "";
        if ($id == "") {
            $required = "required";
        }
        $rules = [
            'nm_mhs' => 'required',
            'jenkel' => 'required',
        ];

        $messages = [
            'nm_mhs.required' => 'Nama mhs harus diisi.',
            'jenkel.required' => 'Jenkel harus diisi.',
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
        $sortby = $request->sortby;
        $order = $request->order;
        $prodi_id = $request->prodi_id;
        $data = Mhs::with(['user', 'prodi'])
            ->where(function ($query) use ($search) {
                $query->where('nm_mhs', 'like', "%$search%")
                    ->orWhereHas('prodi', function ($prodi) use ($search) {
                        $prodi->where('kode', 'like', "%$search%");
                    })
                    ->orWhere('thn_angkatan', 'like', "%$search%")
                    ->orWhere('NPM', 'like', "%$search%");
            })
            ->where('prodi_id', 'like', "%$prodi_id%")
            ->orderByRaw('prodi_id ASC, thn_angkatan DESC, NPM DESC')
            ->when($sortby, function ($query) use ($sortby, $order) {
                $query->orderBy($sortby, $order ?? 'asc');
            })
            ->paginate(10);
        return new CrudResource('success', 'Data Mhs', $data);
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
        DB::beginTransaction();

        try {
            // membuat password
            $password = $this->makeAccount->password();
            $email = $request->email;
            // cek input email ada
            if ($email) {
                // input data user
                $user = User::create([
                    'name' => $data_req['nm_mhs'],
                    'email' => $email,
                    'password' => Hash::make($password),
                    'show_password' => $password,
                    'role' => 'mhs',
                ]);
                $data_req["user_id"] = $user->id;
            }
            Mhs::create($data_req);
            $data = Mhs::with(['user', 'prodi'])->latest()->first();
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
        $validate = $this->spartaValidation($data_req);
        if ($validate) {
            return $validate;
        }

        Mhs::find($id)->update($data_req);

        $data = Mhs::with(['prodi', 'user'])->find($id);

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
        $data = Mhs::findOrFail($id);
        // delete user
        $data->delete();
        // delete data
        return new CrudResource('success', 'Data Berhasil Dihapus', $data);
    }
}
