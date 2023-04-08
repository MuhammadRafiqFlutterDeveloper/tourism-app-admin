import 'package:business_app/helper/helps.dart';
import 'package:flutter/material.dart';

class LayoutsBusinessAppActives extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        leading: Image.asset("assets/images1/img.png", height: 80, width: 90,),
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
        trailing: Text("03 Dec, 2021", style: gen,),
      ),
    );
  }
}
