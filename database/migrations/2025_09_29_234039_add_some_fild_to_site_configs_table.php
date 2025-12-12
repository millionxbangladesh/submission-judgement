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
        Schema::table('site_configs', function (Blueprint $table) {
            // 30-second video
            $table->dateTime('video30sstart_date')->nullable()->after('start_date');
            $table->dateTime('video30send_date')->nullable()->after('video30sstart_date');

            // 240-second video
            $table->dateTime('video240sstart_date')->nullable()->after('video30send_date');
            $table->dateTime('video240send_date')->nullable()->after('video240sstart_date');

            // Project link submission
            $table->dateTime('projectlinkstart_date')->nullable()->after('video240send_date');
            $table->dateTime('projectlinkend_date')->nullable()->after('projectlinkstart_date');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('site_configs', function (Blueprint $table) {
            $table->dropColumn([
                'video30sstart_date',
                'video30send_date',
                'video240sstart_date',
                'video240send_date',
                'projectlinkstart_date',
                'projectlinkend_date',
            ]);
        });
    }
};
