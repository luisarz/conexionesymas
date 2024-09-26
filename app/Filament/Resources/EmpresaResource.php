<?php

namespace App\Filament\Resources;

use App\Filament\Resources\EmpresaResource\Pages;
use App\Models\Distrito;
use App\Models\Empresa;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;

class EmpresaResource extends Resource
{
    protected static ?string $model = Empresa::class;

    protected static ?string $navigationIcon = 'heroicon-o-home';

    protected static ?string $navigationGroup = 'Configuración';

    protected static ?string $label = 'Administración de Empresas';

    protected static ?int $navigationSort  = 1;

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\TextInput::make('name')
                    ->required()
                    ->maxLength(255),
                Forms\Components\TextInput::make('comercial_name')
                    ->required()
                    ->maxLength(255),
                Forms\Components\TextInput::make('category')
                    ->required()
                    ->maxLength(255),
                Forms\Components\TextInput::make('nrc')
                    ->required()
                    ->maxLength(255),
                Forms\Components\TextInput::make('nit')
                    ->required()
                    ->maxLength(255),
                Forms\Components\TextInput::make('phone')
                    ->tel()
                    ->required()
                    ->maxLength(255),
                Forms\Components\TextInput::make('email')
                    ->email()
                    ->required()
                    ->maxLength(255),
                Forms\Components\TextInput::make('web')
                    ->required()
                    ->maxLength(255),
                Forms\Components\FileUpload::make('logo')
                    ->image()
                    ->directory('empresa')
                    ->columnSpanFull()
                    ->reorderable(),
                Forms\Components\BelongsToSelect::make('departamento_id')
                    ->relationship('departamento', 'name')
                    ->searchable()
                    ->preload()
                    ->reactive()
                    ->afterStateUpdated(function ($state, $set) {
                        $set('distrito_id', null);
                    })
                    ->required(),

                Forms\Components\Select::make('distrito_id')
                    ->searchable()
                    ->options(function (callable $get) {
                        $departamentoId = $get('departamento_id'); // Get the selected departamento_id
                        if (! $departamentoId) {
                            return [];
                        }

                        return Distrito::where('departamento_id', $departamentoId)
                            ->pluck('name', 'id'); // Adjust to match your Distrito model fields
                    })
                    ->preload() // Preload the available options
                    ->required(),
                Forms\Components\TextInput::make('address')
                    ->required()
                    ->maxLength(255),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('name')
                    ->label('Empresa')
                    ->searchable(),
                Tables\Columns\TextColumn::make('comercial_name')
                    ->label('Nombre Comercial')
                    ->toggleable(isToggledHiddenByDefault: true)

                    ->searchable(),
                Tables\Columns\TextColumn::make('category')
                    ->label('Rubro')
                    ->searchable(),
                Tables\Columns\TextColumn::make('nrc')
                    ->searchable(),
                Tables\Columns\TextColumn::make('nit')
                    ->searchable(),
                Tables\Columns\TextColumn::make('phone')
                    ->label('Teléfono')
                    ->searchable(),
                Tables\Columns\TextColumn::make('email')
                    ->toggleable(isToggledHiddenByDefault: true)
                    ->searchable(),
                Tables\Columns\TextColumn::make('web')
                    ->toggleable(isToggledHiddenByDefault: true)
                    ->searchable(),
                Tables\Columns\TextColumn::make('departamento.name')
                    ->searchable(),
                Tables\Columns\TextColumn::make('distrito.name'),
                Tables\Columns\TextColumn::make('address')
                    ->toggleable(isToggledHiddenByDefault: true)
                    ->searchable(),
                Tables\Columns\TextColumn::make('created_at')
                    ->dateTime()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('updated_at')
                    ->dateTime()
                    ->toggleable(isToggledHiddenByDefault: true),
            ])
            // ->filters([
            //     //
            // ])
            ->actions([
                Tables\Actions\ActionGroup::make([
                    // Tables\Actions\ReplicateAction::make(),
                    Tables\Actions\ViewAction::make(),
                    Tables\Actions\EditAction::make(),
                    Tables\Actions\DeleteAction::make(),
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
            'index' => Pages\ListEmpresas::route('/'),
            'create' => Pages\CreateEmpresa::route('/create'),
            'view' => Pages\ViewEmpresa::route('/{record}'),
            'edit' => Pages\EditEmpresa::route('/{record}/edit'),
        ];
    }
}
