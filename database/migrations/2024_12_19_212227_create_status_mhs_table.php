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
        Schema::create('status_mhs', function (Blueprint $table) {
            $table->uuid('id')->primary();
            $table->foreignUuid('mhs_id')->constrained('mhs')->cascadeOnDelete();
            $table->date('tgl_status');
            $table->string('status', 15); // dropout aktif lulus
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('status_mhs');
    }
};
