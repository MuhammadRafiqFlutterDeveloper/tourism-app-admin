import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String email;
  final String uid;
  final String photoUrl;
  final String username;
  final String confirmPassword;
  final List followers;
  final List following;
  final String password;
  const User(
      { this.username,
        this.password,
        this.confirmPassword,
         this.uid,
         this.photoUrl,
         this.email,
         this.followers,
         this.following,
      });

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
      username: snapshot["username"],
      password: snapshot['password'],
      confirmPassword: snapshot['confirmPassword'],
      uid: snapshot["uid"],
      email: snapshot["email"],
      photoUrl: snapshot["photoUrl"],
      followers: snapshot["followers"],
      following: snapshot["following"],
    );
  }

  Map<String, dynamic> toJson() => {
    "username": username,
    "uid": uid,
    "email": email,
    'confirmPassword': confirmPassword,
    'password': password,
    "photoUrl": photoUrl,
    "followers": followers,
    "following": following,
  };
}
