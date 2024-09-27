<?php

namespace App\Filament\Resources;

use App\Filament\Resources\EmpleadoResource\Pages;
use App\Models\Distrito;
use App\Models\Empleado;
use Filament\Forms;
use Filament\Forms\Components\Card;
use Filament\Forms\Components\Group;
use Filament\Forms\Components\Section;
use Filament\Forms\Components\Split;
use Filament\Forms\Components\Tabs;
use Filament\Forms\Form;
use Filament\GlobalSearch\Actions\Action;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Filters\SelectFilter;
use Filament\Tables\Table;

class EmpleadoResource extends Resource
{
    protected static ?string $model = Empleado::class;

    protected static ?string $navigationIcon = 'heroicon-o-user-group';

    protected static ?string $recordTitleAttribute = 'name';

    public static function getGloballySearchableAttributes(): array
    {
        return ['name', 'lastname', 'cargo.name', 'profesion.name'];
    }



    public static function getNavigationBadge(): string
    {
        return static::getModel()::count();
    }

    public static function form(Form $form): Form
    {
        return $form
            ->schema([

                Tabs::make('Empleado')
                    ->tabs([
                        Tabs\Tab::make('Informacion Personal')
                            ->icon('heroicon-m-user')
                            ->schema([
                                Forms\Components\BelongsToSelect::make('empresa_id')
                                    ->label('Empresa Contratante')
                                    ->relationship('empresa', 'name')
                                    ->preload()
                                    ->searchable()
                                    ->required(),

                                Group::make()->columns(1)->schema([

                                    Split::make([
                                        Section::make([
                                            Forms\Components\TextInput::make('name')
                                                ->required()
                                                ->label('Nombres')
                                                ->maxLength(255),
                                            Forms\Components\TextInput::make('lastname')
                                                ->required()
                                                ->label('Apellidos')
                                                ->maxLength(255),
                                        ]),
                                        Section::make([
                                            Forms\Components\FileUpload::make('photo')
                                                ->label('Foto de Perfil')
                                                ->image()
                                                ->imageResizeMode('cover')
                                                ->avatar()
                                                ->directory('photos')
                                                ->imageEditor()
                                                ->imageEditorAspectRatios([
                                                    '16:9',
                                                    '4:3',
                                                    '1:1',
                                                ]),
                                        ])->grow(false), //true los dos cubren el mismo espacio

                                    ])->from('md'),
                                    Card::make('Informacion Personal')
                                        ->icon('heroicon-o-user')
                                        ->compact()
                                        ->columns(3)->schema([

                                            Forms\Components\Select::make('gender')
                                                ->label('Genero')
                                                ->options([
                                                    'M' => 'Masculino',
                                                    'F' => 'Femenino',
                                                ])
                                                ->default('M')
                                                ->required(),
                                            Forms\Components\DatePicker::make('birthdate')
                                                ->label('Fecha de Nacimiento')
                                                ->default(now())
                                                ->required(),
                                            Forms\Components\TextInput::make('dui')
                                                ->required()
                                                ->mask('99999999-9')
                                                ->placeholder('00000000-0')
                                                ->maxLength(255),
                                            Forms\Components\TextInput::make('nit')
                                                ->required()
                                                ->maxLength(255),
                                            Forms\Components\BelongsToSelect::make('departamento_id')
                                                ->required()
                                                ->relationship('departamento', 'name')->preload()
                                                ->searchable()->reactive()
                                                ->afterStateUpdated(function ($state, $set) {
                                                    $set('distrito_id', null);
                                                }),
                                            Forms\Components\BelongsToSelect::make('distrito_id')
                                                ->searchable()
                                                ->label('Distrito')
                                                ->options(function (callable $get) {
                                                    $departamentoId = $get('departamento_id'); // Get the selected departamento_id
                                                    if (! $departamentoId) {
                                                        return [];
                                                    }

                                                    return Distrito::where('departamento_id', $departamentoId)
                                                        ->pluck('name', 'id'); // Adjust to match your Distrito model fields
                                                })
                                                ->preload(),
                                            Forms\Components\TextInput::make('email')
                                                ->email()
                                                ->required()
                                                ->maxLength(255),
                                            Forms\Components\TextInput::make('phone')
                                                ->tel()
                                                ->required()
                                                ->maxLength(255),
                                            Forms\Components\TextInput::make('address')
                                                ->required()
                                                ->maxLength(255)
                                                ->columnSpan('width'),

                                        ]),

                                ]),

                            ]),
                        Tabs\Tab::make('Estado Familiar')
                            ->icon('heroicon-o-users')
                            ->schema([
                                Section::make('Estado Familiar')
                                    ->Compact()
                                    ->icon('heroicon-o-users')
                                    ->columns(3)->schema([
                                        Forms\Components\Select::make('marital_status')
                                            ->label('Estado Civil')
                                            ->options([
                                                'Soltero/a' => 'Soltero/a',
                                                'Casado/a' => 'Casado/a',
                                                'Divorciado/a' => 'Divorciado/a',
                                                'Viudo/a' => 'Viudo/a',
                                            ])->default('Soltero/a')
                                            ->required(),
                                        Forms\Components\TextInput::make('marital_name')
                                            ->label('Nombre de Conyugue')
                                            ->maxLength(255),
                                        Forms\Components\TextInput::make('marital_phone')
                                            ->label('Telefono de Conyugue')
                                            ->tel()
                                            ->maxLength(255),

                                    ]),
                            ]),
                        Tabs\Tab::make('Información Laboral')
                            ->icon('heroicon-m-academic-cap')

                            ->schema([
                                Forms\Components\BelongsToSelect::make('profesion_id')
                                    ->relationship('profesion', 'name')
                                    ->required(),
                            ]),
                        Tabs\Tab::make('Informacion Contractual')
                            ->schema([

                                Section::make('Informacion Personal')
                                    ->compact()
                                    ->icon('heroicon-o-user')
                                    ->columns(3)->schema([

                                        Forms\Components\TextInput::make('afp')
                                            ->label('NUP')
                                            ->numeric()
                                            ->maxLength(255),
                                        Forms\Components\TextInput::make('isss')
                                            ->label('ISSS')
                                            ->required()
                                            ->maxLength(255),
                                        Forms\Components\TextInput::make('nrc')
                                            ->label('NRC (si aplica)'),
                                        Forms\Components\TextInput::make('salary_day')
                                            ->label('Salario por Dia')
                                            ->required()
                                            ->numeric(),
                                        Forms\Components\TextInput::make('salary_month')
                                            ->label('Salario por Mes')
                                            ->required()
                                            ->numeric(),
                                        Forms\Components\TextInput::make('contract')->nullable()
                                            ->label('Numero de Contrato')
                                            ->maxLength(255),
                                        Forms\Components\DatePicker::make('contract_start')
                                            ->label('Fecha de Inicio de Contrato')
                                            ->required()
                                            ->default(now()),
                                        Forms\Components\DatePicker::make('contract_end')
                                            ->label('Fecha de Fin de Contrato'),
                                        Forms\Components\DatePicker::make('vacation_start')
                                            ->label('Fecha de Inicio de Vacaciones'),
                                        Forms\Components\DatePicker::make('vacation_end')
                                            ->label('Fecha de Fin de Vacaciones'),
                                        Forms\Components\TextInput::make('salary_xtra_hour_day')
                                            ->label('Salario por Hora Extra Diurna')
                                            ->required()
                                            ->numeric(),
                                        Forms\Components\TextInput::make('salary_xtra_hour_night')
                                            ->label('Salario por Hora Extra Nocturna')
                                            ->required()
                                            ->numeric(),
                                        Forms\Components\BelongsToSelect::make('cargo_id')
                                            ->relationship('cargo', 'name')
                                            ->required(),
                                        Forms\Components\FileUpload::make('contract_file')
                                            ->label('Archivo de Contrato en PDF')
                                            ->directory('contract')
                                            ->enableDownload()
                                            ->enableOpen()
                                            ->acceptedFileTypes(['application/pdf']),
                                        Forms\Components\Toggle::make('is_active')
                                            ->label('Empleado Activo')
                                            ->required(),

                                    ]),
                            ]),

                    ])->activeTab(1)->columnSpanFull(),

            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('empresa.name')
                    ->wrap()->sortable(),
                Tables\Columns\TextColumn::make('cargo.name')
                    ->sortable(),
                Tables\Columns\TextColumn::make('name')
                    ->getStateUsing(function (Empleado $record) {
                        return $record->fullName();
                    })
                    ->wrap()
                    ->searchable(),
                Tables\Columns\ImageColumn::make('photo')
                    ->circular(),
                Tables\Columns\TextColumn::make('dui')
                    ->searchable(),

                Tables\Columns\TextColumn::make('email')
                    ->copyable()
                    ->copyMessage('Email address copied')
                    ->copyMessageDuration(1500)
                    ->searchable(),
                // Tables\Columns\TextColumn::make('contract_file'),
                Tables\Columns\TextColumn::make('phone')
                    ->toggleable(isToggledHiddenByDefault: true)
                    ->searchable(),
                Tables\Columns\TextColumn::make('address')
                    ->toggleable(isToggledHiddenByDefault: true)
                    ->searchable(),
                Tables\Columns\TextColumn::make('marital_status')
                    ->toggleable(isToggledHiddenByDefault: true)
                    ->searchable(),

                Tables\Columns\TextColumn::make('contract_start')
                    ->toggleable(isToggledHiddenByDefault: true)
                    ->date()
                    ->sortable(),
                Tables\Columns\IconColumn::make('is_active')
                    ->label('Activo')
                    ->boolean(),
                Tables\Columns\TextColumn::make('distrito.name')
                    ->numeric()
                    ->sortable(),

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
                SelectFilter::make('cargo_id')
                    ->relationship('cargo', 'name')
                    ->label('Cargo'),
            ])
            ->actions([
                Tables\Actions\ActionGroup::make([
                    Tables\Actions\ReplicateAction::make(),
                    Tables\Actions\ViewAction::make(),
                    Tables\Actions\EditAction::make(),
                    Tables\Actions\DeleteAction::make(),

                ]),
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
            'index' => Pages\ListEmpleados::route('/'),
            'create' => Pages\CreateEmpleado::route('/create'),
            'edit' => Pages\EditEmpleado::route('/{record}/edit'),
        ];
    }
}
