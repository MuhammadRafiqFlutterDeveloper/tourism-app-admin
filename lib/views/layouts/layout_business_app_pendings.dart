import 'package:auto_size_text/auto_size_text.dart';
import 'package:business_app/main.dart';
import 'package:business_app/views/screen1/screen_business_app_booking_detail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../helper/helps.dart';
import '../../provider/widgets.dart';

class LayoutsBusinessAppPending extends StatefulWidget {
  @override
  State<LayoutsBusinessAppPending> createState() =>
      _LayoutsBusinessAppPendingState();
}

class _LayoutsBusinessAppPendingState extends State<LayoutsBusinessAppPending> {
  final jobWidget wid = jobWidget();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('book').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: Text(
                "No Data Found",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data.docs.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 12,
                  color: Colors.white,
                  margin: EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          // backgroundImage: NetworkImage('${wid.photoUrl}'),
                        ),
                        title: Column(
                          children: [
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Text('${wid.name}'),),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Booking From:  ",
                                style: appbar,
                              ),
                            ),
                          ],
                        ),
                        trailing: Text(
                          DateFormat.yMMMd().format(
                            snapshot.data.docs[index]['dateNow'].toDate(),
                          ),
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            color: Colors.black.withOpacity(0.50),
                          ),
                        ),
                        onTap: (){
                          Get.to(ScreenBusinessAppBookingDetail(
                            snap: snapshot.data.docs[index]
                          ));
                        },
                        subtitle: SizedBox(
                          // height: 100,
                          width: MediaQuery.of(context).size.width,
                          child: AutoSizeText(
                            '${snapshot.data.docs[index]['date']}',
                            style: TextStyle(fontSize: 20),
                            maxLines: 2,
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),

                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
