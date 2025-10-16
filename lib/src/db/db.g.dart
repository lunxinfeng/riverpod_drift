// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// ignore_for_file: type=lint
class $DBRiverpodTable extends DBRiverpod
    with TableInfo<$DBRiverpodTable, DBRiverpodData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DBRiverpodTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
      'key', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _jsonMeta = const VerificationMeta('json');
  @override
  late final GeneratedColumn<String> json = GeneratedColumn<String>(
      'json', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _expireAtMeta =
      const VerificationMeta('expireAt');
  @override
  late final GeneratedColumn<int> expireAt = GeneratedColumn<int>(
      'expire_at', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _destroyKeyMeta =
      const VerificationMeta('destroyKey');
  @override
  late final GeneratedColumn<String> destroyKey = GeneratedColumn<String>(
      'destroy_key', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [key, json, expireAt, destroyKey];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'd_b_riverpod';
  @override
  VerificationContext validateIntegrity(Insertable<DBRiverpodData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
          _keyMeta, key.isAcceptableOrUnknown(data['key']!, _keyMeta));
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('json')) {
      context.handle(
          _jsonMeta, json.isAcceptableOrUnknown(data['json']!, _jsonMeta));
    }
    if (data.containsKey('expire_at')) {
      context.handle(_expireAtMeta,
          expireAt.isAcceptableOrUnknown(data['expire_at']!, _expireAtMeta));
    }
    if (data.containsKey('destroy_key')) {
      context.handle(
          _destroyKeyMeta,
          destroyKey.isAcceptableOrUnknown(
              data['destroy_key']!, _destroyKeyMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  DBRiverpodData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DBRiverpodData(
      key: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}key'])!,
      json: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}json']),
      expireAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}expire_at']),
      destroyKey: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}destroy_key']),
    );
  }

  @override
  $DBRiverpodTable createAlias(String alias) {
    return $DBRiverpodTable(attachedDatabase, alias);
  }
}

class DBRiverpodData extends DataClass implements Insertable<DBRiverpodData> {
  final String key;
  final String? json;
  final int? expireAt;
  final String? destroyKey;
  const DBRiverpodData(
      {required this.key, this.json, this.expireAt, this.destroyKey});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    if (!nullToAbsent || json != null) {
      map['json'] = Variable<String>(json);
    }
    if (!nullToAbsent || expireAt != null) {
      map['expire_at'] = Variable<int>(expireAt);
    }
    if (!nullToAbsent || destroyKey != null) {
      map['destroy_key'] = Variable<String>(destroyKey);
    }
    return map;
  }

  DBRiverpodCompanion toCompanion(bool nullToAbsent) {
    return DBRiverpodCompanion(
      key: Value(key),
      json: json == null && nullToAbsent ? const Value.absent() : Value(json),
      expireAt: expireAt == null && nullToAbsent
          ? const Value.absent()
          : Value(expireAt),
      destroyKey: destroyKey == null && nullToAbsent
          ? const Value.absent()
          : Value(destroyKey),
    );
  }

  factory DBRiverpodData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DBRiverpodData(
      key: serializer.fromJson<String>(json['key']),
      json: serializer.fromJson<String?>(json['json']),
      expireAt: serializer.fromJson<int?>(json['expireAt']),
      destroyKey: serializer.fromJson<String?>(json['destroyKey']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'json': serializer.toJson<String?>(json),
      'expireAt': serializer.toJson<int?>(expireAt),
      'destroyKey': serializer.toJson<String?>(destroyKey),
    };
  }

  DBRiverpodData copyWith(
          {String? key,
          Value<String?> json = const Value.absent(),
          Value<int?> expireAt = const Value.absent(),
          Value<String?> destroyKey = const Value.absent()}) =>
      DBRiverpodData(
        key: key ?? this.key,
        json: json.present ? json.value : this.json,
        expireAt: expireAt.present ? expireAt.value : this.expireAt,
        destroyKey: destroyKey.present ? destroyKey.value : this.destroyKey,
      );
  DBRiverpodData copyWithCompanion(DBRiverpodCompanion data) {
    return DBRiverpodData(
      key: data.key.present ? data.key.value : this.key,
      json: data.json.present ? data.json.value : this.json,
      expireAt: data.expireAt.present ? data.expireAt.value : this.expireAt,
      destroyKey:
          data.destroyKey.present ? data.destroyKey.value : this.destroyKey,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DBRiverpodData(')
          ..write('key: $key, ')
          ..write('json: $json, ')
          ..write('expireAt: $expireAt, ')
          ..write('destroyKey: $destroyKey')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, json, expireAt, destroyKey);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DBRiverpodData &&
          other.key == this.key &&
          other.json == this.json &&
          other.expireAt == this.expireAt &&
          other.destroyKey == this.destroyKey);
}

