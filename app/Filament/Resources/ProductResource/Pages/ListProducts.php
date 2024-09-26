<?php

namespace App\Filament\Resources\ProductResource\Pages;

use App\Filament\Resources\ProductResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;
use Filament\Resources\Components\Tab;

class ListProducts extends ListRecords
{
    protected static string $resource = ProductResource::class;

    public  function getTabs():array
    {
       return [
            'All'=>Tab::make('todos')->badge(static::getModel()::count()),
            'Active'=>Tab::make('activos')->badge(static::getModel()::where('is_active',true)->count()),
            'Inactive'=>Tab::make('inactivos')->badge(static::getModel()::where('is_active',false)->count()),
            'Destacados'=>Tab::make('destacados')->badge(static::getModel()::where('is_featured',true)->count()),
            'In Stock'=>Tab::make('en stock')->badge(static::getModel()::where('in_stock',true)->count()),
            'Out of Stock'=>Tab::make('sin stock')->badge(static::getModel()::where('in_stock',false)->count()),
       ];
    }

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
            // Actions\ExportToExcelAction::make(),
            // Actions\ExportToCsvAction::make(),
        ];
    }
}
