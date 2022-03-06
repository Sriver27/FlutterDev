import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dev_connect/models/post.dart';
import 'package:dev_connect/resources/storage_methods.dart';
import 'package:dev_connect/utils/globalvar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class FireStoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> uploadPost(
    String? description,
    XFile? file,
    String username,
    var uid,
    String? profImage,
    String collegeName,
  ) async {
    String res = "Some error occured";
    try {
      String photoUrl =
          await storageMethods().uploadImagetoStorage('posts', file!, true);
      String postId = const Uuid().v1(); //creates unique id based on time

      Post post = Post(
        description: description!,
        username: username,
        postId: postId,
        uid: uid,
        datePublished: DateTime.now(),
        photoUrl: photoUrl,
        collegeName: collegeName,
        respond: [],
        profImage: profImage!,
      );
      _firestore.collection('posts').doc(postId).set(post.toJson());
      res = "Success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<void> respondPost(String postId, String uid, List respond) async {
    try {
      if (respond.contains(uid)) {
        await _firestore.collection('posts').doc(postId).update({
          'respond': FieldValue.arrayRemove([uid])
        });
      } else {
        await _firestore.collection('posts').doc(postId).update({
          'respond': FieldValue.arrayUnion([uid])
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<String> postComment(String postId, String text, String uid,
      String name, String profilePic) async {
    String res = "Some error occurred";
    try {
      if (text.isNotEmpty) {
        String commId = const Uuid().v1();
        await _firestore
            .collection('posts')
            .doc(postId)
            .collection('comments')
            .doc(commId)
            .set({
          'profilePic': profilePic,
          'name': name,
          'uid': uid,
          'text': text,
          'commId': commId,
          'datePublished': DateTime.now(),
        });
        res = "Success";
      } else {
        print("Please enter text");
      }
    } catch (e) {
      res = (e.toString());
    }
    return res;
  }

  Future<void> deletePost(String postId) async {
    try {
      await _firestore.collection('posts').doc(postId).delete();
    } catch (err) {
      print(err.toString());
    }
  }

  Future<void> followUser(String uid, String followId) async {
    try {
      DocumentSnapshot snap =
          await _firestore.collection('users').doc(uid).get();
      List following = (snap.data()! as dynamic)['following'];

      if (following.contains(followId)) {
        await _firestore.collection('users').doc(followId).update({
          'followers': FieldValue.arrayRemove([uid])
        });

        await _firestore.collection('users').doc(uid).update({
          'following': FieldValue.arrayRemove([followId])
        });
      } else {
        await _firestore.collection('users').doc(followId).update({
          'followers': FieldValue.arrayUnion([uid])
        });

        await _firestore.collection('users').doc(uid).update({
          'following': FieldValue.arrayUnion([followId])
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
