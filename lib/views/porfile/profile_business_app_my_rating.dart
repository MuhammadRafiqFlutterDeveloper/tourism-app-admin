import 'package:business_app/helper/helps.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class ScreenBusinessRating extends StatefulWidget {
  final id;
  final images;
  const ScreenBusinessRating({Key key, this.id, this.images}) : super(key: key);
  @override
  State<ScreenBusinessRating> createState() => _ScreenBusinessRatingState();
}

class _ScreenBusinessRatingState extends State<ScreenBusinessRating> {
  double places = 0;
  double service = 0;
  double price = 0;
  double Quality = 0;
  final rateController = TextEditingController();
  Future<String> Rating() async {
    CollectionReference products =
        FirebaseFirestore.instance.collection('adminRating');
    products.add({
      'places': places,
      'service': service,
      'price': price,
      'quality': Quality,
      'rate': rateController.text.trim(),
    }).whenComplete(() {
      Get.snackbar('Successfully', 'Data Added');
    });
    return "hell";
  }

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading ? Center( child:  CircularProgressIndicator(color: colors,),) : Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: Text(
          "Add New Places",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        elevation: 0,
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('Post').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,

                    child: ListView.builder(
                      itemCount: snapshot.data.docs.length,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        final data = snapshot.data.docs[index];
                        return Image(
                          image: NetworkImage('${data['images']}'),
                        );
                      },
                    ),
                  ),
                  // Image(
                  //   image: AssetImage(
                  //     'assets/images/detail.png',
                  //   ),
                  // ),
                  Container(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          'places',
                          style: TextStyle(color: colors),
                        ),
                      )),
                  Card(
                    elevation: 4,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.80,
                      child: Row(
                        children: [
                          RatingBar.builder(
                            itemSize: 20,
                            initialRating: 3,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            updateOnDrag: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) => setState(() {
                              places = rating;
                            }),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            '${places}/5',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),

                  Container(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          'Service',
                          style: TextStyle(color: colors),
                        ),
                      )),
                  Card(
                    elevation: 4,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.80,
                      child: Row(
                        children: [
                          RatingBar.builder(
                            initialRating: 0,
                            itemSize: 20,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            updateOnDrag: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) => setState(() {
                              service = rating;
                            }),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            '${service}/5',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          'Price',
                          style: TextStyle(color: colors),
                        ),
                      )),
                  Card(
                    elevation: 4,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.80,
                      child: Row(
                        children: [
                          RatingBar.builder(
                            initialRating: 0,
                            itemSize: 20,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            updateOnDrag: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) => setState(() {
                              price = rating;
                            }),
                          ),
                          Text(
                            '${price}/5',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          'Quality',
                          style: TextStyle(color: colors),
                        ),
                      )),
                  Card(
                    elevation: 4,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.80,
                      child: Row(
                        children: [
                          RatingBar.builder(
                            itemSize: 20,
                            initialRating: 0,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            updateOnDrag: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) => setState(() {
                              Quality = rating;
                            }),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            '${Quality}/5',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Card(
                      elevation: 4,
                      child: TextField(
                        controller: rateController,
                        maxLines: 4,
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                          hintText: 'Rate this app',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  loading
                      ? Center(
                          child: CircularProgressIndicator(
                            color: Colors.black,
                          ),
                        )
                      : Card(
                          elevation: 5,
                          margin: EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.65,
                            height: MediaQuery.of(context).size.height * 0.065,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  loading = true;
                                });

                                Rating(

                                  // Id.toString(),
                                );
                                setState(() {
                                  loading = false;
                                });
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
                        ),
                ],
              ),
            );
          }),
    );
  }
}
// final FirebaseFirestore _firestore = FirebaseFirestore.instance;
// // Post comment
// Future<String> postComment(String postId, String text, String uid,
//     String name, String profilePic) async {
//   String res = "Some error occurred";
//   try {
//     if (text.isNotEmpty) {
//       // if the likes list contains the user uid, we need to remove it
//       String commentId =  Uuid().v1();
//       _firestore
//           .collection('Post')
//           .doc(postId)
//           .collection('rating')
//           .doc(commentId)
//           .set({
//         'place': places,
//         'service': service,
//         'uid': uid,
//         'price': price,
//         'commentId': commentId,
//         'quality':Quality,
//         'rate': rateController.text.trim(),
//         'datePublished': DateTime.now(),
//       });
//       displayMessage('Rating Success');
//     } else {
//       res = "Please enter text";
//     }
//   } catch (err) {
//     res = err.toString();
//   }
//   return res;
// }
// CollectionReference products = FirebaseFirestore.instance
//     .collection('Post')
//     .doc()
//     .collection('rating');
//
// void addData() async {
//   await products.add({
//     'places': places,
//     'service': service,
//     'price': price,
//     'quality': Quality,
//     'rate': rateController.text.trim(),
//   }).whenComplete(() {
//     Get.snackbar('Successfully', 'Data Added');
//   });
// }
