import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies/src/models/token.dart';

Future<Token> register(String username, String email, String password) async {
  var response = await http.post(
    Uri.parse('http://192.168.0.14:8080/register'),
    body: {
      'email': email,
      'password': password,
      'username': username
    },
  ).catchError((e) {
    throw Exception('Server Error');
  });

  if (response.statusCode == 200) {
    return Token.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Email address already used');
  }
}
