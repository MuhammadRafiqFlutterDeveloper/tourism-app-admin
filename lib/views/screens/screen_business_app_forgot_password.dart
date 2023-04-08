import 'package:flutter/material.dart';
import 'package:business_app/helper/helps.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../constant.dart';

class ScreenBusinessAppForgotPassword extends StatelessWidget {
final emailController = TextEditingController();
final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios_new, color: Colors.black, size: 18,)),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: Container(
        height: MediaQuery
            .of(context)
            .size
            .height,
        width: MediaQuery
            .of(context)
            .size
            .width,
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 20, top: 20),
              child: Text(
                "Forgot Password",
                style: genral,
              ),
            ),
            SizedBox(height: 20,),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 20),
              child: Text(
                "Enter your Email to recover your Account", style: gen,),),
            SizedBox(height: 100,),

            Container(
              margin: EdgeInsets.symmetric(vertical: 20,),
              width: MediaQuery
                  .of(context)
                  .size
                  .width / 1.30,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 6,
                child: TextInputField(
                  controller: emailController,
                  labelText: 'Email',
                  icon: Icons.email_outlined,
                ),
              ),
            ),
            SizedBox(height: 100,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: colors,
                minimumSize: Size(MediaQuery
                    .of(context)
                    .size
                    .width * 0.75, Get.height *
                    (SizerUtil.orientation ==
                        Orientation.landscape
                        ? 2
                        : 1) *
                    0.06,),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),

              onPressed: () {},
              child: Text(
                "Send",
                style: button,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
