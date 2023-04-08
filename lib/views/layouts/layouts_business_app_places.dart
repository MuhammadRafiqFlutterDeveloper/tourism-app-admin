import 'package:business_app/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../helper/helps.dart';
import '../../resorces/firestore_method.dart';

class LayoutsBusinessAppPlaces extends StatefulWidget {
  final snap;
  const LayoutsBusinessAppPlaces({Key key, this.snap}) : super(key: key);
  @override
  State<LayoutsBusinessAppPlaces> createState() =>
      _LayoutsBusinessAppPlacesState();
}

class _LayoutsBusinessAppPlacesState extends State<LayoutsBusinessAppPlaces> {
  int commentLen = 0;
  bool isLikeAnimating = false;

  @override
  void initState() {
    super.initState();
    fetchCommentLen();
  }

  fetchCommentLen() async {
    try {
      QuerySnapshot snap = await FirebaseFirestore.instance
          .collection('Students')
          .doc(widget.snap['postId'])
          .collection('comments')
          .get();
      commentLen = snap.docs.length;
    } catch (err) {
      displayMessage(
        err.toString(),
      );
    }
    setState(() {});
  }

  deletePost(String postId) async {
    try {
      await FireStoreMethods().deletePost(postId);
    } catch (err) {
      displayMessage(
        err.toString(),
      );
    }
  }

  double _rating = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 180,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage("assets/images/Rectangle8.png"),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            left: 20,
          ),
          alignment: Alignment.centerLeft,
          child: Text(
            "Grand Royle Hotel",
            style: genr,
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Location Me",
                style: gen,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    Text(
                      "\$ 220",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff2FB8A6)),
                    ),
                    Text(
                      "per night",
                      style: gen,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(left: 20),
          child: RatingBar.builder(
            maxRating: 1,
            itemSize: 15,
            itemBuilder: (context, _) => Icon(Icons.star, color: Colors.amber),
            onRatingUpdate: (_rating) {
              setState(() {
                this._rating = _rating;
              });
            },
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
