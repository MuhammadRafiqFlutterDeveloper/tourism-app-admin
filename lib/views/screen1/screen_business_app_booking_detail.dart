import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../provider/widgets.dart';

class ScreenBusinessAppBookingDetail extends StatefulWidget {
  final snap;
  const ScreenBusinessAppBookingDetail({Key key, this.snap}) : super(key: key);

  @override
  State<ScreenBusinessAppBookingDetail> createState() =>
      _ScreenBusinessAppBookingDetailState();
}

class _ScreenBusinessAppBookingDetailState
    extends State<ScreenBusinessAppBookingDetail> {
  final jobWidget wid = jobWidget();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Booking Details",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 130,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images1/rectangle08.png",
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                    "Gym Exercise",
                    style: GoogleFonts.getFont(
                      "Rufina",
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 20),
                  child: Text(
                    "\$ 220",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 0),
                  child: Row(
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Text(
                            "Location name ",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                          )),
                      Text(
                        " 2 miles away ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.only(right: 20),
                  child: Text(
                    "per night",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      "Booked by:",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    )),
                Container(
                    margin: EdgeInsets.only(right: 20),
                    child: Text(
                      "Report",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    )),
              ],
            ),
            ListTile(
              title: Text(
                "${wid.name}",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              trailing: CircleAvatar(
                backgroundImage: NetworkImage("${wid.photoUrl}"),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Divider(
              endIndent: 20,
              indent: 20,
              thickness: 1,
              color: Color(0xffC9C9C9),
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              title: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                    "Booking From",
                    style: TextStyle(
                      color: Color(0xff6D6D6D),
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              subtitle: Container(
                margin: EdgeInsets.only(right: 20),
                child: AutoSizeText(
                  '${widget.snap.data()['date']}',
                  style: TextStyle(fontSize: 20),
                  maxLines: 2,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Divider(
              endIndent: 20,
              indent: 20,
              thickness: 1,
              color: Color(0xffC9C9C9),
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
              style: TextButton.styleFrom(
                  minimumSize: Size(264, 40),
                  backgroundColor: Color(0xff2FB8A6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  )),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(
                          "Cancel Booking",
                          style: TextStyle(
                              color: Color(0xff2FB8A6),
                              fontWeight: FontWeight.w600,
                              fontSize: 18),
                        ),
                        content: TextField(
                          maxLines: 5,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            labelText: "Reason",
                            labelStyle: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                            hintText:
                                "Give us a reason why you are cancel the booking...",
                            hintStyle: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xffA3A3A3),
                            ),
                          ),
                        ),
                        actions: [
                          TextButton(
                            style: TextButton.styleFrom(
                                minimumSize: Size(190, 35),
                                backgroundColor: Color(0xff2FB8A6),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                )),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Submit",
                                style: GoogleFonts.getFont(
                                  "Roboto",
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                )),
                          ),
                        ],
                      );
                    });
              },
              child: Text("Track",
                  style: GoogleFonts.getFont(
                    "Roboto",
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
              style: TextButton.styleFrom(
                side: BorderSide(color: Color(0xff2FB8A6)),
                minimumSize: Size(264, 40),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(
                        "Report Hotel",
                        style: TextStyle(
                            color: Color(0xff2FB8A6),
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      ),
                      content: TextField(
                        maxLines: 5,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          labelText: "Reason",
                          labelStyle: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                          hintText:
                              "Give us a reason why you are cancel the booking...",
                          hintStyle: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xffA3A3A3),
                          ),
                        ),
                      ),
                      actions: [
                        TextButton(
                          style: TextButton.styleFrom(
                              minimumSize: Size(190, 35),
                              backgroundColor: Color(0xff2FB8A6),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              )),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Submit",
                              style: GoogleFonts.getFont(
                                "Roboto",
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              )),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text("Cancel Booking",
                  style: GoogleFonts.getFont(
                    "Roboto",
                    color: Color(0xff2FB8A6),
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
