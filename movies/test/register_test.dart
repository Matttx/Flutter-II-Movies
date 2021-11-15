import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movies/config/constants.dart' as Constants;
import 'package:movies/src/controllers/authentication_controller.dart';
import 'package:movies/src/models/token.dart';

import 'register_test.mocks.dart';

class MockClientHttp extends Mock implements http.Client {}

@GenerateMocks([MockClientHttp])
void main() {

  group('Login Call', () {
    test('returns a Token if the http call completes successfully', () async {
      final client = MockMockClientHttp();

      when(client
          .post(Uri.parse('${Constants.API_URL}:8080/register'), body: {'email': "Thomas@email.fr", 'password': "toto", 'username': "thomas"}))
          .thenAnswer((_) async =>
          http.Response('{"message": "Account successfully created", "result": "ad0dea00-7b40-4fcc-98ea-8afe6428f265"}', 200));

      expect(await register(client, "thomas", "Thomas@email.fr", "toto"), isA<Token>());
    });

    test('throws an exception if the http call completes with an error', () async {
      final client = MockMockClientHttp();

      when(client
          .post(Uri.parse('${Constants.API_URL}:8080/register'), body: {'email': "Thomas@email.fr", 'password': "toto", 'username': "thomas"}))
          .thenAnswer((_) async =>
          http.Response('{"message": "Email already used", "result": []}', 400));

      expect(register(client, "thomas", "Thomas@email.fr", "toto"), throwsException);
    });
  });
}