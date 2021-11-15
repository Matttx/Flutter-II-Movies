import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movies/src/app.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences s = await SharedPreferences.getInstance();

  var token = s.getString('jwt') ?? '';
  bool isLoggedIn = token.isNotEmpty;

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MyApp(isLoggedIn: isLoggedIn)));
}
