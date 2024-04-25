// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';
import 'explore_page.dart';
import 'history_page.dart';
import 'profile_page.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _currIdx = 0;
  late String _title;
  final _pages = const <Widget>[
    HomePage(),
    ExplorePage(),
    HistoryPage(),
    ProfilePage()
  ];

  @override
  void initState() {
    super.initState();
    _title = "OrderIn";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text(
          _title,
          style: const TextStyle(fontSize: 30, fontFamily: 'SFBold'),
        ),
        shadowColor: _currIdx != 0 ? Colors.black : Colors.transparent,
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: _pages[_currIdx],
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(
                  opacity: CurvedAnimation(
                    parent: animation,
                    curve: Curves.easeInOut,
                  ),
                  child: child,
                );
              },
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: CurvedNavigationBar(
              height: 60,
              backgroundColor: Colors.transparent,
              buttonBackgroundColor: Colors.orange,
              color: Colors.black,
              items: const <Widget>[
                Icon(
                  Icons.home,
                  size: 30,
                  color: Colors.white,
                ),
                Icon(
                  Icons.explore,
                  size: 30,
                  color: Colors.white,
                ),
                Icon(
                  Icons.history,
                  size: 30,
                  color: Colors.white,
                ),
                Icon(
                  Icons.person,
                  size: 30,
                  color: Colors.white,
                ),
              ],
              onTap: (index) {
                setState(() {
                  _currIdx = index;
                  if (index == 0) _title = "OrderIn";
                  else if (index == 1) _title = "Explore";
                  else if (index == 2) _title = "History";
                  else if (index == 3) _title = "Profile";
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
