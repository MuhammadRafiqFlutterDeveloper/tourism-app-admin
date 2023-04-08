import 'package:flutter/material.dart';
import '../../helper/helps.dart';
import '../screen1/screen_business_app_booking_detail.dart';

class LayoutsBusinessAppFinished extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: ListTile(
            onTap: (){
              openScreen(context, ScreenBusinessAppBookingDetail());
            },
            leading: Image.asset("assets/hd/7.jfif", height: 80, width: 90,),
            title: Text("Person Name", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),),
            subtitle: Column(
              children: [
                RichText(text: TextSpan(
                    text: "Booking from: ", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black),
                    children: [
                      TextSpan(
                        text: " 19 Aug, 2021", style: gen,
                      )
                    ]
                ),),
                RichText(text: TextSpan(
                    text: "Booking to: ", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black),
                    children: [
                      TextSpan(
                        text: " 24 Aug, 2021", style: gen,
                      )
                    ]
                ),),
              ],
            ),
            trailing: Column(
              children: [
                Text("03 Dec, 2021", style: gen,),
                Text("Completed", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: Color(0xff00A410),),),

              ],
            ),
          ),
        ),
        Container(
          child: ListTile(
            onTap: (){
              openScreen(context, ScreenBusinessAppBookingDetail());
            },
            leading: Image.asset("assets/hd/10.jfif", height: 80, width: 90,),
            title: Text("Person Name",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),),
            subtitle: Column(
              children: [
                RichText(text: TextSpan(
                    text: "Booking from: ", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black),
                    children: [
                      TextSpan(
                        text: " 19 Aug, 2021", style: gen,
                      )
                    ]
                ),),
                RichText(text: TextSpan(
                    text: "Booking to: ",style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black),
                    children: [
                      TextSpan(
                        text: " 24 Aug, 2021", style: gen,
                      )
                    ]
                ),),
              ],
            ),
            trailing: Column(
              children: [
                Text("03 Dec, 2021", style: gen,),
                Text("Cancelled", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: Color(0xffEF0000),),),

              ],
            ),
          ),
        ),
      ],
    );
  }
}
