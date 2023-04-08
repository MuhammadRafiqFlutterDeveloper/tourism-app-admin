import 'package:business_app/views/porfile/profile_business_app_my_rating.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../helper/helps.dart';
import '../screens/screen_business_app_log_in.dart';
class ProfileBusinessAppSetting extends StatefulWidget {

  @override
  State<ProfileBusinessAppSetting> createState() => _ProfileBusinessAppSettingState();
}

class _ProfileBusinessAppSettingState extends State<ProfileBusinessAppSetting> {
  bool notification = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Settings",
          style: appbar,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
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
          SizedBox(height: 10,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: SwitchListTile(
              secondary: Icon(Icons.notifications,color: Color(0xff2FB8A6)),
              value: notification,
              title: Text(
                "Notification",
                style:genr,
              ),
              onChanged: (value) {
                setState(() =>
                  notification = value,
                );
              },
              tileColor: Colors.white,
              activeColor: Colors.green,
              controlAffinity: ListTileControlAffinity.trailing,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
              leading: Image.asset("assets/picture/img_1.png"),
              title: Text("Give Rating",style: genr,),
              onTap: (){
                Get.to(ScreenBusinessRating());
              },
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),

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
              leading: Icon(Icons.logout, color: Color(0xff2FB8A6),),
              title: Text("Logout",style: genr,),
              onTap: (){
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Logout?"),
                      content: Text("Are you sure to logout?"),
                      actions: [
                        OutlinedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Dismiss")),
                        OutlinedButton(
                            onPressed: () async {
                              // await AuthMethod().signOut().then((value){
                              //   openScreenAndCloseOthers(context, ScreenBusinessAppLogIn());
                              // });
                            },
                            child: Text("Logout")),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

