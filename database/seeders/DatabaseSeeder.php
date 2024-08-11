<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // call seed
        $this->call([
            UserSeeder::class,
            FakultasSeeder::class,
            // ProdiSeeder::class,
            // RuanganSeeder::class,
            // MatkulSeeder::class,
            // DosenSeeder::class,
            // JadwalSeeder::class,
            // MhsSeeder::class,
        ]);
    }
}
