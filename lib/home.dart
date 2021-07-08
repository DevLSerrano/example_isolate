import 'package:example_isolate/repository_test.dart';
import 'package:flutter/material.dart';

import 'isolate.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final isolateModel = IsolateExample();
  final repository = RepositoryTest();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await isolateModel.start();
          await repository.functionLogin();
        },
      ),
      appBar: AppBar(),
    );
  }
}
