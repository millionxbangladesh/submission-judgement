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
            $table->string('video30s')->nullable()->after('description');
            $table->string('video240s')->nullable()->after('video30s');
            $table->string('project_link')->nullable()->after('video240s');
            $table->enum('is_female_members', ['yes', 'no'])->nullable()->after('project_link');
            $table->string('female_members')->nullable()->after('is_female_members');
            $table->string('nasa_global_team_url')->nullable()->after('female_members');
            $table->string('final_score')->nullable()->after('nasa_global_team_url');

        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('registrations', function (Blueprint $table) {
           $table->dropColumn(['video30s', 'video240s', 'project_link', 'final_score','is_female_members','female_members','nasa_global_team_url']);
        });
    }
};
