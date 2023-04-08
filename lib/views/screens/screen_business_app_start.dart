import 'package:business_app/views/screens/screen_business_app_grow.dart';
import 'package:business_app/views/screens/screen_business_app_log_in.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../helper/helps.dart';
class ScreenBusinessAppStart extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage(
              'assets/images/thumb.png',
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 60,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Image(
                    image: AssetImage(
                      "assets/images/img.png",
                    ),
                  ),
                  Text("Tourism",
                      style: GoogleFonts.getFont(
                        "Rufina",
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff2FB8A6),
                      ))
                ],
              ),
            ),
            Positioned(
              bottom: 40,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                        minimumSize: Size(264, 40),
                        backgroundColor: Color(0xff2FB8A6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        )),
                    onPressed: () {
                     openScreen(context, ScreenBusinessAppGrow());
                    },
                    child: Text(
                      "Get Started",
                      style: button,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Already have an account ",
                      style: GoogleFonts.getFont(
                        "Montserrat",
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                      children: [
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              openScreen(context, ScreenBusinessAppLogIn());
                            },
                          text: "Login",
                          style: GoogleFonts.getFont(
                            "Roboto",
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ],
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
