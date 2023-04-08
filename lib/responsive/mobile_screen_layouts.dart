import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../helper/helps.dart';
import '../utills/globle_variable.dart';

class MobileScreenLayout extends StatefulWidget {
  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  int _page = 0;
  PageController pageController; // for tabs animation

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(
      () {
        _page = page;
      },
    );
  }

  void navigationTapped(int page) {
    //Animating Page
    pageController.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: homeScreenItems,
        controller: pageController,
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: secondaryColor,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: (_page == 0) ? colors : mobileBackgroundColor,
            ),
            label: 'Home',
            backgroundColor: colors,
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.commute_outlined,
                color: (_page == 1) ? colors : mobileBackgroundColor,
              ),
              label: 'Travel',
              backgroundColor: colors),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle_outlined,
              color: (_page == 2) ? colors : mobileBackgroundColor,
            ),
            label: 'Account',
            backgroundColor: colors,
          ),
        ],
        onTap: navigationTapped,
        currentIndex: _page,
      ),
    );
  }
}
