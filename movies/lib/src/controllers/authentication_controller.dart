import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies/src/models/error.dart';
import 'package:movies/src/models/token.dart';
import 'package:movies/config/constants.dart' as Constants;

Future<Token> register(String username, String email, String password) async {
  var response = await http.post(
    Uri.parse('${Constants.API_URL}:8080/register'),
    body: {
      'email': email,
      'password': password,
      'username': username
    },
  ).catchError((e) {
    throw Exception(Constants.SERVER_ERROR);
  });

  if (response.statusCode == 200) {
    return Token.fromJson(jsonDecode(response.body));
  } else {
    var error = APIError.fromJson(jsonDecode(response.body));

    if (error.message != null) {
      throw Exception(error.message);
    } else {
      throw Exception(Constants.DEFAULT_REGISTER_ERROR);
    }
  }
}

Future<Token> login(String email, String password) async {
  var response = await http.post(
    Uri.parse('${Constants.API_URL}:8080/login'),
    body: {
      'email': email,
      'password': password
    },
  ).catchError((e) {
    throw Exception(Constants.SERVER_ERROR);
  });

  if (response.statusCode == 200) {
    return Token.fromJson(jsonDecode(response.body));
  } else {
    var error = APIError.fromJson(jsonDecode(response.body));

    if (error.message != null) {
      throw Exception(error.message);
    } else {
      throw Exception(Constants.DEFAULT_LOGIN_ERROR);
    }
  }
}