class DBRiverpodCompanion extends UpdateCompanion<DBRiverpodData> {
  final Value<String> key;
  final Value<String?> json;
  final Value<int?> expireAt;
  final Value<String?> destroyKey;
  final Value<int> rowid;
  const DBRiverpodCompanion({
    this.key = const Value.absent(),
    this.json = const Value.absent(),
    this.expireAt = const Value.absent(),
    this.destroyKey = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DBRiverpodCompanion.insert({
    required String key,
    this.json = const Value.absent(),
    this.expireAt = const Value.absent(),
    this.destroyKey = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : key = Value(key);
  static Insertable<DBRiverpodData> custom({
    Expression<String>? key,
    Expression<String>? json,
    Expression<int>? expireAt,
    Expression<String>? destroyKey,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (json != null) 'json': json,
      if (expireAt != null) 'expire_at': expireAt,
      if (destroyKey != null) 'destroy_key': destroyKey,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DBRiverpodCompanion copyWith(
      {Value<String>? key,
      Value<String?>? json,
      Value<int?>? expireAt,
      Value<String?>? destroyKey,
      Value<int>? rowid}) {
    return DBRiverpodCompanion(
      key: key ?? this.key,
      json: json ?? this.json,
      expireAt: expireAt ?? this.expireAt,
      destroyKey: destroyKey ?? this.destroyKey,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (json.present) {
      map['json'] = Variable<String>(json.value);
    }
    if (expireAt.present) {
      map['expire_at'] = Variable<int>(expireAt.value);
    }
    if (destroyKey.present) {
      map['destroy_key'] = Variable<String>(destroyKey.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DBRiverpodCompanion(')
          ..write('key: $key, ')
          ..write('json: $json, ')
          ..write('expireAt: $expireAt, ')
          ..write('destroyKey: $destroyKey, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$DB extends GeneratedDatabase {
  _$DB(QueryExecutor e) : super(e);
  $DBManager get managers => $DBManager(this);
  late final $DBRiverpodTable dBRiverpod = $DBRiverpodTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [dBRiverpod];
}

typedef $$DBRiverpodTableCreateCompanionBuilder = DBRiverpodCompanion Function({
  required String key,
  Value<String?> json,
  Value<int?> expireAt,
  Value<String?> destroyKey,
  Value<int> rowid,
});
typedef $$DBRiverpodTableUpdateCompanionBuilder = DBRiverpodCompanion Function({
  Value<String> key,
  Value<String?> json,
  Value<int?> expireAt,
  Value<String?> destroyKey,
  Value<int> rowid,
});

class $$DBRiverpodTableFilterComposer extends Composer<_$DB, $DBRiverpodTable> {
  $$DBRiverpodTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
      column: $table.key, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get json => $composableBuilder(
      column: $table.json, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get expireAt => $composableBuilder(
      column: $table.expireAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get destroyKey => $composableBuilder(
      column: $table.destroyKey, builder: (column) => ColumnFilters(column));
}

class $$DBRiverpodTableOrderingComposer
    extends Composer<_$DB, $DBRiverpodTable> {
  $$DBRiverpodTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
      column: $table.key, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get json => $composableBuilder(
      column: $table.json, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get expireAt => $composableBuilder(
      column: $table.expireAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get destroyKey => $composableBuilder(
      column: $table.destroyKey, builder: (column) => ColumnOrderings(column));
}

class $$DBRiverpodTableAnnotationComposer
    extends Composer<_$DB, $DBRiverpodTable> {
  $$DBRiverpodTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get json =>
      $composableBuilder(column: $table.json, builder: (column) => column);

  GeneratedColumn<int> get expireAt =>
      $composableBuilder(column: $table.expireAt, builder: (column) => column);

  GeneratedColumn<String> get destroyKey => $composableBuilder(
      column: $table.destroyKey, builder: (column) => column);
}

class $$DBRiverpodTableTableManager extends RootTableManager<
    _$DB,
    $DBRiverpodTable,
    DBRiverpodData,
    $$DBRiverpodTableFilterComposer,
    $$DBRiverpodTableOrderingComposer,
    $$DBRiverpodTableAnnotationComposer,
    $$DBRiverpodTableCreateCompanionBuilder,
    $$DBRiverpodTableUpdateCompanionBuilder,
    (DBRiverpodData, BaseReferences<_$DB, $DBRiverpodTable, DBRiverpodData>),
    DBRiverpodData,
    PrefetchHooks Function()> {
  $$DBRiverpodTableTableManager(_$DB db, $DBRiverpodTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DBRiverpodTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DBRiverpodTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DBRiverpodTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> key = const Value.absent(),
            Value<String?> json = const Value.absent(),
            Value<int?> expireAt = const Value.absent(),
            Value<String?> destroyKey = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DBRiverpodCompanion(
            key: key,
            json: json,
            expireAt: expireAt,
            destroyKey: destroyKey,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String key,
            Value<String?> json = const Value.absent(),
            Value<int?> expireAt = const Value.absent(),
            Value<String?> destroyKey = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DBRiverpodCompanion.insert(
            key: key,
            json: json,
            expireAt: expireAt,
            destroyKey: destroyKey,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$DBRiverpodTableProcessedTableManager = ProcessedTableManager<
    _$DB,
    $DBRiverpodTable,
    DBRiverpodData,
    $$DBRiverpodTableFilterComposer,
    $$DBRiverpodTableOrderingComposer,
    $$DBRiverpodTableAnnotationComposer,
    $$DBRiverpodTableCreateCompanionBuilder,
    $$DBRiverpodTableUpdateCompanionBuilder,
    (DBRiverpodData, BaseReferences<_$DB, $DBRiverpodTable, DBRiverpodData>),
    DBRiverpodData,
    PrefetchHooks Function()>;

class $DBManager {
  final _$DB _db;
  $DBManager(this._db);
  $$DBRiverpodTableTableManager get dBRiverpod =>
      $$DBRiverpodTableTableManager(_db, _db.dBRiverpod);
}
