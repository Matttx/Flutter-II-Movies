import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movies/src/pages/home_screen.dart';
import 'package:movies/src/pages/profile_page.dart';
import 'package:movies/src/pages/tracker_screen.dart';
import 'package:movies/src/theme/app_colors.dart';
import 'package:movies/src/widgets/custom_animated_bottom_bar.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _currentIndex = 0;

  final _accentColor = AppColors.primary;
  final _inactiveColor = AppColors.grey;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(bottomNavigationBar: _buildBottomBar(), body: getBody()),
    );
  }

  Widget getBody() {
    List<Widget> pages = [
      const HomeScreen(),
      const TrackerScreen(),
      const ProfilePage(),
    ];
    return IndexedStack(
      index: _currentIndex,
      children: pages,
    );
  }

  Widget _buildBottomBar() => CustomAnimatedBottomBar(
        containerHeight: 70,
        selectedIndex: _currentIndex,
        showElevation: true,
        itemCornerRadius: 20,
        curve: Curves.easeIn,
        onItemSelected: (index) => setState(() => _currentIndex = index),
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: const Icon(Icons.home),
            title: const Text('Home'),
            activeColor: _accentColor,
            inactiveColor: _inactiveColor,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.compare_arrows),
            title: const Text('Tracker'),
            activeColor: _accentColor,
            inactiveColor: _inactiveColor,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.person),
            title: const Text('Profile'),
            activeColor: _accentColor,
            inactiveColor: _inactiveColor,
            textAlign: TextAlign.center,
          ),
        ],
      );
}
