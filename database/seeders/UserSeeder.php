<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;

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
            'email' => 'admin@mail.com',
            'password' => Hash::make('12345678'),
            'show_password' => '',
            'role' => 'admin'
        ]);
        User::create([
            'id' => 1, // fakultas_id
            'name' => 'FE',
            'email' => 'admin@feuogp.ac.id',
            'password' => Hash::make('12345678'),
            'show_password' => '',
            'role' => 'FE'
        ]);
        User::create([
            'id' => 2, // fakultas_id
            'name' => 'FST',
            'email' => 'admin@fstuogp.com',
            'password' => Hash::make('12345678'),
            'show_password' => '',
            'role' => 'FST'
        ]);
    }
}
