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
        Schema::table('registrations', function (Blueprint $table) {
            $table->unsignedBigInteger('sub_category_id')->nullable()->after('category_id');
            $table->string('team_type')->nullable()->after('team_name');
            $table->unsignedBigInteger('university_id')->nullable()->after('team_type');
            $table->text('file_link')->nullable()->after('videolink');
            $table->timestamp('submitDate')->nullable()->after('project_link');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('registrations', function (Blueprint $table) {
            //
        });
    }
};
