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
        Schema::table('admin_messages', function (Blueprint $table) {
            if (!Schema::hasColumn('admin_messages', 'username')) {
                $table->string('username')->nullable();
            }
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('admin_messages', function (Blueprint $table) {
            //
        });
    }
};
