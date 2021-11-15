import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movies/blocs/user/user_bloc.dart';
import 'package:movies/src/models/user.dart';
import 'package:movies/src/package/card.dart';
import 'package:movies/src/pages/profile_page.dart';
import 'package:movies/src/theme/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final userBloc = UserBloc(jwt: '');

  Future<void> getSharedPrefs() async {
    SharedPreferences s = await SharedPreferences.getInstance();
    String? jwt = s.getString("jwt");
    if (jwt != null) {
      userBloc.jwt = jwt;
    }
  }

  @override
  void initState() {
    getSharedPrefs();
    userBloc.userEventSink.add(UserAction.Fetch);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder<User>(
          stream: userBloc.user,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView(
                  children: [
                    _buildHeader(snapshot),
                    _buildSectionHeader("Covid Pass"),
                    const SpecialCard(
                      title: 'Scan your certificate',
                      subtitle: 'If you got vaccinated, you should have a QR code',
                      image: 'assets/images/qrcode.png',
                      backgroundColor: Colors.indigo,
                    ),
                    _buildSectionHeader("Reminders"),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: SpecialCard(
                        title: 'Wash your hands',
                        subtitle: 'Don’t forget to wash your hands, it’s a quick move protecting you and others',
                        image: 'assets/images/washing.png',
                        backgroundColor: AppColors.primary,
                      ),
                    ),
                     const Padding(
                       padding: EdgeInsets.symmetric(vertical: 10),
                       child: SpecialCard(
                        title: 'Have symptoms?',
                        subtitle: 'Keep your calm, isolate yourself from others and rest as much as possible',
                        image: 'assets/images/coughing.png',
                        imagePosition: ImagePos.bottomLeft,
                        backgroundColor: Colors.lightGreen,
                    ),
                     ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: SpecialCard(
                        title: 'Still not vaccinated?',
                        subtitle: 'Take a look at our website and take an appointment',
                        image: 'assets/images/innovation.png',
                        backgroundColor: AppColors.redDark,
                      ),
                    ),
                  ],
                ),
              );
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

  Widget _buildHeader(snapshot) =>
      Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: CircleAvatar(
                child: Text(
                  snapshot.data!.username.isNotEmpty
                      ? snapshot.data!.username[0].toUpperCase()
                      : "?",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                radius: 25,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello, ${snapshot.data!.username.isNotEmpty
                      ? snapshot.data!.username
                      : "?"}',
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  DateFormat('E dd MMM. yyyy').format(DateTime.now()),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: AppColors.grey),
                )
              ],
            )
          ],
        ),
      );

  Widget _buildSectionHeader(String title) =>
      Padding(
        padding: const EdgeInsets.only(bottom: 10.0, top: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );
}
