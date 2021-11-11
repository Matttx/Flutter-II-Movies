import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movies/src/theme/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              _buildHeader(),
              _buildSectionHeader("Covid Pass"),
              SizedBox(
                height: 100,
                child: Text("Widget"),
              ),
              _buildSectionHeader("Reminders"),
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
        Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: CircleAvatar(child: Text("U", style: TextStyle(fontWeight: FontWeight.bold),), backgroundColor: AppColors.primary, foregroundColor: Colors.white, radius: 25,),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hello, Username", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            Text(DateFormat('E dd MMM. yyyy').format(DateTime.now()), style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.grey),)
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
        Text(title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
      ],
    ),
  );
}
