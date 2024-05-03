import 'package:flutter/material.dart';
import 'package:repro/src/rust/api/simple.dart';
import 'package:repro/src/rust/frb_generated.dart';

Future<void> main() async {
  await RustLib.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final OpaqueData _opaqueData = makeData();

  @override
  void initState() {
    super.initState();
    startUpdaters();
    startGetters();
  }

  Future<void> startUpdaters() async {
    for (int i = 0; i < 10; i++) {
      _updateData();
    }
  }

  Future<void> _updateData() async {
    while (true) {
      await mutateData(data: _opaqueData);
      await Future.delayed(const Duration(milliseconds: 100));
    }
  }

  Future<void> startGetters() async {
    for (int i = 0; i < 10; i++) {
      _getData();
    }
  }

  Future<void> _getData() async {
    while (true) {
      final data = await getData(data: _opaqueData);
      print('Data: $data');
      await Future.delayed(const Duration(milliseconds: 100));
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('flutter_rust_bridge quickstart')),
        body: Center(
          child: Text(
              'Action: Call Rust `greet("Tom")`\nResult: `${greet(name: "Tom")}`'),
        ),
      ),
    );
  }
}
