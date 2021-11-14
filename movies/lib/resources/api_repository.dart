import 'package:movies/models/covid_model.dart';
import 'api_provider.dart';
import 'package:movies/src/models/user.dart';
import 'package:movies/src/controllers/user_controller.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<CovidModel> fetchCovidList() {
    return _provider.fetchCovidList();
  }

  Future<User> fetchUser(String jwt) {
    return getMe(jwt);
  }
}

class NetworkError extends Error {}
