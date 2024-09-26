<?php

namespace App\Filament\Resources\CargoslaboralesResource\Pages;

use App\Filament\Resources\CargoslaboralesResource;
use Filament\Actions;
use Filament\Resources\Pages\ViewRecord;

class ViewCargoslaborales extends ViewRecord
{
    protected static string $resource = CargoslaboralesResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\EditAction::make(),
        ];
    }
}
