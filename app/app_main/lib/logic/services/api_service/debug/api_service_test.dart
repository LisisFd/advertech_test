import 'dart:math';

import 'package:app_main/domain/domain.dart';

class ApiServiceTest implements IApiService {
  @override
  Future<bool> post(Contact contact) async {
    bool random = Random().nextBool();
    await Future.delayed(
      const Duration(seconds: 2),
    );
    return random;
  }
}
