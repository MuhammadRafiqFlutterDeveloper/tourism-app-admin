import 'package:business_app/helper/helps.dart';
import 'package:flutter/material.dart';
import '../layouts/layout_business_app_pendings.dart';
import '../layouts/layouts_business_app_actives.dart';
import '../layouts/layouts_business_app_finished.dart';

class ScreenBusinessAppTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Icon(
                Icons.search,
                color: colors,
                size: 28,
              ),
            ),
          ],
          backgroundColor: Colors.white,
          elevation: 1,
          automaticallyImplyLeading: false,
          title: Text(
            "Bookings",
            style: appbar,
          ),
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            TabBar(
              indicator: BoxDecoration(
                color: Color(0xff2FB8A6),
                borderRadius: BorderRadius.circular(25),
              ),
              automaticIndicatorColorAdjustment: true,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              tabs: [
                Tab(
                  text: "Pending",
                ),
                Tab(
                  text: "Completed",
                ),
                Tab(text: "Canceled")
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  LayoutsBusinessAppPending(),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: 6,
                      itemBuilder: (BuildContext context, int index) {
                        return LayoutsBusinessAppActives();
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: 2,
                      itemBuilder: (BuildContext context, int index) {
                        return LayoutsBusinessAppFinished();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
