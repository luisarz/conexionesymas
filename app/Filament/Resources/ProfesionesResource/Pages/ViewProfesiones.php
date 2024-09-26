<?php

namespace App\Filament\Resources\ProfesionesResource\Pages;

use App\Filament\Resources\ProfesionesResource;
use Filament\Actions;
use Filament\Resources\Pages\ViewRecord;

class ViewProfesiones extends ViewRecord
{
    protected static string $resource = ProfesionesResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\EditAction::make(),
        ];
    }
}
