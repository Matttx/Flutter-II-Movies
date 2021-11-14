import 'package:flutter/material.dart';
import 'package:movies/blocs/covid/covid_bloc.dart';
import 'package:movies/models/covid_model.dart';
import 'package:movies/src/pages/tracker_informations.dart';

class TrackerScreen extends StatefulWidget {
  const TrackerScreen({Key? key}) : super(key: key);

  @override
  _TrackerScreenState createState() => _TrackerScreenState();
}

class _TrackerScreenState extends State<TrackerScreen> {
  final covidBloc = CovidBloc();

  @override
  void initState() {
    covidBloc.covidEventSink.add(CovidAction.Fetch);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder<CovidModel>(
          stream: covidBloc.covid,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return TrackerPage(data: snapshot.data!);
            }
            if (snapshot.hasError) {
              return Center(
                  child: Text(snapshot.error.toString())
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
