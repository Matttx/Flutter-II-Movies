import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:movies/config/constants.dart' as Constants;
import 'package:movies/models/covid_model.dart';
import 'package:movies/resources/api_provider.dart';

void main() {
  final dio = Dio();
  final dioAdapter = DioAdapter(dio: dio);

  setUp(() {
    dio.httpClientAdapter = dioAdapter;
  });

  group('fetchCovidList call', () {
    test('returns a CovidModel if the http call completes successfully',
        () async {
      dioAdapter.onGet('${Constants.API_URL}:8080/countries', (request) {
        return request.reply(
            200,
            json.decode(
                '{"message": "Documents successfully found", "result": [{"totalConfirmed":156323,"countryName":"Afghanistan","totalDeaths":7284,"newConfirmed":0,"totalRecovered":0,"newRecovered":0,"countryCode":"AF","newDeaths":0,"date":1636035236}]}'));
      }, data: null, queryParameters: {}, headers: {});

      final apiProvider = ApiProvider(dio);

      expect(await apiProvider.fetchCovidList(), isA<CovidModel>());
    });
  });
}
