import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import '../models/user.dart';
import '../resorces/auth_method.dart';

class UserProvider with ChangeNotifier {
  User _user;
  final AuthMethods _authMethods = AuthMethods();
  User get getUser => _user;

  Future<void> refreshUser() async {
    User user = await _authMethods.getUserDetails();
    _user = user;
    notifyListeners();
  }


  //hasError, errorCode, provider,uid, email, name, imageUrl


  String _usern;
  String get user => _usern;


  String _photoUrl;
  String get photoUrl => _photoUrl;


  // ENTRY FOR CLOUDFIRESTORE
  Future getUserDataFromFirestore() async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc()
        .get()
        .then((DocumentSnapshot snapshot) => {
      _usern = snapshot['username'],
      _photoUrl = snapshot['photoUrl'],
    });
  }
}