import 'package:dio/dio.dart';
import 'package:movies/models/covid_model.dart';
import 'package:movies/config/constants.dart' as Constants;

class ApiProvider {
  final Dio _dio = Dio();
  final String _url = '${Constants.API_URL}:8080/';

  Future<CovidModel> fetchCovidList() async {
    try {
      Response response = await _dio.get(_url + "countries");
      return CovidModel.fromJson(response.data["result"]);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return Future.error("Data not found / Connection issue");
    }
  }
}