import 'package:flutter/material.dart';
import '../Screens/calculation.dart';
import '../Screens/home_screen.dart';
import '../Screens/profile_screen.dart';
import 'AppColors.dart';




class BottomNavController extends StatefulWidget {
  const BottomNavController({Key? key}) : super(key: key);

  @override
  _BottomNavControllerState createState() => _BottomNavControllerState();
}

class _BottomNavControllerState extends State<BottomNavController> {
  final _pages = [
     const HomePage(),
    const ProflePage(),
  ];
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: BottomNavigationBar(
        elevation: 5,
        selectedItemColor: AppColors.deep_orange,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        selectedLabelStyle:
            TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: ("Home"),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.filter_list), label: ("Profile")),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            print(_currentIndex);
          });
        },
      ),
      body: _pages[_currentIndex],
    );
  }
}