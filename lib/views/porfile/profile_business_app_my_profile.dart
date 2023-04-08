import 'package:badges/badges.dart';
import 'package:business_app/helper/helps.dart';
import 'package:business_app/views/porfile/profile_business_app_help.dart';
import 'package:business_app/views/porfile/profile_business_app_my_account.dart';
import 'package:business_app/views/porfile/profile_business_app_my_rating.dart';
import 'package:business_app/views/porfile/profile_business_app_setting.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class ProfileBusinessAppMyProfile extends StatefulWidget {
  @override
  State<ProfileBusinessAppMyProfile> createState() =>
      _ProfileBusinessAppMyProfileState();
}

class _ProfileBusinessAppMyProfileState
    extends State<ProfileBusinessAppMyProfile> {
  int cartItems = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('admin')
              .where('uid', isEqualTo: FirebaseAuth.instance.currentUser.uid)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            return Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 3,
                            child: CustomPaint(
                              painter: RPSCustomPainter(),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 40,
                            child: Expanded(
                              child: ListView.builder(
                                itemCount: snapshot.data.docs.length,
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context, int index) {
                                  return CircleAvatar(
                                    backgroundColor: Colors.blue,
                                    radius: 60,
                                    backgroundImage: NetworkImage(
                                      '${snapshot.data.docs[index]['photoUrl']}',
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          Positioned(
                            top: 50,
                            right: 30,
                            child: Badge(
                              position: BadgePosition.topEnd(top: 0, end: 3),
                              animationDuration: Duration(milliseconds: 300),
                              animationType: BadgeAnimationType.scale,
                              badgeContent: Text("$cartItems"),
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    cartItems = 0;
                                  });
                                },
                                icon: Icon(
                                  Icons.notification_add_outlined,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.60),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                        child: ListTile(
                          leading: Image.asset(
                            "assets/picture/img.png",
                            height: 20,
                            width: 20,
                          ),
                          title: Text(
                            "My Account",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Colors.black,
                            size: 18,
                          ),
                          onTap: () {
                            openScreen(context, ProfileBusinessAppMyAccount());
                          },
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.40),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                        child: ListTile(
                          leading: Icon(
                            Icons.settings,
                            color: Color(0xff2FB8A6),
                          ),
                          title: Text(
                            "Settings",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Colors.black,
                            size: 18,
                          ),
                          onTap: () {
                            openScreen(context, ProfileBusinessAppSetting());
                          },
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.60),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                        child: ListTile(
                          leading: Icon(
                            Icons.eighteen_up_rating,
                            color: colors,
                          ),
                          title: Text(
                            "My Rating",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Colors.black,
                            size: 18,
                          ),
                          onTap: () {
                            openScreen(context, ScreenBusinessRating());
                          },
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.40),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                        child: ListTile(
                          leading: Icon(
                            Icons.help_outline,
                            color: Color(0xff2FB8A6),
                          ),
                          title: Text(
                            "Help",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Colors.black,
                            size: 18,
                          ),
                          onTap: () {
                            openScreen(context, ProfileBusinessAppHelp());
                          },
                        ),
                      ),
                    ],
                  ),
                ));
          }),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;
    paint0.shader = ui.Gradient.linear(
        Offset(size.width * -0.01, size.height * 0.53),
        Offset(size.width, size.height * 0.53),
        [Color(0xff43EFD8), Color(0xff2FB8A6)],
        [0.00, 1.00]);
    Path path0 = Path();
    path0.moveTo(0, 0);
    path0.lineTo(size.width, 0);
    path0.quadraticBezierTo(size.width, size.height * 0.6413580,
        size.width * 0.9983333, size.height * 0.8592593);
    path0.cubicTo(
        size.width * 0.8504167,
        size.height * 1.0555556,
        size.width * 0.6329167,
        size.height * 1.0382716,
        size.width * 0.5016667,
        size.height * 0.8765432);
    path0.cubicTo(
        size.width * 0.3395833,
        size.height * 0.7074074,
        size.width * 0.1004167,
        size.height * 0.7197531,
        0,
        size.height * 0.9950617);
    path0.quadraticBezierTo(
        size.width * -0.0083333, size.height * 0.8216049, 0, 0);
    path0.close();
    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
