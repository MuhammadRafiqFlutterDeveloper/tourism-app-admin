import 'dart:typed_data';
import 'package:business_app/views/screen1/screen_business_app_home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:business_app/models/user.dart' as model;
import '../main.dart';
import '../views/screens/screen_business_app_log_in.dart';
import 'firebase_storage.dart';

class AuthMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // get user details
  Future<model.User> getUserDetails() async {
    User currentUser = _auth.currentUser;
    DocumentSnapshot documentSnapshot =
        await _firestore.collection('users').doc(currentUser.uid).get();
    return model.User.fromSnap(documentSnapshot);
  }

  // Signing Up User

  Future<String> signUpUser({
    String email,
    String password,
    String username,
    String confirmPassword,
    Uint8List file,
  }) async {
    String res = "Some error Occurred";
    try {
      if (file.isEmpty) {
        displayMessage('Please Pick the Profile image');
      } else if (username.isEmpty) {
        displayMessage('Please Enter Your name');
      } else if (password.isEmpty) {
        displayMessage('Please Enter the Password');
      } else if (confirmPassword.isEmpty) {
        displayMessage('Please enter the confirmPassword');
      } else if (password != confirmPassword) {
        displayMessage('Your password does not match');
      }
       else {
        // registering user in auth with email and password
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        String photoUrl = await StorageMethods()
            .uploadImageToStorage('profilePics', file, false);

        model.User _user = model.User(
          username: username,
          uid: cred.user.uid,
          photoUrl: photoUrl,
          email: email,
          confirmPassword: confirmPassword,
          followers: [],
          following: [],
        );

        // adding user in our database
        await _firestore
            .collection("admin")
            .doc(cred.user.uid)
            .set(_user.toJson());
        FirebaseAuth.instance.currentUser.sendEmailVerification().then((value) {
          displayMessage(
              "Verification email was sent Please check and verify it");
        }).whenComplete(() {
          Get.to(ScreenBusinessAppLogIn());
        });
        res = "success";
      }
    } catch (err) {
      return err.toString();
    }
    return res;
  }

  // logging in user
  Future<String> loginUser({
    String email,
    String password,
  }) async {
    String res = "Some error Occurred";
    try {
      if (email.isEmpty){
        displayMessage('Enter the correct Email');

      }
      else if(password.isEmpty){
        displayMessage('Enter the Correct password');
      }
      else {
        // logging in user with email and password
        await _auth
            .signInWithEmailAndPassword(
          email: email,
          password: password,
        )
            .then(
              (value) {
            displayMessage('Verify your Account with Email Links');
            if (value.user.emailVerified) {
              Get.to(ScreenBusinessAppHome());
            } else {
              Get.defaultDialog(
                title: "Email Not Verified",
                content: Text('Please check and verify your email'),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      value.user.sendEmailVerification();
                    },
                    child: Text(
                      'Resend Email',
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(
                      'Dismiss',
                    ),
                  ),
                ],
              );
            }
          },
        );
        print('Success');
      }
    } catch (err) {
      return err.toString();
    }
    return res;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }


}
