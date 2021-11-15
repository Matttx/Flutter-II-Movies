import 'package:dio/dio.dart';
import 'package:movies/models/covid_model.dart';
import 'api_provider.dart';
import 'package:movies/src/models/user.dart';
import 'package:movies/src/controllers/user_controller.dart';
import 'package:http/http.dart' as http;

class ApiRepository {
  final _provider = ApiProvider(Dio());

  Future<CovidModel> fetchCovidList() {
    return _provider.fetchCovidList();
  }

  Future<User> fetchUser(String jwt) {
    return getMe(http.Client(), jwt);
  }
}

class NetworkError extends Error {}
