<?php

namespace Database\Seeders;

use App\Http\Controllers\TOOLS\MakeAccountController;
use App\Models\Mhs;
use App\Models\LoginMhs;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;

class MhsSeeder extends Seeder
{
    protected $makeAccount;

    // make construct
    public function __construct()
    {
        $this->makeAccount = new MakeAccountController();
    }
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $data = [];
        $url = "https://back.edom.fstuogp.com/api/mhs";
        $getContent = file_get_contents("$url");
        $decodeContent = json_decode($getContent);
        $lastPage = $decodeContent->data->last_page;
        for ($i = 1; $i <= $lastPage; $i++) {
            sleep(1);
            $json = file_get_contents("$url?page=$i");
            $jsonDecode = json_decode($json);
            array_push($data, $jsonDecode->data->data);
        }

        foreach ($data as $obj) {
            foreach ($obj as $item) {
                // random charachter
                $characters = '0123456789abcdefghijklmnopqrstuvwxyz-_';
                $password = '';
                for ($i = 0; $i < 8; $i++) {
                    $index = rand(0, strlen($characters) - 1);
                    $password .= $characters[$index];
                }
                //    remove 6 frist character
                $mhs = Mhs::create([
                    'prodi_id' => $item->prodi_id,
                    'NPM' => $item->NPM,
                    'nm_mhs' => $item->nama,
                    'jenkel' => $item->jenkel,
                    'thn_angkatan' => $item->thn_angkatan,
                    'status' => 'aktif',

                ]);
                // mengambil 2 angka pertama dari thn_angkatan
                // $thn_angkatan = substr($item->thn_angkatan, -2);
                // $NPM = "{$item->prodi->kode}$thn_angkatan{$item->NPM}";
                // input data login mhs
                // membuat email
                $email = $this->makeAccount->email($item->nama);
                LoginMhs::create([
                    'mhs_id' => $mhs->id,
                    'email' => $email,
                    'password' => Hash::make($password),
                    'show_password' => $password,
                ]);
            }
        }
    }
}
