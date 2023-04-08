import 'package:business_app/views/screens/screen_business_app_forgot_password.dart';
import 'package:business_app/views/screens/screen_business_app_sign_up.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constant.dart';
import '../../helper/helps.dart';
import '../../resorces/auth_method.dart';
import '../../responsive/mobile_screen_layouts.dart';
import '../../responsive/responsive_layout_screen.dart';
import '../../responsive/web_screen_layouts.dart';
import '../../utills/utils.dart';

class ScreenBusinessAppLogIn extends StatefulWidget {
  @override
  State<ScreenBusinessAppLogIn> createState() => _ScreenBusinessAppLogInState();
}

class _ScreenBusinessAppLogInState extends State<ScreenBusinessAppLogIn> {
  final _formkey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool loading = false;
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().loginUser(
        email: emailController.text, password: passwordController.text);
    if (res == 'success') {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => ResponsiveLayout(
              mobileScreenLayout: MobileScreenLayout(),
              webScreenLayout: WebScreenLayout(),
            ),
          ),
              (route) => false);

      setState(() {
        _isLoading = false;
      });
    }
    else {
      setState(() {
        _isLoading = false;
      });
      showSnackBar(context, res);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 22,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left: 20, top: 20),
                    child: Text(
                      "Login",
                      style: genral,
                    ),),
                  Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      "assets/images/img.png",
                      height: 80,
                      width: 100,
                    ),
                  ),
                  Text(
                    "Welcome back!",
                    style: GoogleFonts.getFont(
                      "Rubik",
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                  ),
                  Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                            vertical: 20,
                          ),
                          width: MediaQuery.of(context).size.width / 1.30,
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
                        Container(
                          margin: EdgeInsets.symmetric(
                            vertical: 20,
                          ),
                          width: MediaQuery.of(context).size.width / 1.30,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            elevation: 6,
                            child: TextInputField(
                              controller: passwordController,
                              labelText: 'Password',
                              icon: Icons.lock_outline,
                              isObscure: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: TextButton(
                      onPressed: () {
                        openScreen(context, ScreenBusinessAppForgotPassword());
                      },
                      child: Text(
                        "Forgot Password?",
                        style: GoogleFonts.getFont(
                          "Roboto",
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colors,
                      minimumSize: Size(
                        MediaQuery.of(context).size.width * 0.75,
                        50,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    onPressed: loginUser,
                    child: !_isLoading
                        ? Text(
                      "Login",
                      style: button,
                    )
                        : Container(
                      width: MediaQuery.of(context).size.width * 0.65,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Colors.red,
                          strokeWidth: 3,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          RichText(
            text: TextSpan(
              text: "Don't have Account ",
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              children: [
                TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      openScreen(context, ScreenBusinessAppSignUp());
                    },
                  text: " SignUp",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: colors,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
