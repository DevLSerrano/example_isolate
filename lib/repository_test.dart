import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class RepositoryTest {
  Future<String> checkUpdate() async {
    return await Future.delayed(Duration(seconds: 3), () {
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

  Future<void> functionLogin() async {
    print('Fazendo verificação de login');

    await Future.delayed(Duration(seconds: 1), () {
      print('login success');
    });

    return;
  }
}
