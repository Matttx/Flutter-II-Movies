import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:movies/config/constants.dart' as Constants;
import 'package:movies/src/controllers/user_controller.dart';
import 'package:movies/src/models/user.dart';

import 'user_tests.mocks.dart';

class MockClientHttp extends Mock implements http.Client {}

@GenerateMocks([MockClientHttp])
void main() {
  group('getMe Call', () {
    test('returns a User if the getMe call completes successfully', () async {
      final client = MockMockClientHttp();
      final queryParameters = {'jwt': 'ad0dea00-7b40-4fcc-98ea-8afe6428f265'};
      String queryString = Uri(queryParameters: queryParameters).query;

      when(client.get(Uri.parse('${Constants.API_URL}:8080/me?$queryString')))
          .thenAnswer((_) async => http.Response(
              '{"message": "Document successfully found", "result": [{"email":"Thomas@email.fr","password":"toto","jwt":"ad0dea00-7b40-4fcc-98ea-8afe6428f265","username":"thomas"}]}',
              200));

      expect(await getMe(client, "ad0dea00-7b40-4fcc-98ea-8afe6428f265"),
          isA<User>());
    });

    test('throws an exception if the getMe call completes with an error',
        () async {
      final client = MockMockClientHttp();
      final queryParameters = {'jwt': 'ad0dea00-7b40-4fcc-98ea-8afe6428f26'};
      String queryString = Uri(queryParameters: queryParameters).query;

      when(client.get(Uri.parse('${Constants.API_URL}:8080/me?$queryString')))
          .thenAnswer((_) async => http.Response(
              '{"message": "Document not found", "result": []}', 400));

      expect(getMe(client, "ad0dea00-7b40-4fcc-98ea-8afe6428f26"),
          throwsException);
    });
  });

  group('deleteUser Call', () {
    test('returns true if the deleteUser call completes successfully',
        () async {
      final client = MockMockClientHttp();
      final queryParameters = {'jwt': 'ad0dea00-7b40-4fcc-98ea-8afe6428f265'};
      String queryString = Uri(queryParameters: queryParameters).query;

      when(client.delete(
              Uri.parse('${Constants.API_URL}:8080/user/delete?$queryString')))
          .thenAnswer((_) async => http.Response(
              '{"message": "Document successfully deleted", "result": []}',
              200));

      expect(await deleteUser(client, "ad0dea00-7b40-4fcc-98ea-8afe6428f265"),
          isTrue);
    });

    test('throws an exception if the deleteUser call completes with an error',
        () async {
      final client = MockMockClientHttp();
      final queryParameters = {'jwt': 'ad0dea00-7b40-4fcc-98ea-8afe6428f26'};
      String queryString = Uri(queryParameters: queryParameters).query;

      when(client.delete(
              Uri.parse('${Constants.API_URL}:8080/user/delete?$queryString')))
          .thenAnswer((_) async => http.Response(
              '{"message": "Document not deleted", "result": []}', 400));

      expect(deleteUser(client, "ad0dea00-7b40-4fcc-98ea-8afe6428f26"),
          throwsException);
    });
  });

  group('updateUser Call', () {
    test('returns true if the updateUser call completes successfully',
        () async {
      final client = MockMockClientHttp();
      final queryParameters = {'jwt': 'ad0dea00-7b40-4fcc-98ea-8afe6428f265'};
      String queryString = Uri(queryParameters: queryParameters).query;

      when(client.put(
        Uri.parse('${Constants.API_URL}:8080/user/update?$queryString'),
        body: jsonEncode({
          'fields': {'email': 'Thomas@email.fr'},
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      )).thenAnswer((_) async => http.Response(
          '{"message": "Document successfully updated", "result": []}', 200));

      expect(
          await updateUser(client, "ad0dea00-7b40-4fcc-98ea-8afe6428f265",
              "Thomas@email.fr"),
          isTrue);
    });

    test('throws an exception if the updateUser call completes with an error',
        () async {
      final client = MockMockClientHttp();
      final queryParameters = {'jwt': 'ad0dea00-7b40-4fcc-98ea-8afe6428f26'};
      String queryString = Uri(queryParameters: queryParameters).query;

      when(client.put(
        Uri.parse('${Constants.API_URL}:8080/user/update?$queryString'),
        body: jsonEncode({
          'fields': {'email': "Thomas@email.fr"},
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      )).thenAnswer((_) async => http.Response(
          '{"message": "Document not updated", "result": []}', 400));

      expect(
          updateUser(
              client, "ad0dea00-7b40-4fcc-98ea-8afe6428f26", "Thomas@email.fr"),
          throwsException);
    });
  });
}
