<?php

namespace Database\Seeders;

use App\Models\User;
use App\Models\Dosen;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use App\Http\Controllers\TOOLS\MakeAccountController;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;

class DosenSeeder extends Seeder
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
        $url = "https://back.edom.fstuogp.com/api/dosen";
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
                // user
                $password = $this->makeAccount->password();
                $email = $this->makeAccount->email($password);
                $user = User::create([
                    'name' => $item->nama,
                    'email' => $email,
                    'password' => Hash::make($password),
                    'show_password' => $password,
                    'role' => 'dosen',
                ]);
                //    remove 6 frist character
                Dosen::create([
                    'user_id' => $user->id,
                    'id' => $item->id,
                    'NIDN' => $item->NIDN,
                    'nm_dosen' => $item->nama,
                    'jenkel' => $item->jenkel,
                ]);
            }
        }
    }
}
