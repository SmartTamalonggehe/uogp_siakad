<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class AuthController extends Controller
{
    function login(Request $request)
    {
        $validator = Validator::make(
            $request->all(),
            [
                'email' => 'required|string|email|max:255',
                'password' => 'required',
            ],
            [
                'email.required' => 'Email harus diisi',
                'password.required' => 'Password harus diisi',
                'email.email' => 'Email tidak valid',
                'email.max' => 'Email maksimal 255 karakter',
            ]
        );
        if ($validator->fails()) {
            return response()->json([
                'status' => false,
                'message' => $validator->errors()->first(),
            ], 422);
        }

        // check email and password
        if (!Auth::attempt($request->only('email', 'password'))) {
            return response()->json([
                'status' => false,
                'message' => 'Kombinasi email dan password salah',
            ], 401);
        }
        // mengambil email
        $user = User::where('email', $request['email'])->firstOrFail();
        // membuat token
        $token = $user->createToken('authToken')->accessToken;

        return response()->json([
            'status' => true,
            'role' => $user->role,
            'token' => $token,
            'user' => [
                'id' => $user->id,
                'name' => $user->name,
                'email' => $user->email,
                'role' => $user->role
            ]
        ]);
    }

    function cekToken(Request $request)
    {
        $user = $request->user();
        return response()->json([
            'status' => true,
            'role' => $user->role,
        ]);
    }

    function logout(Request $request)
    {
        $token = $request->user()->token(); // Akses token terlebih dahulu
        $token->revoke(); // Cabut tokennya
        return response()->json([
            'status' => true,
            'message' => 'Logout Berhasil',
        ]);
    }
}
