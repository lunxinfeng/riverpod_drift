import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_drift_example/data.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Platform messages are asynchronous, so we initialize in an async method.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Plugin example app')),
        body: Consumer(
          builder: (context, ref, child) {
            var asyncValue = ref.watch(dataProvider);
            return asyncValue.when(
              skipLoadingOnReload: true,
              data: (data) {
                return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final item = data[index];
                    return ListTile(title: Text(item.toString()));
                  },
                );
              },
              error: (error, stackTrace) => Text("Error"),
              loading: () => CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
