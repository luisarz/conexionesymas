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
        Schema::create('empleados', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('lastname');
            $table->string('email');
            $table->string('phone');
            $table->string('address');
            $table->json('photo');
            $table->date('birthdate');
            $table->enum('gender', ['M', 'F'])->default('M');
            $table->enum('marital_status', ['Soltero/a', 'Casado/a', 'Divorciado/a', 'Viudo/a'])->default('Soltero/a');
            $table->string('marital_name');
            $table->string('marital_phone');
            $table->string('dui');
            $table->string('nit');
            $table->string('afp');
            $table->string('isss');
            $table->string('nrc');
            $table->string('salary_day');
            $table->string('salary_month');
            $table->string('contract');
            $table->string('contract_start');
            $table->string('contract_end');
            $table->string('vacation_start');
            $table->string('vacation_end');
            $table->decimal('salary_xtra_hour_day', 10, 2);
            $table->decimal('salary_xtra_hour_night', 10, 2);
            $table->string('contract_file');
            $table->string('is_active');
            $table->foreignId('departamento_id')->constrained('departamentos')->cascadeOnDelete();
            $table->foreignId('distrito_id')->constrained('distritos')->cascadeOnDelete();
            $table->foreignId('empresa_id')->constrained('empresas')->cascadeOnDelete();
            $table->foreignId('cargo_id')->constrained('empleados')->cascadeOnDelete();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('empleados');
    }
};
