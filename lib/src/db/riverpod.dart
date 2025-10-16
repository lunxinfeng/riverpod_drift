part of 'db.dart';

class DBRiverpod extends Table {
  // TextColumn get key => text().customConstraint('PRIMARY KEY NOT NULL')();
  TextColumn get key => text()();

  TextColumn get json => text().nullable()();

  IntColumn get expireAt => integer().nullable()();

  TextColumn get destroyKey => text().nullable()();

  @override
  Set<Column<Object>>? get primaryKey => {key};

  // @override
  // List<String> get customConstraints => ['WITHOUT ROWID'];
}
