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
        Schema::create('kontrak_det', function (Blueprint $table) {
            $table->id();
            $table->foreignUuid('kontrak_id')->constrained('kontrak')->cascadeOnDelete();
            $table->foreignUuid('jadwal_id')->constrained('jadwal')->cascadeOnDelete();
            $table->foreignUuid('mhs_id')->constrained('mhs')->cascadeOnDelete();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('kontrak_det');
    }
};
