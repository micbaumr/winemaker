// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class DesiredWineData extends DataClass implements Insertable<DesiredWineData> {
  final int id;
  final double alcohol;
  final double sugar;
  DesiredWineData(
      {required this.id, required this.alcohol, required this.sugar});
  factory DesiredWineData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DesiredWineData(
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

  DesiredWineCompanion toCompanion(bool nullToAbsent) {
    return DesiredWineCompanion(
      id: Value(id),
      alcohol: Value(alcohol),
      sugar: Value(sugar),
    );
  }

  factory DesiredWineData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DesiredWineData(
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

  DesiredWineData copyWith({int? id, double? alcohol, double? sugar}) =>
      DesiredWineData(
        id: id ?? this.id,
        alcohol: alcohol ?? this.alcohol,
        sugar: sugar ?? this.sugar,
      );
  @override
  String toString() {
    return (StringBuffer('DesiredWineData(')
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
      (other is DesiredWineData &&
          other.id == this.id &&
          other.alcohol == this.alcohol &&
          other.sugar == this.sugar);
}

class DesiredWineCompanion extends UpdateCompanion<DesiredWineData> {
  final Value<int> id;
  final Value<double> alcohol;
  final Value<double> sugar;
  const DesiredWineCompanion({
    this.id = const Value.absent(),
    this.alcohol = const Value.absent(),
    this.sugar = const Value.absent(),
  });
  DesiredWineCompanion.insert({
    this.id = const Value.absent(),
    required double alcohol,
    required double sugar,
  })  : alcohol = Value(alcohol),
        sugar = Value(sugar);
  static Insertable<DesiredWineData> custom({
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

  DesiredWineCompanion copyWith(
      {Value<int>? id, Value<double>? alcohol, Value<double>? sugar}) {
    return DesiredWineCompanion(
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
    return (StringBuffer('DesiredWineCompanion(')
          ..write('id: $id, ')
          ..write('alcohol: $alcohol, ')
          ..write('sugar: $sugar')
          ..write(')'))
        .toString();
  }
}

class $DesiredWineTable extends DesiredWine
    with TableInfo<$DesiredWineTable, DesiredWineData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $DesiredWineTable(this._db, [this._alias]);
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
  String get aliasedName => _alias ?? 'desired_wine';
  @override
  String get actualTableName => 'desired_wine';
  @override
  VerificationContext validateIntegrity(Insertable<DesiredWineData> instance,
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
  DesiredWineData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DesiredWineData.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DesiredWineTable createAlias(String alias) {
    return $DesiredWineTable(_db, alias);
  }
}

class MustData extends DataClass implements Insertable<MustData> {
  final int id;
  final double volume;
  final double sugar;
  MustData({required this.id, required this.volume, required this.sugar});
  factory MustData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return MustData(
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

  MustCompanion toCompanion(bool nullToAbsent) {
    return MustCompanion(
      id: Value(id),
      volume: Value(volume),
      sugar: Value(sugar),
    );
  }

  factory MustData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return MustData(
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

  MustData copyWith({int? id, double? volume, double? sugar}) => MustData(
        id: id ?? this.id,
        volume: volume ?? this.volume,
        sugar: sugar ?? this.sugar,
      );
  @override
  String toString() {
    return (StringBuffer('MustData(')
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
      (other is MustData &&
          other.id == this.id &&
          other.volume == this.volume &&
          other.sugar == this.sugar);
}

class MustCompanion extends UpdateCompanion<MustData> {
  final Value<int> id;
  final Value<double> volume;
  final Value<double> sugar;
  const MustCompanion({
    this.id = const Value.absent(),
    this.volume = const Value.absent(),
    this.sugar = const Value.absent(),
  });
  MustCompanion.insert({
    this.id = const Value.absent(),
    required double volume,
    required double sugar,
  })  : volume = Value(volume),
        sugar = Value(sugar);
  static Insertable<MustData> custom({
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

  MustCompanion copyWith(
      {Value<int>? id, Value<double>? volume, Value<double>? sugar}) {
    return MustCompanion(
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
    return (StringBuffer('MustCompanion(')
          ..write('id: $id, ')
          ..write('volume: $volume, ')
          ..write('sugar: $sugar')
          ..write(')'))
        .toString();
  }
}

class $MustTable extends Must with TableInfo<$MustTable, MustData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $MustTable(this._db, [this._alias]);
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
  String get aliasedName => _alias ?? 'must';
  @override
  String get actualTableName => 'must';
  @override
  VerificationContext validateIntegrity(Insertable<MustData> instance,
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
  MustData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return MustData.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $MustTable createAlias(String alias) {
    return $MustTable(_db, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $DesiredWineTable desiredWine = $DesiredWineTable(this);
  late final $MustTable must = $MustTable(this);
  late final DesiredWineDao desiredWineDao = DesiredWineDao(this as MyDatabase);
  late final MustDao mustDao = MustDao(this as MyDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [desiredWine, must];
}
