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
            $table->string('team_work_score')->nullable()->after('nasa_global_team_url');
            $table->string('user_experience_score')->nullable()->after('team_work_score');
            $table->string('is_nasa_data_usage_score')->nullable()->after('user_experience_score');
            $table->string('is_challenge_category_score')->nullable()->after('is_nasa_data_usage_score');
            $table->string('id_project_link_score')->nullable()->after('is_challenge_category_score');
            $table->string('is_nasa_global_team_url_score')->nullable()->after('id_project_link_score');
            $table->string('nasa_data_use')->nullable()->after('description');
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
