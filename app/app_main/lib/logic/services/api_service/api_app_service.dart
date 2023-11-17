import 'dart:convert';

import 'package:app_main/domain/domain.dart';
import 'package:http/http.dart' as http;

class ApiAppService implements IApiService {
  static const String _url = 'https://api.byteplex.info/api/test/contact/';

  @override
  Future<bool> post(Contact contact) async {
    bool result = false;
    try {
      var response = await http.post(
        Uri.parse(_url),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: json.encode(contact.toJson()),
      );
      if (response.statusCode == 201) {
        result = true;
      }
    } catch (e) {
      return result;
    }

    return result;
  }
}
