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
        Schema::create('contratos', function (Blueprint $table) {
            $table->id();
            $table->foreignId('empleado_id')->constrained('empleados')->cascadeOnDelete();
            $table->foreignId('cargo_id')->constrained('cargos_laborales')->cascadeOnDelete();
            $table->string('salary_day');
            $table->string('salary_month');
            $table->date('contract_start')->nullable();
            $table->date('contract_end')->nullable();
            $table->decimal('salary_xtra_hour_day', 10, 2);
            $table->decimal('salary_xtra_hour_night', 10, 2);
            $table->json('contract_file')->nullable();
            $table->boolean('is_active')->default(true);
            $table->boolean('is_generated')->default(false);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('contratos');
    }
};
