import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:movies/src/controllers/authentication_controller.dart';
import 'package:movies/src/models/token.dart';
import 'package:movies/src/pages/login_screen.dart';
import 'package:movies/config/constants.dart' as Constants;

import 'login_test.mocks.dart';

class MockClientHttp extends Mock implements http.Client {}

@GenerateMocks([MockClientHttp])
void main() {

  group('Login Page tests', () {
    Widget _boilerplate({required Widget child}){
      return MaterialApp(
        home: child,
      );
    }

    Finder _findText(String text) {
      return find.text(text);
    }

    testWidgets('Header text', (WidgetTester tester) async {
      await tester.pumpWidget(_boilerplate(child: const LoginScreen()));

      expect(_findText('Sign in'), findsOneWidget);
    });

    testWidgets('Header text', (WidgetTester tester) async {
      await tester.pumpWidget(_boilerplate(child: const LoginScreen()));

      expect(_findText('Sign in'), findsOneWidget);
    });

  });

  group('Login Call', () {
    test('returns a Token if the http call completes successfully', () async {
      final client = MockMockClientHttp();

      when(client
          .post(Uri.parse('${Constants.API_URL}:8080/login'), body: {'email': "Thomas@email.fr", 'password': "toto"}))
          .thenAnswer((_) async =>
          http.Response('{"message": "Successfully logged in", "result": "ad0dea00-7b40-4fcc-98ea-8afe6428f265"}', 200));

      expect(await login(client, "Thomas@email.fr", "toto"), isA<Token>());
    });

    test('throws an exception if the http call completes with an error', () async {
      final client = MockMockClientHttp();

      when(client
          .post(Uri.parse('${Constants.API_URL}:8080/login'), body: {'email': "Thomas@email.fr", 'password': "tot"}))
          .thenAnswer((_) async =>
          http.Response('{"message": "Wrong password", "result": []}', 400));

      expect(login(client, "Thomas@email.fr", "tot"), throwsException);
    });
  });
}