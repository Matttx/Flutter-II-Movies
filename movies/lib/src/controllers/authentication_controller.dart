import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

Future<http.Response> register(String username, String email, String password) async {
  print('Sup');
  var response = await http.post(
    Uri.parse('http://192.168.0.14:8080/register'),
    body: {
      'email': email,
      'password': password,
      'username': username
    },
  );
  print('Hello');

  print(response.body);
  if (response.statusCode == 200) {
    return response;
  } else if (response.statusCode >= 500){
    throw Exception('Server Error');
  } else {
    throw Exception('Failed to register.');
  }
}
