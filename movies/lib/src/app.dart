import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movies/src/theme/app_colors.dart';
import 'package:movies/src/theme/app_theme.dart';

import 'package/card.dart';

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
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: Center(
          child: Column(
            children: const <Widget>[
              SpecialCard(
                subtitle: "If you got vaccinated, you should have a QR code",
                title: 'Scan your certificate',
                image: 'assets/innovation.png',
                backgroundColor: AppColors.grey,
                imagePosition: ImagePos.topRight,
              ),
              SpecialCard(
                subtitle: "Don’t forget to wash your hands, it’s a quick move protecting you and others",
                title: 'Wash your hands',
                image: 'assets/innovation.png',
                backgroundColor: AppColors.primaryDark,
                imagePosition: ImagePos.right,
              ),
              SpecialCard(
                subtitle: "Keep your calm, isolate yourself from others and rest as much as possible",
                title: 'Have symptoms?',
                image: 'assets/qrcode.png',
                backgroundColor: AppColors.primaryLight,
                imagePosition: ImagePos.bottomRight,
              ),
              SpecialCard(
                subtitle: "Take a look at our website and take an appointment",
                title: 'Still not vaccinated?',
                image: 'assets/innovation.png',
                backgroundColor: AppColors.redDark,
                imagePosition: ImagePos.bottomRight,
              ),
            ]
          )
        ),
      ),
    );
  }
}
