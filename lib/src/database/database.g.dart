// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class DesiredWineEntityData extends DataClass
    implements Insertable<DesiredWineEntityData> {
  final int id;
  final double alcohol;
  final double sugar;
  DesiredWineEntityData(
      {required this.id, required this.alcohol, required this.sugar});
  factory DesiredWineEntityData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DesiredWineEntityData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      alcohol: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}alcohol'])!,
      sugar: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}sugar'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['alcohol'] = Variable<double>(alcohol);
    map['sugar'] = Variable<double>(sugar);
    return map;
  }

  DesiredWineEntityCompanion toCompanion(bool nullToAbsent) {
    return DesiredWineEntityCompanion(
      id: Value(id),
      alcohol: Value(alcohol),
      sugar: Value(sugar),
    );
  }

  factory DesiredWineEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DesiredWineEntityData(
      id: serializer.fromJson<int>(json['id']),
      alcohol: serializer.fromJson<double>(json['alcohol']),
      sugar: serializer.fromJson<double>(json['sugar']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'alcohol': serializer.toJson<double>(alcohol),
      'sugar': serializer.toJson<double>(sugar),
    };
  }

  DesiredWineEntityData copyWith({int? id, double? alcohol, double? sugar}) =>
      DesiredWineEntityData(
        id: id ?? this.id,
        alcohol: alcohol ?? this.alcohol,
        sugar: sugar ?? this.sugar,
      );
  @override
  String toString() {
    return (StringBuffer('DesiredWineEntityData(')
          ..write('id: $id, ')
          ..write('alcohol: $alcohol, ')
          ..write('sugar: $sugar')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(alcohol.hashCode, sugar.hashCode)));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DesiredWineEntityData &&
          other.id == this.id &&
          other.alcohol == this.alcohol &&
          other.sugar == this.sugar);
}

class DesiredWineEntityCompanion
    extends UpdateCompanion<DesiredWineEntityData> {
  final Value<int> id;
  final Value<double> alcohol;
  final Value<double> sugar;
  const DesiredWineEntityCompanion({
    this.id = const Value.absent(),
    this.alcohol = const Value.absent(),
    this.sugar = const Value.absent(),
  });
  DesiredWineEntityCompanion.insert({
    this.id = const Value.absent(),
    required double alcohol,
    required double sugar,
  })  : alcohol = Value(alcohol),
        sugar = Value(sugar);
  static Insertable<DesiredWineEntityData> custom({
    Expression<int>? id,
    Expression<double>? alcohol,
    Expression<double>? sugar,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (alcohol != null) 'alcohol': alcohol,
      if (sugar != null) 'sugar': sugar,
    });
  }

  DesiredWineEntityCompanion copyWith(
      {Value<int>? id, Value<double>? alcohol, Value<double>? sugar}) {
    return DesiredWineEntityCompanion(
      id: id ?? this.id,
      alcohol: alcohol ?? this.alcohol,
      sugar: sugar ?? this.sugar,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (alcohol.present) {
      map['alcohol'] = Variable<double>(alcohol.value);
    }
    if (sugar.present) {
      map['sugar'] = Variable<double>(sugar.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DesiredWineEntityCompanion(')
          ..write('id: $id, ')
          ..write('alcohol: $alcohol, ')
          ..write('sugar: $sugar')
          ..write(')'))
        .toString();
  }
}

class $DesiredWineEntityTable extends DesiredWineEntity
    with TableInfo<$DesiredWineEntityTable, DesiredWineEntityData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $DesiredWineEntityTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _alcoholMeta = const VerificationMeta('alcohol');
  late final GeneratedColumn<double?> alcohol = GeneratedColumn<double?>(
      'alcohol', aliasedName, false,
      typeName: 'REAL', requiredDuringInsert: true);
  final VerificationMeta _sugarMeta = const VerificationMeta('sugar');
  late final GeneratedColumn<double?> sugar = GeneratedColumn<double?>(
      'sugar', aliasedName, false,
      typeName: 'REAL', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, alcohol, sugar];
  @override
  String get aliasedName => _alias ?? 'desired_wine_entity';
  @override
  String get actualTableName => 'desired_wine_entity';
  @override
  VerificationContext validateIntegrity(
      Insertable<DesiredWineEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('alcohol')) {
      context.handle(_alcoholMeta,
          alcohol.isAcceptableOrUnknown(data['alcohol']!, _alcoholMeta));
    } else if (isInserting) {
      context.missing(_alcoholMeta);
    }
    if (data.containsKey('sugar')) {
      context.handle(
          _sugarMeta, sugar.isAcceptableOrUnknown(data['sugar']!, _sugarMeta));
    } else if (isInserting) {
      context.missing(_sugarMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DesiredWineEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DesiredWineEntityData.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DesiredWineEntityTable createAlias(String alias) {
    return $DesiredWineEntityTable(_db, alias);
  }
}

class MustEntityData extends DataClass implements Insertable<MustEntityData> {
  final int id;
  final double volume;
  final double sugar;
  MustEntityData({required this.id, required this.volume, required this.sugar});
  factory MustEntityData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return MustEntityData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      volume: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}volume'])!,
      sugar: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}sugar'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['volume'] = Variable<double>(volume);
    map['sugar'] = Variable<double>(sugar);
    return map;
  }

  MustEntityCompanion toCompanion(bool nullToAbsent) {
    return MustEntityCompanion(
      id: Value(id),
      volume: Value(volume),
      sugar: Value(sugar),
    );
  }

  factory MustEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return MustEntityData(
      id: serializer.fromJson<int>(json['id']),
      volume: serializer.fromJson<double>(json['volume']),
      sugar: serializer.fromJson<double>(json['sugar']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'volume': serializer.toJson<double>(volume),
      'sugar': serializer.toJson<double>(sugar),
    };
  }

  MustEntityData copyWith({int? id, double? volume, double? sugar}) =>
      MustEntityData(
        id: id ?? this.id,
        volume: volume ?? this.volume,
        sugar: sugar ?? this.sugar,
      );
  @override
  String toString() {
    return (StringBuffer('MustEntityData(')
          ..write('id: $id, ')
          ..write('volume: $volume, ')
          ..write('sugar: $sugar')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(volume.hashCode, sugar.hashCode)));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MustEntityData &&
          other.id == this.id &&
          other.volume == this.volume &&
          other.sugar == this.sugar);
}

