import 'package:drift/drift.dart';
import 'package:drift/wasm.dart';

import 'db.dart';

DB connectDb(String dbPath) {
  var databaseConnection = DatabaseConnection.delayed(Future(() async {
    final result = await WasmDatabase.open(
      databaseName: 'pophere_riverpod', // prefer to only use valid identifiers here
      sqlite3Uri: Uri.parse('sqlite3.wasm'),
      driftWorkerUri: Uri.parse('drift_worker.js'),
    );

    if (result.missingFeatures.isNotEmpty) {
      // Go.showSnackBarWarn(result.missingFeatures.toString());
    }

    return result.resolvedExecutor;
  }));
  return DB(databaseConnection);
}
