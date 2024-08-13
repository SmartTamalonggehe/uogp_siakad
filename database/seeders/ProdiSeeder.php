<?php

namespace Database\Seeders;

use App\Models\Prodi;
use Illuminate\Database\Seeder;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;

class ProdiSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // FST
        Prodi::create([
            'id' => 21,
            'fakultas_id' => 2,
            'kode' => 5720,
            'nm_prodi' => 'Sistem Informasi',
            'singkat' => 'SI',
        ]);
        Prodi::create([
            'id' => 22,
            'fakultas_id' => 2,
            'kode' => 4134,
            'nm_prodi' => 'Biologi',
            'singkat' => 'BI',
        ]);
        Prodi::create([
            'id' => 23,
            'fakultas_id' => 2,
            'kode' => 2345,
            'nm_prodi' => 'Teknik Geologi',
            'singkat' => 'TG',
        ]);
        // FEB
        Prodi::create([
            'id' => 31,
            'fakultas_id' => 1,
            'kode' => 6121,
            'nm_prodi' => 'Manajemen',
            'singkat' => 'MA',
        ]);
        Prodi::create([
            'id' => 32,
            'fakultas_id' => 1,
            'kode' => 6021,
            'nm_prodi' => 'Ekonomi Pembangunan',
            'singkat' => 'EKBANG',
        ]);
        Prodi::create([
            'id' => 33,
            'fakultas_id' => 1,
            'kode' => 6221,
            'nm_prodi' => 'Akuntansi',
            'singkat' => 'AK',
        ]);
        // FPKK
        Prodi::create([
            'id' => 41,
            'fakultas_id' => 3,
            'kode' => 5420,
            'nm_prodi' => 'Agribisnis',
            'singkat' => 'AG',
        ]);
        Prodi::create([
            'id' => 42,
            'fakultas_id' => 3,
            'kode' => 5421,
            'nm_prodi' => 'Agroteknologi',
            'singkat' => 'AT',
        ]);
        Prodi::create([
            'id' => 43,
            'fakultas_id' => 3,
            'kode' => 5425,
            'nm_prodi' => 'Kehutanan',
            'singkat' => 'KH',
        ]);
        Prodi::create([
            'id' => 44,
            'fakultas_id' => 3,
            'kode' => 5427,
            'nm_prodi' => 'Manajemen Sumberdaya Perairan',
            'singkat' => 'MSDP',
        ]);
        // magister
        Prodi::create([
            'id' => 51,
            'fakultas_id' => 4,
            'kode' => 6111,
            'nm_prodi' => 'Magister Manajemen',
            'singkat' => 'MM',
        ]);
    }
}
