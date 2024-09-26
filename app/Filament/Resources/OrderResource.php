<?php

namespace App\Filament\Resources;

use App\Filament\Resources\OrderResource\Pages;
use App\Filament\Resources\OrderResource\RelationManagers;
use App\Models\Order;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Filament\Forms\Components\Group;
use Filament\Forms\Components\Section;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\ToggleButtons;
use Filament\Forms\Components\Textarea;

class OrderResource extends Resource
{
    protected static ?string $model = Order::class;

    protected static ?string $navigationIcon = 'heroicon-o-shopping-bag';
    protected static ?string $label ="Ordenes";

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
               Group::make()->schema([
                    Section::make('Informacion de la orden')->schema([
                        Select::make('user_id')
                            ->label('Cliente')
                            ->relationship('user', 'name')
                            ->searchable()
                            ->preload()
                            ->required(),
                        Select::make('payment_method')
                            ->label('Forma de pago')
                            ->options([
                                'efectivo' => 'Efectivo',
                                'tarjeta' => 'Tarjeta',
                                'transferencia' => 'Transferencia',
                            ])
                            ->default('efectivo')
                            ->required(),
                        Select::make('payment_status')
                            ->label('Estado de pago')
                            ->options([
                                'pendiente' => 'Pendiente',
                                'pagado' => 'Pagado',
                                'rechazado' => 'Rechazado',
                            ])
                            ->default('pendiente')
                            ->required(),
                        ToggleButtons::make('status')
                            ->label('Estado')
                            ->options([
                                'new' => 'New',
                                'processing' => 'Proceso',
                                'shipped' => 'Enviado',
                                'delivered' => 'Entregado',
                                'canceled' => 'Cancelado',
                            ])
                            ->default('new')
                            ->inline() 
                            ->required()
                            ->colors([
                                'new' => 'info',
                                'processing' => 'warning',
                                'shipped' => 'info',
                                'delivered' => 'success',
                                'canceled' => 'danger',
                            ])
                            ->icons([
                                'nuevo' => 'heroicon-o-plus',
                                'processing' => 'heroicon-m-arrow-path',
                                'shipped' => 'heroicon-m-truck',
                                'delivered' => 'heroicon-m-check-badge',
                                'canceled' => 'heroicon-m-x-circle',
                            ]),
                        Select::make('currency')
                            ->label('Moneda')
                            ->options([
                                'usd' => 'USD',
                                'mxn' => 'MXN',
                            ])
                            ->default('usd')
                            ->required(),
                        Select::make('shipping_method')
                            ->label('Metodo de envio')
                            ->options([
                                'estandar' => 'Estandar',
                                'express' => 'Express',
                            ])
                            ->default('estandar')
                            ->required(),
                        Textarea::make('notes')
                            ->label('Notas')
                            ->columnSpanFull(),
                       
                    ])->columns(2),
                ])->columnSpanFull(),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                //
            ])
            ->filters([
                //
            ])
            ->actions([
                Tables\Actions\ViewAction::make(),
                Tables\Actions\EditAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
    }

    public static function getRelations(): array
    {
        return [
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListOrders::route('/'),
            'create' => Pages\CreateOrder::route('/create'),
            'view' => Pages\ViewOrder::route('/{record}'),
            'edit' => Pages\EditOrder::route('/{record}/edit'),
        ];
    }
}
