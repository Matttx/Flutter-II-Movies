import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movies/models/covid_model.dart';
import 'package:movies/src/pages/countries_list.dart';
import 'package:movies/src/pages/tracker_informations.dart';
import 'package:movies/src/widgets/list_item.dart';

void main() {
  group("Tracker Page Tests", () {
    var data = CovidModel(countries: [
      CountryModel(
          name: "France",
          code: "FR",
          date: 1636987463,
          newConfirmed: 530,
          newDeaths: 20,
          newRecovered: 400,
          totalConfirmed: 500,
          totalDeaths: 50,
          totalRecovered: 300),
      CountryModel(
          name: "Global",
          code: "GB",
          date: 1636987463,
          newConfirmed: 530,
          newDeaths: 20,
          newRecovered: 400,
          totalConfirmed: 500,
          totalDeaths: 50,
          totalRecovered: 300)
    ]);

    Widget _boilerplate({required Widget child}) {
      return MaterialApp(
        home: Scaffold(
          body: SafeArea(
            child: child,
          ),
        ),
      );
    }

    testWidgets('Header text', (WidgetTester tester) async {
      await tester.pumpWidget(_boilerplate(child: TrackerPage(data: data)));

      var finder = find.byKey(const Key("Title"));
      expect(finder, findsOneWidget);
    });

    testWidgets('Section header', (WidgetTester tester) async {
      await tester.pumpWidget(_boilerplate(child: TrackerPage(data: data)));

      expect(find.byKey(const Key("GlobalHeader")), findsOneWidget);
      expect(find.byKey(const Key("CountriesHeader")), findsOneWidget);
    });

    testWidgets('Global Informations', (WidgetTester tester) async {
      await tester.pumpWidget(_boilerplate(child: TrackerPage(data: data)));

      expect(find.byKey(const Key("GlobalInformations")), findsOneWidget);
    });

    testWidgets('Countries List', (WidgetTester tester) async {
      await tester.pumpWidget(_boilerplate(child: TrackerPage(data: data)));

      expect(find.byKey(const Key("CountriesList")), findsOneWidget);
    });

    testWidgets('Countries Full List Scroll View', (WidgetTester tester) async {
      await tester.pumpWidget(_boilerplate(child: CountriesList(countries: data.countries)));

      expect(find.byKey(const Key("CountriesFullListScrollView")), findsOneWidget);
    });

    testWidgets('Countries Search Field', (WidgetTester tester) async {
      await tester.pumpWidget(_boilerplate(child: CountriesList(countries: data.countries)));

      expect(find.byKey(const Key("CountriesSearchField")), findsOneWidget);
    });

    testWidgets('Countries Full List', (WidgetTester tester) async {
      await tester.pumpWidget(_boilerplate(child: CountriesList(countries: data.countries)));

      expect(find.byKey(const Key("CountriesFullList")), findsOneWidget);
    });

    testWidgets('List Item', (WidgetTester tester) async {
      await tester.pumpWidget(_boilerplate(child: ListItem(country: data.countries[0])));

      expect(find.byKey(const Key("ListItem")), findsOneWidget);
    });

    testWidgets('List Infos', (WidgetTester tester) async {
      await tester.pumpWidget(_boilerplate(child: ListItem(country: data.countries[0])));

      expect(find.byKey(const Key("ListInfos")), findsOneWidget);
    });
  });
}
