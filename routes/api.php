<?php

use Illuminate\Support\Facades\Route;


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

Route::middleware(['myThorottle'])->group(function () {
    // fakultas
    Route::prefix('fakultas')->group(function () {
        Route::get('/', [App\Http\Controllers\API\FakultasAPI::class, 'index']);
        Route::get('all', [App\Http\Controllers\API\FakultasAPI::class, 'all']);
    });
    // prodi
    Route::prefix('prodi')->group(function () {
        Route::get('/', [App\Http\Controllers\API\ProdiAPI::class, 'index']);
        Route::get('all', [App\Http\Controllers\API\ProdiAPI::class, 'all']);
    });
    // ruangan
    Route::prefix('ruangan')->group(function () {
        Route::get('/', [App\Http\Controllers\API\RuanganAPI::class, 'index']);
        Route::get('all', [App\Http\Controllers\API\RuanganAPI::class, 'all']);
    });
    // dosen
    Route::prefix('dosen')->group(function () {
        Route::get('/', [App\Http\Controllers\API\DosenAPI::class, 'index']);
        Route::get('all', [App\Http\Controllers\API\DosenAPI::class, 'all']);
        Route::get('{id}', [App\Http\Controllers\API\DosenAPI::class, 'show']);
    });
    // matkul
    Route::prefix('matkul')->group(function () {
        Route::get('/', [App\Http\Controllers\API\MatkulAPI::class, 'index']);
        Route::get('all', [App\Http\Controllers\API\MatkulAPI::class, 'all']);
    });
    // mhs
    Route::prefix('mhs')->group(function () {
        Route::get('/', [App\Http\Controllers\API\MhsAPI::class, 'index']);
        Route::get('kontrak', [App\Http\Controllers\API\MhsAPI::class, 'kontrak']);
        Route::get('all', [App\Http\Controllers\API\MhsAPI::class, 'all']);
        Route::get('active', [App\Http\Controllers\API\MhsAPI::class, 'active']);              // GET /api/mhs/active - Active only (legacy)
        Route::get('filter-options', [App\Http\Controllers\API\MhsAPI::class, 'filterOptions']); // GET /api/mhs/filter-options - Get filter options
        Route::get('statistics', [App\Http\Controllers\API\MhsAPI::class, 'statistics']);
    });
    // jadwal
    Route::prefix('jadwal')->group(function () {
        Route::get('/', [App\Http\Controllers\API\JadwalAPI::class, 'index']);
        Route::get('filter-options', [App\Http\Controllers\API\JadwalAPI::class, 'filterOptions']);
        Route::get('byDosen', [App\Http\Controllers\API\JadwalAPI::class, 'byDosen']);
        Route::get('byDosenFull', [App\Http\Controllers\API\JadwalAPI::class, 'byDosenFull']);
        Route::get('byJadwal', [App\Http\Controllers\API\JadwalAPI::class, 'byJadwal']);
        Route::get('byTahunSemester', [App\Http\Controllers\API\JadwalAPI::class, 'byTahunSemester']);
        Route::get('{id}', [App\Http\Controllers\API\JadwalAPI::class, 'show']);
    });
    // kontrak
    Route::prefix('kontrak')->group(function () {
        Route::get('/', [App\Http\Controllers\API\KontrakAPI::class, 'index']);
        Route::get('all', [App\Http\Controllers\API\KontrakAPI::class, 'all']);
    });
});

Route::middleware(['myThorottle', 'auth:api'])->group(function () {});
