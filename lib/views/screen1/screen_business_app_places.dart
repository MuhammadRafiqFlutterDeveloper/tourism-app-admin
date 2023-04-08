import 'package:business_app/views/screen1/screen_business_app_select_catagory.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import '../../helper/helps.dart';
import '../../utills/globle_variable.dart';

class ScreenBusinessAppPlaces extends StatefulWidget {
  final String uid;
  const ScreenBusinessAppPlaces({Key key, this.uid}) : super(key: key);
  @override
  State<ScreenBusinessAppPlaces> createState() => _ScreenBusinessAppPlacesState();
}

class _ScreenBusinessAppPlacesState extends State<ScreenBusinessAppPlaces> {
  final TextEditingController searchController = TextEditingController();
  bool searchState = false;
  List searchResult = [];
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        title: searchState
            ? Text(
          'Hotels & Restaurants',
          style: appbar,
        )
            : Form(
          child: TextFormField(
            controller: searchController,
            decoration: InputDecoration(
              labelText: 'Search places...',
              prefixIcon: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search_outlined,
                  color: colors,
                ),
              ),
            ),
            onChanged: (text) {
              initSearchingPost(text);
            },
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        actions: [
          searchState
              ? IconButton(
            onPressed: () {
              setState(() {
                searchState = !searchState;
              });
            },
            icon: Icon(
              Icons.search_outlined,
              color: colors,
            ),
          )
              : IconButton(
            onPressed: () {
              setState(() {
                searchState = !searchState;
              });
            },
            icon: Icon(
              Icons.cancel_outlined,
              color: colors,
            ),
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('Post').snapshots(),
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
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: colors,
              ),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data.docs.length,
              itemBuilder: (ctx, index) => Container(
                margin: EdgeInsets.symmetric(
                  horizontal: width > webScreenSize ? width * 0.3 : 0,
                  vertical: width > webScreenSize ? 15 : 0,
                ),
                child: Column(
                  children: [
                    Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                          image: NetworkImage(
                            snapshot.data.docs[index]['images'].toString(),
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            snapshot.data.docs[index]['name'].toString(),
                            style: genr,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 20),
                      child: Text(
                        snapshot.data.docs[index]['price'].toString(),
                        style: gen,
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: RatingBar.builder(
                        maxRating: 1,
                        itemSize: 15,
                        itemBuilder: (context, _) =>
                            Icon(Icons.star, color: Colors.amber),
                        onRatingUpdate: (_rating) {
                          setState(
                                () {
                              _rating = _rating;
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: colors,
        child: Icon(Icons.add_circle_outline,color: Colors.white,),
        onPressed: () {
        Get.to(ScreenBusinessAppSelectCatagory());
      },),
    );
  }

  double _rating = 0;
  void initSearchingPost(String text) async {
    final result = await FirebaseFirestore.instance
        .collection('Post')
        .where('name', isGreaterThanOrEqualTo: searchResult).where('recruitment', isEqualTo: true)
        .get();
    setState(() {
      searchResult = result.docs.map((e) => e.data()).toList();
    });
  }
}
