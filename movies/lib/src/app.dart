import 'package:flutter/material.dart';
import 'package:movies/blocs/covid/covid_bloc.dart';
import 'package:movies/models/covid_model.dart';
import 'package:movies/src/pages/main_informations.dart';
import 'package:flutter/services.dart';
import 'package:movies/src/theme/app_colors.dart';
import 'package:movies/src/theme/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.background,
      statusBarBrightness: Brightness.dark
    ));
    return MaterialApp(
      title: 'Movies',
      theme: AppTheme.defaultTheme,
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              return MainPage(data: snapshot.data!);
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