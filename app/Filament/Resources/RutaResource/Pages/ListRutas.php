<?php

namespace App\Filament\Resources\RutaResource\Pages;

use App\Filament\Resources\RutaResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;
// use Filament\Resources\widgets\RutaOverview;

class ListRutas extends ListRecords
{
    protected static string $resource = RutaResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }

    protected function getHeaderWidgets(): array
    {
        return [
            // RutaOverview::class,
        ];
    }
}
