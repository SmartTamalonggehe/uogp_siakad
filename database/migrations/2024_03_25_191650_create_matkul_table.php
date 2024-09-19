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
        Schema::create('matkul', function (Blueprint $table) {
            $table->uuid('id')->primary();
            $table->foreignId('prodi_id')->constrained('prodi')->cascadeOnDelete()->cascadeOnUpdate();
            $table->string('kd_matkul', 10)->unique();
            $table->string('nm_matkul', 150);
            $table->smallInteger('sks');
            $table->smallInteger('semester');
            $table->string('singkat', 14);
            $table->string('status', 15)->default('aktif');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('matkul');
    }
};
