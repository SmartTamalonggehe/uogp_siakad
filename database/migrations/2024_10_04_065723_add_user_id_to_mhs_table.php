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
        Schema::table('mhs', function (Blueprint $table) {
            $table->foreignUuid('user_id')->nullable()->constrained()->cascadeOnDelete()->cascadeOnUpdate()->affter('id');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('mhs', function (Blueprint $table) {
            // Hapus foreign key constraint terlebih dahulu
            $table->dropForeign(['user_id']);
            $table->dropColumn(['user_id']);
        });
    }
};
