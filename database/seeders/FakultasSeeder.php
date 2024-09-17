<?php

namespace Database\Seeders;

use App\Models\Fakultas;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class FakultasSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Fakultas::create([
            'id' => 1,
            'nm_fakultas' => 'Fakultas Ekonomi dan Bisnis',
            'singkat' => 'FE',
        ]);

        Fakultas::create([
            'id' => 2,
            'nm_fakultas' => 'Fakultas Sains & Teknologi',
            'singkat' => 'FST',
        ]);

        Fakultas::create([
            'id' => 3,
            'nm_fakultas' => 'Fakultas Pertanian, Kehutanan & Kelautan',
            'singkat' => 'FPKK',
        ]);

        Fakultas::create([
            'id' => 999,
            'nm_fakultas' => 'UMUM',
            'singkat' => 'UM',
        ]);
    }
}
