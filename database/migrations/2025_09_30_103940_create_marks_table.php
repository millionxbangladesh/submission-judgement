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
        Schema::create('marks', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained()->onDelete('cascade');
            $table->foreignId('registration_id')->constrained()->onDelete('cascade');
            $table->tinyInteger('influence')->unsigned()->comment('1-20');
            $table->tinyInteger('creativity')->unsigned()->comment('1-20');
            $table->tinyInteger('validity')->unsigned()->comment('1-20');
            $table->tinyInteger('relevance')->unsigned()->comment('1-20');
            $table->tinyInteger('presentation')->unsigned()->comment('1-20');
            $table->decimal('round_influence', 5, 2)->comment('Scaled influence');
            $table->decimal('round_creativity', 5, 2)->comment('Scaled creativity');
            $table->decimal('round_validity', 5, 2)->comment('Scaled validity');
            $table->decimal('round_relevance', 5, 2)->comment('Scaled relevance');
            $table->decimal('round_presentation', 5, 2)->comment('Scaled presentation');
            $table->timestamps();

            $table->unique(['user_id', 'registration_id']);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('marks');
    }
};
