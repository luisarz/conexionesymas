<?php

namespace App\Filament\Resources\CargoslaboralesResource\Pages;

use App\Filament\Resources\CargoslaboralesResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListCargoslaborales extends ListRecords
{
    protected static string $resource = CargoslaboralesResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
