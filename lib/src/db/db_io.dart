import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';

import 'db.dart';

// LazyDatabase openConnection() {
//   // the LazyDatabase util lets us find the right location for the file async.
//   return LazyDatabase(() async {
//     // put the database file, called db.sqlite here, into the documents folder
//     // for your app.
//     final dbFolder = await getApplicationDocumentsDirectory();
//     final file = File(p.join(dbFolder.path, 'go_power.sqlite'));
//
//     // Also work around limitations on old Android versions
//     if (Platform.isAndroid) {
//       await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
//     }
//     return NativeDatabase.createInBackground(file);
//   });
// }

DB connectDb(String dbPath) {
  final db = LazyDatabase(() async {
    final file = File(dbPath);
    return NativeDatabase(file, logStatements: true);
  });
  return DB(db);
}