<?php

namespace App\Http\Controllers\CRUD;

use App\Models\User;
use App\Models\Dosen;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use App\Http\Resources\CrudResource;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use App\Http\Controllers\TOOLS\MakeAccountController;

class DosenController extends Controller
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
            'nm_dosen' => 'required',
            'jenkel' => 'required',
            'email' => [
                Rule::unique('users')->where(function ($query) use ($request, $id) {
                    return $query->where('email', $request['email']);
                }),
            ],
        ];

        $messages = [
            'nm_dosen.required' => 'Nama dosen harus diisi.',
            'jenkel.required' => 'Jenkel harus diisi.',
            'email.unique' => 'Email sudah terdaftar. Silahkan Mengubah Nama.',
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
        $data = Dosen::with(['user'])->where('nm_dosen', 'like', "%$search%")
            ->when($sortby, function ($query) use ($sortby, $order) {
                $query->orderBy($sortby, $order ?? 'asc');
            })
            ->paginate(10);
        return new CrudResource('success', 'Data Dosen', $data);
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

        DB::beginTransaction();

        try {
            // membuat password
            $password = $this->makeAccount->password();
            // membuat email
            $email = $this->makeAccount->email($data_req['nm_dosen']);
            // add email to data_req
            $data_req['email'] = $email;
            // cek validasi
            $validate = $this->spartaValidation($data_req);
            if ($validate) {
                return $validate;
            }

            // input data user
            $user = User::create([
                'id' => $data_req['id'],
                'name' => $data_req['nm_dosen'],
                'email' => $email,
                'password' => Hash::make($password),
                'show_password' => $password,
                'role' => 'dosen',
            ]);

            $data_req["user_id"] = $user->id;
            // remove email from data_req
            unset($data_req['email']);
            Dosen::create($data_req);
            $data = Dosen::with(['user'])
                ->latest()->first();
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

        Dosen::find($id)->update($data_req);

        $data = Dosen::with('user')->find($id);

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
        $data = Dosen::findOrFail($id);
        // delete user
        $data->delete();
        $user = User::find($data->user_id);
        $user->delete();
        // delete data

        return new CrudResource('success', 'Data Berhasil Dihapus', $data);
    }
}
