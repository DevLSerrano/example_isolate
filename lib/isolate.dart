import 'dart:async';
import 'dart:isolate';

import 'package:example_isolate/repository_test.dart';

class IsolateExample {
  static final repository = RepositoryTest();

  Future<void> start() async {
    print('Disparando isolate');
    await initIsolate();
  }

  Future<void> initIsolate() async {
    ReceivePort isolateToMainStream = ReceivePort();

    final myIsolateInstance =
        await Isolate.spawn(myIsolate, isolateToMainStream.sendPort);

    isolateToMainStream.listen((data) async {
      print('$data');
      if (data == null) {
        onClose(myIsolateInstance, isolateToMainStream);
      } else if (data.isNotEmpty) {
        await repository.saveTheKeys(data);
      }
    });
  }

  void onClose(Isolate myIsolateInstance, ReceivePort isolateToMainStream) {
    print('Finish Isolate translate');
    isolateToMainStream.close();
    myIsolateInstance.kill(priority: Isolate.immediate);
  }

  static void myIsolate(SendPort port) async {
    SendPort isolateToMainStream = port;
    await repository.checkUpdate().then((value) {
      isolateToMainStream.send(value);
      isolateToMainStream.send(null);
    });
  }
}
