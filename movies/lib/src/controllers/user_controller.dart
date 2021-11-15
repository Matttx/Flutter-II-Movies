import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies/src/models/error.dart';
import 'package:movies/config/constants.dart' as Constants;
import 'package:movies/src/models/user.dart';

Future<User> getMe(http.Client client, String jwt) async {
  final queryParameters = {'jwt': jwt};
  String queryString = Uri(queryParameters: queryParameters).query;

  var response = await client
      .get(Uri.parse('${Constants.API_URL}:8080/me?$queryString'))
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
      throw Exception(Constants.DEFAULT_GET_USER_ERROR);
    }
  }
}

Future<bool> deleteUser(http.Client client, String jwt) async {
  final queryParameters = {'jwt': jwt};
  String queryString = Uri(queryParameters: queryParameters).query;

  var response = await client
      .delete(Uri.parse('${Constants.API_URL}:8080/user/delete?$queryString'))
      .catchError((e) {
    throw Exception(Constants.SERVER_ERROR);
  });

  if (response.statusCode == 200) {
    return true;
  } else {
    var error = APIError.fromJson(jsonDecode(response.body));

    if (error.message != null) {
      throw Exception(error.message);
    } else {
      throw Exception(Constants.DEFAULT_DELETE_USER_ERROR);
    }
  }
}

Future<bool> updateUser(http.Client client, String jwt, String email) async {
  final queryParameters = {'jwt': jwt};
  String queryString = Uri(queryParameters: queryParameters).query;

  var response = await client.put(
    Uri.parse('${Constants.API_URL}:8080/user/update?$queryString'),
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
    return true;
  } else {
    var tmp = jsonDecode(response.body);
    var error = APIError.fromJson(jsonDecode(response.body));

    if (error.message != null) {
      throw Exception(error.message);
    } else {
      throw Exception(Constants.DEFAULT_PUT_USER_ERROR);
    }
  }
}
