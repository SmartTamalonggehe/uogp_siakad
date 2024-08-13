<?php

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

use Illuminate\Support\Facades\Route;

Route::middleware(['myThorottle', 'auth:api', "role:admin,fakultas"])->group(function () {
    Route::resources([
        'prodi' => App\Http\Controllers\CRUD\ProdiController::class,
        'ruangan' => App\Http\Controllers\CRUD\RuanganController::class,
        'matkul' => App\Http\Controllers\CRUD\MatkulController::class,
        'dosen' => App\Http\Controllers\CRUD\DosenController::class,
        'jadwal' => App\Http\Controllers\CRUD\JadwalController::class,
        'mhs' => App\Http\Controllers\CRUD\MhsController::class,
        'kontrak' => App\Http\Controllers\CRUD\KontrakController::class,
        'kontrakDet' => App\Http\Controllers\CRUD\KontrakDetController::class,
    ]);
});
