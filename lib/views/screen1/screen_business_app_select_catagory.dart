import 'package:business_app/views/screen1/screen_business_new_places.dart';
import 'package:flutter/material.dart';
import '../../helper/helps.dart';
import '../screens/upcomming.dart';

class ScreenBusinessAppSelectCatagory extends StatefulWidget {
  @override
  State<ScreenBusinessAppSelectCatagory> createState() =>
      _ScreenBusinessAppSelectCatagoryState();
}

class _ScreenBusinessAppSelectCatagoryState
    extends State<ScreenBusinessAppSelectCatagory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Select Category",
          style: appbar,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.50),
                  blurRadius: 4,
                ),
              ],
            ),
            child: ListTile(
              leading: Image.asset(
                "assets/hd/1.jfif",
                width: 65,
                height: 60,
              ),
              title: Text(
                "Hotels & Restaurants",
                style: genr,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.black,
                size: 16,
              ),
              onTap: () {
                openScreen(context, ScreenBusinessNewPlaces());
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.50),
                  blurRadius: 4,
                ),
              ],
            ),
            child: ListTile(
              leading: Image.asset(
                "assets/hd/2.jfif",
                width: 65,
                height: 60,
              ),
              title: Text(
                "Gym & Exercise and upcoming",
                style: genr,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.black,
                size: 16,
              ),
              onTap: () {
                openScreen(context, ScreenBusinessUpcomming());
              },
            ),
          ),
        ],
      ),
    );
  }
}
