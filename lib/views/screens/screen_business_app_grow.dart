import 'package:business_app/views/screens/screen_business_app_log_in.dart';
import 'package:business_app/views/screens/screen_business_app_sign_up.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../helper/helps.dart';
class ScreenBusinessAppGrow extends StatefulWidget {

  @override
  _ScreenBusinessAppGrowState createState() => _ScreenBusinessAppGrowState();
}

class _ScreenBusinessAppGrowState extends State<ScreenBusinessAppGrow> {
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            CarouselSlider(
              items: [
                Image(image: AssetImage("assets/images/start.png")),
                Image(image: AssetImage("assets/images/begin.png",),
                ),
              ],
              options: CarouselOptions(
                height: 300,
                initialPage: 0,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  setState(
                        () {
                      _current = index;
                    },
                  );
                },
                scrollDirection: Axis.horizontal,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            AnimatedSmoothIndicator(
              activeIndex: _current,
              count: 2,
              effect: JumpingDotEffect(
                dotHeight: 15,
                dotWidth: 15,
                jumpScale: .7,
                verticalOffset: 20,
                activeDotColor: Colors.blue,
                dotColor: Colors.grey,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Text("Plan Your Trip", style: genral),
            ),
            Text('''Book one of our unique hotel to enjoy your 
                            vacations.''', style: gen),
            SizedBox(
              height: 80,
            ),
            TextButton(
              style: TextButton.styleFrom(
                minimumSize: Size(264, 40),
                backgroundColor: Color(0xff2FB8A6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              onPressed: () {
                openScreen(context, ScreenBusinessAppLogIn());
              },
              child: Text(
                "Login",
                style: button,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.50),
                    blurRadius: 6,
                  ),
                ],
              ),
              child: TextButton(
                style: TextButton.styleFrom(
                  minimumSize: Size(264, 40),
                  backgroundColor: Color(0xffffffff),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                onPressed: () {
                  openScreen(context, ScreenBusinessAppSignUp());
                },
                child: Text(
                  "Create Account",
                  style: buttons,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
