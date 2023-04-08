import 'package:flutter/material.dart';
import '../views/porfile/profile_business_app_my_profile.dart';
import '../views/screen1/screen_business_app_places.dart';
import '../views/screen1/screen_business_app_tab_bar.dart';

const webScreenSize = 600;

List<Widget> homeScreenItems = [
  ScreenBusinessAppTabBar(),
  ScreenBusinessAppPlaces(),
  ProfileBusinessAppMyProfile(),
];
