import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movies/src/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const MyApp()));
}
