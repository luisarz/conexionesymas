<?php

namespace App\Filament\Resources;

use App\Filament\Resources\ContratoResource\Pages;
use App\Filament\Resources\ContratoResource\RelationManagers;
use App\Models\Contrato;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class ContratoResource extends Resource
{
    protected static ?string $model = Contrato::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\TextInput::make('empleado_id')
                    ->required()
                    ->numeric(),
                Forms\Components\TextInput::make('cargo_id')
                    ->required()
                    ->numeric(),
                Forms\Components\TextInput::make('salary_day')
                    ->required()
                    ->maxLength(255),
                Forms\Components\TextInput::make('salary_month')
                    ->required()
                    ->maxLength(255),
                Forms\Components\DatePicker::make('contract_start'),
                Forms\Components\DatePicker::make('contract_end'),
                Forms\Components\TextInput::make('salary_xtra_hour_day')
                    ->required()
                    ->numeric(),
                Forms\Components\TextInput::make('salary_xtra_hour_night')
                    ->required()
                    ->numeric(),
                Forms\Components\Textarea::make('contract_file')
                    ->columnSpanFull(),
                Forms\Components\Toggle::make('is_active')
                    ->required(),
                Forms\Components\Toggle::make('is_generated')
                    ->required(),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('empleado_id')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\TextColumn::make('cargo_id')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\TextColumn::make('salary_day')
                    ->searchable(),
                Tables\Columns\TextColumn::make('salary_month')
                    ->searchable(),
                Tables\Columns\TextColumn::make('contract_start')
                    ->date()
                    ->sortable(),
                Tables\Columns\TextColumn::make('contract_end')
                    ->date()
                    ->sortable(),
                Tables\Columns\TextColumn::make('salary_xtra_hour_day')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\TextColumn::make('salary_xtra_hour_night')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\IconColumn::make('is_active')
                    ->boolean(),
                Tables\Columns\IconColumn::make('is_generated')
                    ->boolean(),
                Tables\Columns\TextColumn::make('created_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('updated_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
            ])
            ->filters([
                //
            ])
            ->actions([
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
            'index' => Pages\ListContratos::route('/'),
            'create' => Pages\CreateContrato::route('/create'),
            'edit' => Pages\EditContrato::route('/{record}/edit'),
        ];
    }
}
