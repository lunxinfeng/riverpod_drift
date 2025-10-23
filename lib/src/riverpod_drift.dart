import 'dart:async';
import 'package:clock/clock.dart';
import 'package:drift/drift.dart';
import 'package:riverpod/experimental/persist.dart';

import 'db/db.dart';

/// A storage that stores data in SQLite using JSON.
///
/// Only JSON serializable is supported.
/// This is generally used in combination `riverpod_annotation's` `JsonPersist`.
final class JsonSqFliteStorage extends Storage<String, String> {
  JsonSqFliteStorage._(this._db);

  /// Opens a database at the specified [path].
  ///
  /// This will create a table named `riverpod` if it does not exist,
  /// and will delete any expired data present.
  ///
  /// [open] relies on the `clock` package to obtain the current time, for the
  /// purpose of determining if a key has expired.
  /// This enables your tests to mock the current type.
  static Future<JsonSqFliteStorage> open(String path) async {
    final db = connectDb(path);
    final instance = JsonSqFliteStorage._(db);
    await instance.deleteOutOfDate();
    return instance;
  }

  final DB _db;

  /// Closes the database.
  ///
  /// This makes the object unusable.
  Future<void> close() => _db.close();

  @override
  Future<void> deleteOutOfDate() async {
    await (_db.delete(_db.dBRiverpod)..where((t) => t.expireAt.isSmallerThanValue(_currentTimestamp()))).go();
  }

  @override
  Future<void> delete(String key) async {
    // riverpod 3.0.3 will delete when build error, but is not reasonable, wait fix
    // await (_db.delete(_db.dBRiverpod)..where((t) => t.key.equals(key))).go();
  }

  int _currentTimestamp() => clock.now().toUtc().millisecondsSinceEpoch;

  @override
  Future<PersistedData<String>?> read(String key) async {
    return _db.transaction(() async {
      final query = _db.select(_db.dBRiverpod)
        ..where((t) => t.key.equals(key))
        ..limit(1);

      final result = await query.getSingleOrNull();

      // 如果找不到，直接返回 null
      if (result == null) return null;

      return result.toPersistedData();
    });
  }

  @override
  Future<void> write(String key, String value, StorageOptions options) async {
    await _db.into(_db.dBRiverpod).insertOnConflictUpdate(
          DBRiverpodCompanion(
            key: Value(key),
            json: Value(value),
            expireAt: Value(
              switch (options.cacheTime.duration) {
                null => null,
                final Duration duration => _currentTimestamp() + duration.inMilliseconds,
              },
            ),
            destroyKey: Value(options.destroyKey),
          ),
        );
  }
}

extension DBRiverpodDataExt on DBRiverpodData {
  PersistedData<String> toPersistedData() {
    return PersistedData(
      json!,
      destroyKey: destroyKey,
      expireAt: expireAt == null ? null : DateTime.fromMillisecondsSinceEpoch(expireAt!),
    );
  }
}
