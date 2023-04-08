import 'package:business_app/views/screen1/screen_business_app_places.dart';
import 'package:business_app/views/screen1/screen_business_app_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '../../helper/helps.dart';
import '../porfile/profile_business_app_my_profile.dart';
class ScreenBusinessAppHome extends StatefulWidget {

  @override
  State<ScreenBusinessAppHome> createState() => _ScreenBusinessAppHomeState();
}

class _ScreenBusinessAppHomeState extends State<ScreenBusinessAppHome> {
  int _page = 0;
  final screens = [
    ScreenBusinessAppTabBar(),
    ScreenBusinessAppPlaces(),
    ProfileBusinessAppMyProfile(),
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: CurvedNavigationBar(
          color: colors,
          index: 0,
          height: 40.0,
          items: <Widget>[
            Icon(Icons.home, color: Colors.white, size: 30),
            Icon(Icons.commute, color: Colors.white, size: 30),
            Icon(Icons.account_circle_outlined, color: Colors.white, size: 30),
          ],
          buttonBackgroundColor: colors,
          backgroundColor: Colors.white,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
          letIndexChange: (index) => true,
        ),
        body: screens[_page]
    );
  }
}

