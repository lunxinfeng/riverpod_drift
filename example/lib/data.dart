import 'dart:math';
import 'package:riverpod_annotation/experimental/json_persist.dart';
import 'package:riverpod_annotation/experimental/persist.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_drift/riverpod_drift.dart';

part 'data.g.dart';

@riverpod
@JsonPersist()
class Data extends _$Data {
  @override
  FutureOr<List<int>> build() async {
    persist(ref.watch(storageProvider.future));

    await Future.delayed(Duration(seconds: 5));
    return List.generate(10, (index) {
      return Random().nextInt(10);
    });
  }
}

@riverpod
Future<JsonSqFliteStorage> storage(Ref ref) async {
  // Initialize SQFlite. We should share the Storage instance between providers.
  return JsonSqFliteStorage.open(
    join(await (getApplicationDocumentsDirectory().then((value) => value.path)), 'riverpod_drift.db'),
  );
}
