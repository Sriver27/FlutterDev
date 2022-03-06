import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dev_connect/utils/globalvar.dart';

class Post {
  final String description;
  var uid;
  final String username;
  final String collegeName;
  final String postId;
  final datePublished;
  final String profImage;

  final String? photoUrl;
  final respond;

  Post({
    required this.description,
    required this.uid,
    required this.username,
    required this.collegeName,
    required this.postId,
    required this.datePublished,
    this.photoUrl,
    required this.respond,
    required this.profImage,
  });

  //returns our requirement in form of object
  Map<String, dynamic> toJson() => {
        'description': description,
        'uid': uid,
        'username': username,
        'collegeName': collegeName,
        'postId': postId,
        'datePublished': datePublished,
        'photoUrl': photoUrl,
        'respond': respond,
        'profImage': profImage,
        /* 'selectedUserList': selectedUserList,*/
      };

  //taking document snapshot and returning a user model

  static Post fromSnap(DocumentSnapshot snap) {
    var snapshot = (snap.data() as Map<String, dynamic>);
    return Post(
      username: snapshot['username'] ?? "null",
      uid: snapshot['uid'] ?? "null",
      description: snapshot['description'] ?? "null",
      collegeName: snapshot['collegeName'] ?? "null",
      postId: snapshot['postId'] ?? "null",
      datePublished: snapshot['datePublished'] ?? "null",
      photoUrl: snapshot['photoUrl'] ?? "null",
      respond: snapshot['respond'] ?? "null",
      profImage: snapshot['profImage'] ?? "null",
    );
  }
}
