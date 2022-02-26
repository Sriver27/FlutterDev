import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String username;
  final String uid;
  final String email;
  final String collegeName;
  final List followers;
  final List following;
  final String photoUrl;

  const User(
      {required this.username,
      required this.uid,
      required this.email,
      required this.collegeName,
      required this.followers,
      required this.following,
      required this.photoUrl});

  //returns our requirement in form of object
  Map<String, dynamic> toJson() => {
        'username': username,
        'uid': uid,
        'email': email,
        'collegeName': collegeName,
        'followers': followers,
        'following': following,
        'photoUrl': photoUrl,
      };

  //taking document snapshot and returning a user model

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = (snap.data() as Map<String, dynamic>);
    return User(
      username: snapshot['username'] ?? "null",
      uid: snapshot['uid'] ?? "null",
      email: snapshot['email'] ?? "null",
      collegeName: snapshot['collegeName'] ?? "null",
      following: snapshot['following'] ?? "null",
      followers: snapshot['followers'] ?? "null",
      photoUrl: snapshot['photoUrl'] ?? "null",
    );
  }
}
