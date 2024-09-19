<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('mhs', function (Blueprint $table) {
            $table->uuid('id')->primary();
            $table->foreignId('prodi_id')->constrained('prodi')->cascadeOnDelete()->cascadeOnUpdate();
            $table->string('NPM', 4); // 120004
            $table->string('nm_mhs', 150);
            $table->string('jenkel', 10);
            $table->year('thn_angkatan', 10);
            $table->string('status', 14)->default('aktif'); //aktif tidak aktif lulus
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('mhs');
    }
};
