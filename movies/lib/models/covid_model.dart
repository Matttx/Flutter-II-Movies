class CovidModel {
  List<CountryModel> countries;

  CovidModel(
      {required this.countries});

  factory CovidModel.fromJson(List<dynamic> data) {
    final countries = <CountryModel>[];
    for (var v in data) {
      countries.add(CountryModel.fromJson(v));
    }

    return CovidModel(countries: countries);
  }
}

class CountryModel {
  final String name;
  final String code;
  final int newConfirmed;
  final int totalConfirmed;
  final int newDeaths;
  final int totalDeaths;
  final int newRecovered;
  final int totalRecovered;
  final int date;

  CountryModel(
      {required this.name,
      required this.code,
      required this.newConfirmed,
      required this.totalConfirmed,
      required this.newDeaths,
      required this.totalDeaths,
      required this.newRecovered,
      required this.totalRecovered,
      required this.date});

  factory CountryModel.fromJson(Map<String, dynamic> data) {
    return CountryModel(
        name: data['countryName'],
        code: data['countryCode'],
        newConfirmed: data['newConfirmed'],
        totalConfirmed: data['totalConfirmed'],
        newDeaths: data['newDeaths'],
        totalDeaths: data['totalDeaths'],
        newRecovered: data['newRecovered'],
        totalRecovered: data['totalRecovered'],
        date: data['date']);
  }
}
