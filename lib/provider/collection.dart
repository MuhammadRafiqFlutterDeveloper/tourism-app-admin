import 'package:business_app/provider/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Collection extends StatelessWidget {
  const Collection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: FirebaseFirestore.instance
                .collection('users')
                .where('uid', isEqualTo: FirebaseAuth.instance.currentUser.uid)
                // .orderBy('createdAt', descending: false)
                .snapshots(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.data.docs.isNotEmpty == true) {
                  return ListView.builder(
                      padding: const EdgeInsets.all(10.0),
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (BuildContext contex, int index) {
                        print(Icons.list);
                        // print(snapshot.data?.docs[index]['userImg']);
                        return jobWidget(
                          // createdOn    : snapshot.data?.docs[index]['createdOn'],
                          name: snapshot.data.docs[index]['username'],
                          // productNameTemp: snapshot.data.docs[index]
                          //     ['productNameTemp'],
                          photoUrl: snapshot.data.docs[index]['photoUrl'],
                          // quantity     : snapshot.data?.docs[index]['quantity'],
                          // summary: snapshot.data.docs[index]['summary'],
                          // videoLink: snapshot.data.docs[index]['videoLink'],
                          // imagesMap    : snapshot.data?.docs[index]['imagesMap'],
                          // productkey: snapshot.data.docs[index]['key'],
                        );
                      });
                } else {
                  return const Center(
                    child: Text('No products'),
                  );
                }
              }
              return const Center(
                child: Text(
                  'Something went wrong',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              );
            }));
  }
}
