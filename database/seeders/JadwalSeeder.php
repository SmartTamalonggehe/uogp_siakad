<?php

namespace Database\Seeders;

use App\Models\Jadwal;
use Illuminate\Database\Seeder;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;

class JadwalSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $data = [];
        $url = "https://back.edom.fstuogp.com/api/jadwal";
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
                //    remove 6 frist character
                Jadwal::create([
                    // 'id' => $item->id,
                    'prodi_id' => $item->prodi_id,
                    'matkul_id' => $item->matkul_id,
                    'dosen_id' => $item->dosen_id,
                    'ruangan_id' => $item->ruangan_id,
                    'hari' => $item->hari,
                    'mulai' => $item->mulai,
                    'seles' => $item->seles,
                    'semester' => $item->semester,
                    'tahun' => $item->tahun,
                ]);
            }
        }
    }
}
