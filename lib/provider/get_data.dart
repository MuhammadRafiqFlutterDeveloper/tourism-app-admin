// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class SignInProvider extends ChangeNotifier {
//   // instance of firebaseauth, facebook and google
//   final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//   final GoogleSignIn googleSignIn = GoogleSignIn();
//
//   bool _isSignedIn = false;
//   bool get isSignedIn => _isSignedIn;
//
//   //hasError, errorCode, provider,uid, email, name, imageUrl
//   bool _hasError = false;
//   bool get hasError => _hasError;
//
//   String _errorCode;
//   String get errorCode => _errorCode;
//
//   String _provider;
//   String get provider => _provider;
//
//   String _uid;
//   String get uid => _uid;
//
//   String _username;
//   String get username => _username;
//
//   String _name;
//   String get name => _name;
//
//   String _email;
//   String get email => _email;
//
//   String _photoUrl;
//   String get photoUrl => _photoUrl;
//
//   String _imageUrl;
//   String get imageUrl => _imageUrl;
//
//
//   // sign in with google
//   Future signInWithGoogle() async {
//     final GoogleSignInAccount googleSignInAccount =
//     await googleSignIn.signIn();
//
//     if (googleSignInAccount != null) {
//       // executing our authentication
//       try {
//         final GoogleSignInAuthentication googleSignInAuthentication =
//         await googleSignInAccount.authentication;
//         final AuthCredential credential = GoogleAuthProvider.credential(
//           accessToken: googleSignInAuthentication.accessToken,
//           idToken: googleSignInAuthentication.idToken,
//         );
//
//         // signing to firebase user instance
//         final User userDetails =
//         (await firebaseAuth.signInWithCredential(credential)).user;
//
//         // now save all values
//         _name = userDetails.displayName;
//         _email = userDetails.email;
//         _imageUrl = userDetails.photoURL;
//         _provider = "GOOGLE";
//         _uid = userDetails.uid;
//         notifyListeners();
//       } on FirebaseAuthException catch (e) {
//         switch (e.code) {
//           case "account-exists-with-different-credential":
//             _errorCode =
//             "You already have an account with us. Use correct provider";
//             _hasError = true;
//             notifyListeners();
//             break;
//
//           case "null":
//             _errorCode = "Some unexpected error while trying to sign in";
//             _hasError = true;
//             notifyListeners();
//             break;
//           default:
//             _errorCode = e.toString();
//             _hasError = true;
//             notifyListeners();
//         }
//       }
//     } else {
//       _hasError = true;
//       notifyListeners();
//     }
//   }
//
//
//
//   // ENTRY FOR CLOUDFIRESTORE
//   Future getUserDataFromFirestore(uid) async {
//     await FirebaseFirestore.instance
//         .collection("users")
//         .doc(uid)
//         .get()
//         .then((DocumentSnapshot snapshot) => {
//       _uid = snapshot['uid'],
//       _username = snapshot['username'],
//       _email = snapshot['email'],
//       _photoUrl = snapshot['photoUrl'],
//       _provider = snapshot['provider'],
//     });
//   }
//
//
//   // signout
//   Future userSignOut() async {
//     await googleSignIn.signOut();
//
//
//     _isSignedIn = false;
//     notifyListeners();
//     // clear all storage information
//     clearStoredData();
//   }
//
//   Future clearStoredData() async {
//     final SharedPreferences s = await SharedPreferences.getInstance();
//     s.clear();
//   }
//
// }
