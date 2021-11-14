import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movies/src/package/card.dart';
import 'package:movies/src/theme/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              _buildHeader(),
              _buildSectionHeader("Covid Pass"),
              const SpecialCard(
                  title: 'Scan your certificate',
                  subtitle: 'If you got vaccinated, you should have a QR code',
                  image: 'assets/images/login.png',
                  backgroundColor: Colors.indigo,
                ),
              _buildSectionHeader("Reminders"),
              const SpecialCard(
                title: 'Wash your hands',
                subtitle: 'Don’t forget to wash your hands, it’s a quick move protecting you and others',
                image: 'assets/images/register.png',
                backgroundColor: AppColors.primary,
              ),
              const SpecialCard(
                title: 'Have symptoms?',
                subtitle: 'Keep your calm, isolate yourself from others and rest as much as possible',
                image: 'assets/images/virus.png',
                imagePosition: ImagePos.bottomLeft,
                backgroundColor: Colors.lightGreen,
              ),
              const SpecialCard(
                title: 'Still not vaccinated?',
                subtitle: 'Take a look at our website and take an appointment',
                image: 'assets/images/login.png',
                backgroundColor: AppColors.redDark,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() => Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: CircleAvatar(
                child: Text(
                  "U",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                radius: 25,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Hello, Username",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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

  Widget _buildSectionHeader(String title) => Padding(
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
