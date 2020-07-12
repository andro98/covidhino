import 'package:covidhino/src/view/screens/home_screen.dart';
import 'package:covidhino/src/view/screens/stats_screem.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final bottomNavigationText = TextStyle();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: basedOnIndex(),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xff503CAA),
        unselectedItemColor: Color(0xffE9E8EC),
        selectedFontSize: 15.0,
        unselectedFontSize: 15.0,
        onTap: onTabTapped,
        backgroundColor: Colors.white,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            title: Text(
              'Home',
              style: bottomNavigationText,
            ),
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/img/stats.png'),
            title: Text(
              'Statistics',
              style: bottomNavigationText,
            ),
          ),
        ],
      ),
    );
  }

  Widget basedOnIndex() {
    switch (_currentIndex) {
      case 0:
        return HomeScreen();
      default:
        return StatsScreen();
    }
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
