<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        User::create([
            'id' => 999,
            'name' => 'Admin',
            'email' => 'smartspartacus@fstuogp.com',
            'password' => Hash::make('smartspartacus'),
            'show_password' => '',
            'role' => 'admin'
        ]);
        User::create([
            'id' => 1, // fakultas_id
            'name' => 'FE',
            'email' => 'fakultas@febuogp.com',
            'password' => Hash::make('12345678'),
            'show_password' => '',
            'role' => 'fakultas'
        ]);
        // User::create([
        //     'id' => 2, // fakultas_id
        //     'name' => 'FST',
        //     'email' => 'admin@fstuogp.com',
        //     'password' => Hash::make('12345678'),
        //     'show_password' => '',
        //     'role' => 'fakultas'
        // ]);
        User::create([
            'id' => 31, // prodi_id
            'name' => 'Manajemen',
            'email' => 'manajemen@febuogp.com',
            'password' => Hash::make('12345678'),
            'show_password' => '',
            'role' => 'prodi'
        ]);
        User::create([
            'id' => 32, // prodi_id
            'name' => 'Ekonomi Pembangunan',
            'email' => 'ekbang@febuogp.com',
            'password' => Hash::make('12345678'),
            'show_password' => '',
            'role' => 'prodi'
        ]);
        User::create([
            'id' => 33, // prodi_id
            'name' => 'Akuntansi',
            'email' => 'akuntansi@febuogp.com',
            'password' => Hash::make('12345678'),
            'show_password' => '',
            'role' => 'prodi'
        ]);

        User::create([
            'id' => 34, // prodi_id
            'name' => 'Master Manajemen',
            'email' => 'mm@febuogp.com',
            'password' => Hash::make('12345678'),
            'show_password' => '',
            'role' => 'prodi'
        ]);
    }
}