class MustEntityCompanion extends UpdateCompanion<MustEntityData> {
  final Value<int> id;
  final Value<double> volume;
  final Value<double> sugar;
  const MustEntityCompanion({
    this.id = const Value.absent(),
    this.volume = const Value.absent(),
    this.sugar = const Value.absent(),
  });
  MustEntityCompanion.insert({
    this.id = const Value.absent(),
    required double volume,
    required double sugar,
  })  : volume = Value(volume),
        sugar = Value(sugar);
  static Insertable<MustEntityData> custom({
    Expression<int>? id,
    Expression<double>? volume,
    Expression<double>? sugar,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (volume != null) 'volume': volume,
      if (sugar != null) 'sugar': sugar,
    });
  }

  MustEntityCompanion copyWith(
      {Value<int>? id, Value<double>? volume, Value<double>? sugar}) {
    return MustEntityCompanion(
      id: id ?? this.id,
      volume: volume ?? this.volume,
      sugar: sugar ?? this.sugar,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (volume.present) {
      map['volume'] = Variable<double>(volume.value);
    }
    if (sugar.present) {
      map['sugar'] = Variable<double>(sugar.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MustEntityCompanion(')
          ..write('id: $id, ')
          ..write('volume: $volume, ')
          ..write('sugar: $sugar')
          ..write(')'))
        .toString();
  }
}

class $MustEntityTable extends MustEntity
    with TableInfo<$MustEntityTable, MustEntityData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $MustEntityTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _volumeMeta = const VerificationMeta('volume');
  late final GeneratedColumn<double?> volume = GeneratedColumn<double?>(
      'volume', aliasedName, false,
      typeName: 'REAL', requiredDuringInsert: true);
  final VerificationMeta _sugarMeta = const VerificationMeta('sugar');
  late final GeneratedColumn<double?> sugar = GeneratedColumn<double?>(
      'sugar', aliasedName, false,
      typeName: 'REAL', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, volume, sugar];
  @override
  String get aliasedName => _alias ?? 'must_entity';
  @override
  String get actualTableName => 'must_entity';
  @override
  VerificationContext validateIntegrity(Insertable<MustEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('volume')) {
      context.handle(_volumeMeta,
          volume.isAcceptableOrUnknown(data['volume']!, _volumeMeta));
    } else if (isInserting) {
      context.missing(_volumeMeta);
    }
    if (data.containsKey('sugar')) {
      context.handle(
          _sugarMeta, sugar.isAcceptableOrUnknown(data['sugar']!, _sugarMeta));
    } else if (isInserting) {
      context.missing(_sugarMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MustEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return MustEntityData.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $MustEntityTable createAlias(String alias) {
    return $MustEntityTable(_db, alias);
  }
}

class IngredientsEntityData extends DataClass
    implements Insertable<IngredientsEntityData> {
  final int id;
  final double requiredSugar;
  final double addedSugar;
  final double requiredWater;
  final double addedWater;
  final bool requiredYeast;
  final bool addedYeast;
  final bool requiredNutrients;
  final bool addedNutrients;
  IngredientsEntityData(
      {required this.id,
      required this.requiredSugar,
      required this.addedSugar,
      required this.requiredWater,
      required this.addedWater,
      required this.requiredYeast,
      required this.addedYeast,
      required this.requiredNutrients,
      required this.addedNutrients});
  factory IngredientsEntityData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return IngredientsEntityData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      requiredSugar: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}required_sugar'])!,
      addedSugar: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}added_sugar'])!,
      requiredWater: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}required_water'])!,
      addedWater: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}added_water'])!,
      requiredYeast: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}required_yeast'])!,
      addedYeast: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}added_yeast'])!,
      requiredNutrients: const BoolType().mapFromDatabaseResponse(
          data['${effectivePrefix}required_nutrients'])!,
      addedNutrients: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}added_nutrients'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['required_sugar'] = Variable<double>(requiredSugar);
    map['added_sugar'] = Variable<double>(addedSugar);
    map['required_water'] = Variable<double>(requiredWater);
    map['added_water'] = Variable<double>(addedWater);
    map['required_yeast'] = Variable<bool>(requiredYeast);
    map['added_yeast'] = Variable<bool>(addedYeast);
    map['required_nutrients'] = Variable<bool>(requiredNutrients);
    map['added_nutrients'] = Variable<bool>(addedNutrients);
    return map;
  }

  IngredientsEntityCompanion toCompanion(bool nullToAbsent) {
    return IngredientsEntityCompanion(
      id: Value(id),
      requiredSugar: Value(requiredSugar),
      addedSugar: Value(addedSugar),
      requiredWater: Value(requiredWater),
      addedWater: Value(addedWater),
      requiredYeast: Value(requiredYeast),
      addedYeast: Value(addedYeast),
      requiredNutrients: Value(requiredNutrients),
      addedNutrients: Value(addedNutrients),
    );
  }

  factory IngredientsEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return IngredientsEntityData(
      id: serializer.fromJson<int>(json['id']),
      requiredSugar: serializer.fromJson<double>(json['requiredSugar']),
      addedSugar: serializer.fromJson<double>(json['addedSugar']),
      requiredWater: serializer.fromJson<double>(json['requiredWater']),
      addedWater: serializer.fromJson<double>(json['addedWater']),
      requiredYeast: serializer.fromJson<bool>(json['requiredYeast']),
      addedYeast: serializer.fromJson<bool>(json['addedYeast']),
      requiredNutrients: serializer.fromJson<bool>(json['requiredNutrients']),
      addedNutrients: serializer.fromJson<bool>(json['addedNutrients']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'requiredSugar': serializer.toJson<double>(requiredSugar),
      'addedSugar': serializer.toJson<double>(addedSugar),
      'requiredWater': serializer.toJson<double>(requiredWater),
      'addedWater': serializer.toJson<double>(addedWater),
      'requiredYeast': serializer.toJson<bool>(requiredYeast),
      'addedYeast': serializer.toJson<bool>(addedYeast),
      'requiredNutrients': serializer.toJson<bool>(requiredNutrients),
      'addedNutrients': serializer.toJson<bool>(addedNutrients),
    };
  }

  IngredientsEntityData copyWith(
          {int? id,
          double? requiredSugar,
          double? addedSugar,
          double? requiredWater,
          double? addedWater,
          bool? requiredYeast,
          bool? addedYeast,
          bool? requiredNutrients,
          bool? addedNutrients}) =>
      IngredientsEntityData(
        id: id ?? this.id,
        requiredSugar: requiredSugar ?? this.requiredSugar,
        addedSugar: addedSugar ?? this.addedSugar,
        requiredWater: requiredWater ?? this.requiredWater,
        addedWater: addedWater ?? this.addedWater,
        requiredYeast: requiredYeast ?? this.requiredYeast,
        addedYeast: addedYeast ?? this.addedYeast,
        requiredNutrients: requiredNutrients ?? this.requiredNutrients,
        addedNutrients: addedNutrients ?? this.addedNutrients,
      );
  @override
  String toString() {
    return (StringBuffer('IngredientsEntityData(')
          ..write('id: $id, ')
          ..write('requiredSugar: $requiredSugar, ')
          ..write('addedSugar: $addedSugar, ')
          ..write('requiredWater: $requiredWater, ')
          ..write('addedWater: $addedWater, ')
          ..write('requiredYeast: $requiredYeast, ')
          ..write('addedYeast: $addedYeast, ')
          ..write('requiredNutrients: $requiredNutrients, ')
          ..write('addedNutrients: $addedNutrients')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          requiredSugar.hashCode,
          $mrjc(
              addedSugar.hashCode,
              $mrjc(
                  requiredWater.hashCode,
                  $mrjc(
                      addedWater.hashCode,
                      $mrjc(
                          requiredYeast.hashCode,
                          $mrjc(
                              addedYeast.hashCode,
                              $mrjc(requiredNutrients.hashCode,
                                  addedNutrients.hashCode)))))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is IngredientsEntityData &&
          other.id == this.id &&
          other.requiredSugar == this.requiredSugar &&
          other.addedSugar == this.addedSugar &&
          other.requiredWater == this.requiredWater &&
          other.addedWater == this.addedWater &&
          other.requiredYeast == this.requiredYeast &&
          other.addedYeast == this.addedYeast &&
          other.requiredNutrients == this.requiredNutrients &&
          other.addedNutrients == this.addedNutrients);
}

class IngredientsEntityCompanion
    extends UpdateCompanion<IngredientsEntityData> {
  final Value<int> id;
  final Value<double> requiredSugar;
  final Value<double> addedSugar;
  final Value<double> requiredWater;
  final Value<double> addedWater;
  final Value<bool> requiredYeast;
  final Value<bool> addedYeast;
  final Value<bool> requiredNutrients;
  final Value<bool> addedNutrients;
  const IngredientsEntityCompanion({
    this.id = const Value.absent(),
    this.requiredSugar = const Value.absent(),
    this.addedSugar = const Value.absent(),
    this.requiredWater = const Value.absent(),
    this.addedWater = const Value.absent(),
    this.requiredYeast = const Value.absent(),
    this.addedYeast = const Value.absent(),
    this.requiredNutrients = const Value.absent(),
    this.addedNutrients = const Value.absent(),
  });
  IngredientsEntityCompanion.insert({
    this.id = const Value.absent(),
    required double requiredSugar,
    required double addedSugar,
    required double requiredWater,
    required double addedWater,
    required bool requiredYeast,
    required bool addedYeast,
    required bool requiredNutrients,
    required bool addedNutrients,
  })  : requiredSugar = Value(requiredSugar),
        addedSugar = Value(addedSugar),
        requiredWater = Value(requiredWater),
        addedWater = Value(addedWater),
        requiredYeast = Value(requiredYeast),
        addedYeast = Value(addedYeast),
        requiredNutrients = Value(requiredNutrients),
        addedNutrients = Value(addedNutrients);
  static Insertable<IngredientsEntityData> custom({
    Expression<int>? id,
    Expression<double>? requiredSugar,
    Expression<double>? addedSugar,
    Expression<double>? requiredWater,
    Expression<double>? addedWater,
    Expression<bool>? requiredYeast,
    Expression<bool>? addedYeast,
    Expression<bool>? requiredNutrients,
    Expression<bool>? addedNutrients,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (requiredSugar != null) 'required_sugar': requiredSugar,
      if (addedSugar != null) 'added_sugar': addedSugar,
      if (requiredWater != null) 'required_water': requiredWater,
      if (addedWater != null) 'added_water': addedWater,
      if (requiredYeast != null) 'required_yeast': requiredYeast,
      if (addedYeast != null) 'added_yeast': addedYeast,
      if (requiredNutrients != null) 'required_nutrients': requiredNutrients,
      if (addedNutrients != null) 'added_nutrients': addedNutrients,
    });
  }

  IngredientsEntityCompanion copyWith(
      {Value<int>? id,
      Value<double>? requiredSugar,
      Value<double>? addedSugar,
      Value<double>? requiredWater,
      Value<double>? addedWater,
      Value<bool>? requiredYeast,
      Value<bool>? addedYeast,
      Value<bool>? requiredNutrients,
      Value<bool>? addedNutrients}) {
    return IngredientsEntityCompanion(
      id: id ?? this.id,
      requiredSugar: requiredSugar ?? this.requiredSugar,
      addedSugar: addedSugar ?? this.addedSugar,
      requiredWater: requiredWater ?? this.requiredWater,
      addedWater: addedWater ?? this.addedWater,
      requiredYeast: requiredYeast ?? this.requiredYeast,
      addedYeast: addedYeast ?? this.addedYeast,
      requiredNutrients: requiredNutrients ?? this.requiredNutrients,
      addedNutrients: addedNutrients ?? this.addedNutrients,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (requiredSugar.present) {
      map['required_sugar'] = Variable<double>(requiredSugar.value);
    }
    if (addedSugar.present) {
      map['added_sugar'] = Variable<double>(addedSugar.value);
    }
    if (requiredWater.present) {
      map['required_water'] = Variable<double>(requiredWater.value);
    }
    if (addedWater.present) {
      map['added_water'] = Variable<double>(addedWater.value);
    }
    if (requiredYeast.present) {
      map['required_yeast'] = Variable<bool>(requiredYeast.value);
    }
    if (addedYeast.present) {
      map['added_yeast'] = Variable<bool>(addedYeast.value);
    }
    if (requiredNutrients.present) {
      map['required_nutrients'] = Variable<bool>(requiredNutrients.value);
    }
    if (addedNutrients.present) {
      map['added_nutrients'] = Variable<bool>(addedNutrients.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('IngredientsEntityCompanion(')
          ..write('id: $id, ')
          ..write('requiredSugar: $requiredSugar, ')
          ..write('addedSugar: $addedSugar, ')
          ..write('requiredWater: $requiredWater, ')
          ..write('addedWater: $addedWater, ')
          ..write('requiredYeast: $requiredYeast, ')
          ..write('addedYeast: $addedYeast, ')
          ..write('requiredNutrients: $requiredNutrients, ')
          ..write('addedNutrients: $addedNutrients')
          ..write(')'))
        .toString();
  }
}

class $IngredientsEntityTable extends IngredientsEntity
    with TableInfo<$IngredientsEntityTable, IngredientsEntityData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $IngredientsEntityTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _requiredSugarMeta =
      const VerificationMeta('requiredSugar');
  late final GeneratedColumn<double?> requiredSugar = GeneratedColumn<double?>(
      'required_sugar', aliasedName, false,
      typeName: 'REAL', requiredDuringInsert: true);
  final VerificationMeta _addedSugarMeta = const VerificationMeta('addedSugar');
  late final GeneratedColumn<double?> addedSugar = GeneratedColumn<double?>(
      'added_sugar', aliasedName, false,
      typeName: 'REAL', requiredDuringInsert: true);
  final VerificationMeta _requiredWaterMeta =
      const VerificationMeta('requiredWater');
  late final GeneratedColumn<double?> requiredWater = GeneratedColumn<double?>(
      'required_water', aliasedName, false,
      typeName: 'REAL', requiredDuringInsert: true);
  final VerificationMeta _addedWaterMeta = const VerificationMeta('addedWater');
  late final GeneratedColumn<double?> addedWater = GeneratedColumn<double?>(
      'added_water', aliasedName, false,
      typeName: 'REAL', requiredDuringInsert: true);
  final VerificationMeta _requiredYeastMeta =
      const VerificationMeta('requiredYeast');
  late final GeneratedColumn<bool?> requiredYeast = GeneratedColumn<bool?>(
      'required_yeast', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (required_yeast IN (0, 1))');
  final VerificationMeta _addedYeastMeta = const VerificationMeta('addedYeast');
  late final GeneratedColumn<bool?> addedYeast = GeneratedColumn<bool?>(
      'added_yeast', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (added_yeast IN (0, 1))');
  final VerificationMeta _requiredNutrientsMeta =
      const VerificationMeta('requiredNutrients');
  late final GeneratedColumn<bool?> requiredNutrients = GeneratedColumn<bool?>(
      'required_nutrients', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (required_nutrients IN (0, 1))');
  final VerificationMeta _addedNutrientsMeta =
      const VerificationMeta('addedNutrients');
  late final GeneratedColumn<bool?> addedNutrients = GeneratedColumn<bool?>(
      'added_nutrients', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (added_nutrients IN (0, 1))');
  @override
  List<GeneratedColumn> get $columns => [
        id,
        requiredSugar,
        addedSugar,
        requiredWater,
        addedWater,
        requiredYeast,
        addedYeast,
        requiredNutrients,
        addedNutrients
      ];
  @override
  String get aliasedName => _alias ?? 'ingredients_entity';
  @override
  String get actualTableName => 'ingredients_entity';
  @override
  VerificationContext validateIntegrity(
      Insertable<IngredientsEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('required_sugar')) {
      context.handle(
          _requiredSugarMeta,
          requiredSugar.isAcceptableOrUnknown(
              data['required_sugar']!, _requiredSugarMeta));
    } else if (isInserting) {
      context.missing(_requiredSugarMeta);
    }
    if (data.containsKey('added_sugar')) {
      context.handle(
          _addedSugarMeta,
          addedSugar.isAcceptableOrUnknown(
              data['added_sugar']!, _addedSugarMeta));
    } else if (isInserting) {
      context.missing(_addedSugarMeta);
    }
    if (data.containsKey('required_water')) {
      context.handle(
          _requiredWaterMeta,
          requiredWater.isAcceptableOrUnknown(
              data['required_water']!, _requiredWaterMeta));
    } else if (isInserting) {
      context.missing(_requiredWaterMeta);
    }
    if (data.containsKey('added_water')) {
      context.handle(
          _addedWaterMeta,
          addedWater.isAcceptableOrUnknown(
              data['added_water']!, _addedWaterMeta));
    } else if (isInserting) {
      context.missing(_addedWaterMeta);
    }
    if (data.containsKey('required_yeast')) {
      context.handle(
          _requiredYeastMeta,
          requiredYeast.isAcceptableOrUnknown(
              data['required_yeast']!, _requiredYeastMeta));
    } else if (isInserting) {
      context.missing(_requiredYeastMeta);
    }
    if (data.containsKey('added_yeast')) {
      context.handle(
          _addedYeastMeta,
          addedYeast.isAcceptableOrUnknown(
              data['added_yeast']!, _addedYeastMeta));
    } else if (isInserting) {
      context.missing(_addedYeastMeta);
    }
    if (data.containsKey('required_nutrients')) {
      context.handle(
          _requiredNutrientsMeta,
          requiredNutrients.isAcceptableOrUnknown(
              data['required_nutrients']!, _requiredNutrientsMeta));
    } else if (isInserting) {
      context.missing(_requiredNutrientsMeta);
    }
    if (data.containsKey('added_nutrients')) {
      context.handle(
          _addedNutrientsMeta,
          addedNutrients.isAcceptableOrUnknown(
              data['added_nutrients']!, _addedNutrientsMeta));
    } else if (isInserting) {
      context.missing(_addedNutrientsMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  IngredientsEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return IngredientsEntityData.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $IngredientsEntityTable createAlias(String alias) {
    return $IngredientsEntityTable(_db, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $DesiredWineEntityTable desiredWineEntity =
      $DesiredWineEntityTable(this);
  late final $MustEntityTable mustEntity = $MustEntityTable(this);
  late final $IngredientsEntityTable ingredientsEntity =
      $IngredientsEntityTable(this);
  late final DesiredWineDao desiredWineDao = DesiredWineDao(this as MyDatabase);
  late final MustDao mustDao = MustDao(this as MyDatabase);
  late final IngredientsDao ingredientsDao = IngredientsDao(this as MyDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [desiredWineEntity, mustEntity, ingredientsEntity];
}
