import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies/src/models/error.dart';
import 'package:movies/config/constants.dart' as Constants;
import 'package:movies/src/models/user.dart';

Future<User> getMe(String jwt) async {
  final queryParameters = {'jwt': jwt};

  final uri =
      Uri.http('${Constants.API_URL_NO_HTTP}:8080', '/me', queryParameters);
  var response = await http
      .get(
    uri,
  )
      .catchError((e) {
    throw Exception(Constants.SERVER_ERROR);
  });

  if (response.statusCode == 200) {
    return User.fromJson(jsonDecode(response.body));
  } else {
    var error = APIError.fromJson(jsonDecode(response.body));

    if (error.message != null) {
      throw Exception(error.message);
    } else {
      throw Exception(Constants.DEFAULT_REGISTER_ERROR);
    }
  }
}

Future<void> deleteUser(String jwt) async {
  final queryParameters = {'jwt': jwt};

  final uri = Uri.http(
      '${Constants.API_URL_NO_HTTP}:8080', '/user/delete', queryParameters);
  var response = await http
      .delete(
    uri,
  )
      .catchError((e) {
    throw Exception(Constants.SERVER_ERROR);
  });

  if (response.statusCode == 200) {
    return;
  } else {
    var tmp = jsonDecode(response.body);
    var error = APIError.fromJson(jsonDecode(response.body));

    if (error.message != null) {
      throw Exception(error.message);
    } else {
      throw Exception(Constants.DEFAULT_REGISTER_ERROR);
    }
  }
}

Future<void> updateUser(String jwt, String email) async {
  final queryParameters = {'jwt': jwt};

  final uri = Uri.http(
      '${Constants.API_URL_NO_HTTP}:8080', '/user/update', queryParameters);
  var response = await http.put(
    uri,
    body: jsonEncode({
      'fields': {'email': email},
    }),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  ).catchError((e) {
    throw Exception(Constants.SERVER_ERROR);
  });

  if (response.statusCode == 200) {
    return;
  } else {
    var tmp = jsonDecode(response.body);
    var error = APIError.fromJson(jsonDecode(response.body));

    if (error.message != null) {
      throw Exception(error.message);
    } else {
      throw Exception(Constants.DEFAULT_REGISTER_ERROR);
    }
  }
}
