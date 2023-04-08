import 'dart:typed_data';

import 'package:business_app/views/screens/screen_business_app_log_in.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sign_button/constants.dart';
import 'package:sign_button/create_button.dart';
import '../../constant.dart';
import '../../helps/helper.dart';
import '../../resorces/auth_method.dart';
import '../../responsive/mobile_screen_layouts.dart';
import '../../responsive/responsive_layout_screen.dart';
import '../../responsive/web_screen_layouts.dart';
import '../../utills/utils.dart';

class ScreenBusinessAppSignUp extends StatefulWidget {
  static const String id = 'LoginScreen';
  @override
  _ScreenBusinessAppSignUpState createState() =>
      _ScreenBusinessAppSignUpState();
}

class _ScreenBusinessAppSignUpState extends State<ScreenBusinessAppSignUp> {

  final _formkey = GlobalKey<FormState>();
  bool _loading = false;
  bool loading = false;
  final emailController = TextEditingController();
  final fullNameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  Uint8List _image;
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    fullNameController.dispose();
    confirmPasswordController.dispose();
  }

  void signUpUser() async {
    // set loading to true
    setState(
          () {
        _loading = true;
      },
    );
    // signup user using our authmethodds
    String res = await AuthMethods().signUpUser(
      email: emailController.text,
      password: passwordController.text,
      username: fullNameController.text,
      confirmPassword: confirmPasswordController.text,
      file: _image,
    );
    // if string returned is sucess, user has been created
    if (res == "success") {
      setState(() {
        _loading = false;
      });
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => ResponsiveLayout(
            mobileScreenLayout: MobileScreenLayout(),
            webScreenLayout: WebScreenLayout(),
          ),
        ),
      );
    } else {
      setState(() {
        _loading = false;
      });
      // show the error
      showSnackBar(context, res);
    }
  }

  selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    // set state because we need to display the image we selected on the circle avatar
    setState(() {
      _image = im;
    });
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
            size: 28,
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
                    margin: EdgeInsets.only(left: 20, top: 10),
                    child: Text(
                      "Signup",
                      style: genral,
                    ),),

                  Stack(
                    children: [
                      _image != null
                          ? CircleAvatar(
                        radius: 64,
                        backgroundImage: MemoryImage(_image),
                        backgroundColor: Colors.grey,
                      )
                          : CircleAvatar(
                        radius: 64,
                        backgroundImage: AssetImage(
                            'assets/images/img.png'),
                        backgroundColor: Colors.grey,
                      ),
                      Positioned(
                        bottom: -10,
                        left: 80,
                        child: IconButton(
                          onPressed: selectImage,
                          icon: const Icon(Icons.add_a_photo),
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "Welcome back!",
                      style: GoogleFonts.getFont(
                        "Roboto",
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 1.30,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            elevation: 6,
                            child: TextInputField(
                              controller: fullNameController,
                              labelText: 'Full Name',
                              icon: Icons.person_outline,
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
                              controller: emailController,
                              labelText: 'Email',
                              icon: Icons.email_outlined,
                            ),
                          ),
                        ),
                        Container(
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
                              controller: confirmPasswordController,
                              labelText: 'Confirm Password',
                              icon: Icons.lock_outline,
                              isObscure: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colors,
                      minimumSize: Size(
                        MediaQuery
                            .of(context)
                            .size
                            .width * 0.75,
                        50,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    onPressed: signUpUser,
                    child: !_loading ? Text(
                      "SignUp",
                      style: button,
                    ): Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.68,
                      child: Center(

                        child: CircularProgressIndicator(color: Colors.red, strokeWidth: 3, ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "___or___",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: colors,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      loading
                          ? CircularProgressIndicator(
                        color: colors,
                      )
                          : SignInButton(
                          btnText: "Google",
                          width: MediaQuery.of(context).size.width * 0.35,
                          buttonType: ButtonType.google,
                          buttonSize: ButtonSize.small,
                          onPressed: () async {
                            setState(() {
                              loading = true;
                            });
                            //   bool result = await _authMethods
                            //       .signInWithGoogle();
                            //   if (result) {
                            //     Navigator.of(context).pushNamed(
                            //         ScreenBusinessAppHome.id);
                            //
                            //     setState(() {
                            //       _loading = false;
                            //     });
                            //   };
                          }
                      ),
                      SignInButton(
                        btnText: "FaceBook",
                        width: MediaQuery.of(context).size.width * 0.35,
                        buttonSize: ButtonSize.small,
                        buttonType: ButtonType.facebook,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          RichText(
            text: TextSpan(
                text: "Already have an account? ",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        openScreen(context, ScreenBusinessAppLogIn());
                      },
                    text: "Login",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: colors,
                    ),
                  ),
                ]),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
