import 'dart:async';

import 'package:movies/models/covid_model.dart';
import 'package:movies/resources/api_repository.dart';

enum CovidAction { Fetch }

class CovidBloc {
  final ApiRepository _apiRepo = ApiRepository();

  final _covidStateController = StreamController<CovidModel>();

  StreamSink<CovidModel> get _covidSink => _covidStateController.sink;

  Stream<CovidModel> get covid => _covidStateController.stream;

  final _covidEventController = StreamController<CovidAction>();

  StreamSink<CovidAction> get covidEventSink => _covidEventController.sink;

  Stream<CovidAction> get _covidEventStream => _covidEventController.stream;


  CovidBloc() {
    _covidEventStream.listen(_mapEventToState);
  }

  void _mapEventToState(CovidAction event) async {
    if (event == CovidAction.Fetch) {
      try {
        CovidModel covidInfos = await _apiRepo.fetchCovidList();
      _covidSink.add(covidInfos);
      } on Exception catch (_) {
        _covidSink.addError("Something went wrong");
      }
    }
  }
}
