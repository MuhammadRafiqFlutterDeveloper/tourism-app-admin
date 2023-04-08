import 'package:flutter/cupertino.dart';

class jobWidget extends StatefulWidget {

  // final String createdOn;
  final String name;
  final String photoUrl;
  // final String productNameTemp;
  // final String providedBy;
  // final bool quantity;
  // final String summary;
  // final String videoLink;
  // final String imagesMap;

  const jobWidget({
    // required this.createdOn,
     this.name,
     this.photoUrl,
     // this.providedBy,
    // required this.quantity,
    //  this.summary,
    //  this.videoLink,
    // required this.imagesMap,
    //  this.productkey
  });

  @override
  State<jobWidget> createState() => _jobWidgetState();
}

class _jobWidgetState extends State<jobWidget> {
  @override
  Widget build(BuildContext context) {
  }
}