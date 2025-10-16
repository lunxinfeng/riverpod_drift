import 'package:drift/drift.dart';
export 'db_io.dart' if (dart.library.html) 'db_web.dart';

part 'db.g.dart';

part 'riverpod.dart';

@DriftDatabase(tables: [DBRiverpod])
class DB extends _$DB {
  DB(super.e);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
      onCreate: (Migrator m) {
        return m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {});
}
