import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class RepositoryTest {
  Future<String> checkUpdate() async {
    return await Future.delayed(Duration(seconds: 8), () {
      return """{
        'title': 'teste',
      }""";
    });
  }

  Future<void> saveTheKeys(String map) async {
    final sharedP = await SharedPreferences.getInstance();

    print('Salvando $map');
    await sharedP.setString('keys', map);
    return;
  }

  Future<void> functionOne() async {
    await Future.delayed(Duration(seconds: 1), () {
      print('functionOne');
    });

    return;
  }

  Future<void> functionTwo() async {
    await Future.delayed(Duration(seconds: 1), () {
      print('functionTwo');
    });

    return;
  }

  Future<void> functionThree() async {
    await Future.delayed(Duration(seconds: 1), () {
      print('functionThree');
    });

    return;
  }

  Future<void> functionFour() async {
    await Future.delayed(Duration(seconds: 1), () {
      print('functionFour');
    });

    return;
  }
}
