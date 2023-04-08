import 'package:business_app/helper/helps.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../main.dart';

class ProfileBusinessAppHelp extends StatefulWidget {
  @override
  State<ProfileBusinessAppHelp> createState() => _ProfileBusinessAppHelpState();
}

class _ProfileBusinessAppHelpState extends State<ProfileBusinessAppHelp> {
  var nameController = TextEditingController();

  var numberController = TextEditingController();

  var emailComtroller = TextEditingController();

  var feedController = TextEditingController();

  Future<String> Rating() async {
    if (nameController == '') {
      displayMessage('Please Enter Your name');
    } else if (feedController == '') {
      displayMessage('Please Enter Your Feedback');
    } else {
      CollectionReference products =
          FirebaseFirestore.instance.collection('feedback');
      products.doc().set({
        'name': nameController.text,
        'number': numberController.text,
        'email': emailComtroller.text,
        'feed': feedController.text,
      }).whenComplete(() {
        Get.snackbar('Successfully', 'Data Added');
      });
      return "hell";
    }
  }

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_sharp,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Help",
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black),
        ),
        centerTitle: true,
        elevation: 1,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(20),
              height: MediaQuery.of(context).size.height / 1.70,
              width: MediaQuery.of(context).size.width * 0.90,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [BoxShadow(blurRadius: 3, color: Colors.grey)]),
              child: Column(
                children: [
                  Container(
                    height: 43,
                    width: MediaQuery.of(context).size.width * 0.90,
                    margin: EdgeInsets.all(10),
                    child: TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Your Name",
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Color(0xff7D7D7D),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 43,
                    // height: MediaQuery.of(context).size.height/9,
                    width: MediaQuery.of(context).size.width * 0.90,
                    margin: EdgeInsets.all(10),
                    child: TextField(
                      controller: numberController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Your contact number",
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Color(0xff7D7D7D),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 43,
                    // height: MediaQuery.of(context).size.height/9,
                    width: MediaQuery.of(context).size.width * 0.90,
                    margin: EdgeInsets.all(10),
                    child: TextField(
                      controller: emailComtroller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Your Email",
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Color(0xff7D7D7D),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.90,
                    margin: EdgeInsets.all(10),
                    child: TextField(
                      controller: feedController,
                      maxLines: 5,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Your feedback is important to us.",
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Color(0xff7D7D7D),
                        ),
                      ),
                    ),
                  ),
                  loading
                      ? Center(
                          child: CircularProgressIndicator(
                            color: colors,
                          ),
                        )
                      : Container(
                          margin: EdgeInsets.only(top: 10),
                          height: MediaQuery.of(context).size.height * 0.06,
                          width: MediaQuery.of(context).size.width * 0.50,
                          decoration: BoxDecoration(
                              color: Color(0xff2FB8A6),
                              borderRadius: BorderRadius.circular(25)),
                          child: InkWell(
                            onTap: () {
                              setState(
                                () {
                                  loading = true;
                                },
                              );

                              Rating();
                              setState(
                                () {
                                  loading = false;
                                },
                              );
                            },
                            child: Center(
                              child: Text(
                                'Rate',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Text(
                "We Are Available On",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: Icon(
                      Icons.width_wide_outlined,
                      color: Color(0xff2FB8A6),
                    ),
                  ),
                  Text(
                    "www.userapp.com",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: Icon(
                      Icons.mail_outline,
                      color: Color(0xff2FB8A6),
                    ),
                  ),
                  Text(
                    "Contact@sharebottle.com",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: Icon(
                      Icons.whatsapp,
                      color: Color(0xff2FB8A6),
                    ),
                  ),
                  Text(
                    "123456",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
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
