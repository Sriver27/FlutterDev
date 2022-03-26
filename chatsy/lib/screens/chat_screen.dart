// import 'package:chatsy/themes.dart';
// import 'package:chatsy/widgets/glowing_action_button.dart';
// import 'package:chatsy/widgets/icon_buttons.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// import '../models/models.dart';
// import '../widgets/widgets.dart';

// class ChatScreen extends StatelessWidget {
//   static Route route(MessageData data) => MaterialPageRoute(
//       builder: ((context) => ChatScreen(
//             messageData: data,
//           )));
//   const ChatScreen({Key? key, required this.messageData}) : super(key: key);

//   final MessageData messageData;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           iconTheme: Theme.of(context).iconTheme,
//           centerTitle: false,
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//           leadingWidth: 54,
//           leading: Align(
//             alignment: Alignment.centerRight,
//             child: IconBackground(
//               icon: CupertinoIcons.back,
//               onTap: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ),
//           title: _AppBarTitle(
//             messageData: messageData,
//           ),
//           actions: [
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 8.0),
//               child: Center(
//                 child: IconBorder(
//                   icon: CupertinoIcons.video_camera_solid,
//                   onTap: () {},
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(right: 20),
//               child: Center(
//                 child: IconBorder(
//                   icon: CupertinoIcons.phone_solid,
//                   onTap: () {},
//                 ),
//               ),
//             ),
//           ],
//         ),
//         body: Column(
//           children: [
//             Expanded(child: _DemoMessageList()),
//             _ActionBar(),
//           ],
//         ));
//   }
// }

// class _DemoMessageList extends StatelessWidget {
//   const _DemoMessageList({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 8.0),
//       child: ListView(children: [
//         _Datelabel(label: "Yesterday"),
//         _MessageTile(
//             message: "Hi Harsh,How's your day going", messageDate: '12:01 PM'),
//         _MessageOwnTile(message: "Fine", messageDate: '12:02 PM'),
//         _MessageTile(
//             message: "How about going to Starbucks??", messageDate: '12:04 PM'),
//         _MessageOwnTile(
//             message: "Cool....Lets!head out", messageDate: '12:05 PM'),
//         _MessageTile(
//             message: "Take some extra cash as i am running short of it",
//             messageDate: '12:08 PM'),
//         _MessageOwnTile(message: "Np", messageDate: '12:12 PM'),
//       ]),
//     );
//   }
// }

// class _MessageTile extends StatelessWidget {
//   const _MessageTile(
//       {Key? key, required this.message, required this.messageDate})
//       : super(key: key);

//   final String message;
//   final String messageDate;
//   static const _borderRadius = 26.0;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
//       child: Align(
//         alignment: Alignment.centerLeft,
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                   color: Theme.of(context).cardColor,
//                   borderRadius: const BorderRadius.only(
//                       topLeft: Radius.circular(_borderRadius),
//                       topRight: Radius.circular(_borderRadius),
//                       bottomRight: Radius.circular(_borderRadius))),
//               child: Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20),
//                 child: Text(message,
//                     style: TextStyle(fontWeight: FontWeight.bold)),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 8.0),
//               child: Text(messageDate,
//                   style: TextStyle(
//                       color: AppColors.textFaded,
//                       fontSize: 10,
//                       fontWeight: FontWeight.bold)),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _MessageOwnTile extends StatelessWidget {
//   const _MessageOwnTile(
//       {Key? key, required this.message, required this.messageDate})
//       : super(key: key);

//   final String message;
//   final String messageDate;
//   static const _borderRadius = 26.0;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
//       child: Align(
//         alignment: Alignment.centerRight,
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                   color: AppColors.secondary,
//                   borderRadius: const BorderRadius.only(
//                       topLeft: Radius.circular(_borderRadius),
//                       bottomLeft: Radius.circular(_borderRadius),
//                       bottomRight: Radius.circular(_borderRadius))),
//               child: Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20),
//                 child: Text(message,
//                     style: TextStyle(fontWeight: FontWeight.bold)),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 8.0),
//               child: Text(messageDate,
//                   style: TextStyle(
//                       color: AppColors.textFaded,
//                       fontSize: 10,
//                       fontWeight: FontWeight.bold)),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _Datelabel extends StatelessWidget {
//   const _Datelabel({Key? key, required this.label}) : super(key: key);
//   final String label;

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 32.0),
//         child: Container(
//             decoration: BoxDecoration(
//               color: Theme.of(context).cardColor,
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: Padding(
//               padding:
//                   const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4),
//               child: Text(label,
//                   style: TextStyle(
//                       fontSize: 12,
//                       color: AppColors.textFaded,
//                       fontWeight: FontWeight.bold)),
//             )),
//       ),
//     );
//   }
// }

// class _AppBarTitle extends StatelessWidget {
//   const _AppBarTitle({Key? key, required this.messageData}) : super(key: key);
//   final MessageData messageData;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Avatar.small(url: messageData.profilePic),
//         const SizedBox(width: 16),
//         Expanded(
//             child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               messageData.senderName,
//               overflow: TextOverflow.ellipsis,
//               style: TextStyle(fontSize: 14),
//             ),
//             const SizedBox(height: 2),
//             const Text('Online',
//                 style: TextStyle(
//                     fontSize: 10,
//                     color: Colors.green,
//                     fontWeight: FontWeight.bold))
//           ],
//         ))
//       ],
//     );
//   }
// }

// class _ActionBar extends StatelessWidget {
//   const _ActionBar({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       bottom: true,
//       top: false,
//       child: Padding(
//         padding: const EdgeInsets.only(bottom: 9.0),
//         child: Row(
//           children: [
//             Container(
//                 decoration: BoxDecoration(
//                     border: Border(
//                         right: BorderSide(
//                             width: 2, color: Theme.of(context).dividerColor))),
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                   child: Icon(CupertinoIcons.camera_fill),
//                 )),
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 16.0),
//                 child: TextField(
//                     style: TextStyle(fontSize: 14),
//                     decoration: InputDecoration(
//                         hintText: "Type Something", border: InputBorder.none)),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 12.0, right: 24),
//               child: GlowingActionButton(
//                   color: AppColors.accent,
//                   icon: Icons.send_rounded,
//                   onPressed: () {}),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:io';

import 'package:chatsy/themes.dart';
import 'package:chatsy/user_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class ChatRoom extends StatelessWidget {
  final Map<String, dynamic> userMap;
  final String chatRoomId;

  ChatRoom({required this.chatRoomId, required this.userMap});

  final TextEditingController _message = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  File? imageFile;

  Future getImage() async {
    ImagePicker _picker = ImagePicker();

    await _picker.pickImage(source: ImageSource.gallery).then((xFile) {
      if (xFile != null) {
        imageFile = File(xFile.path);
        uploadImage();
      }
    });
  }

  Future uploadImage() async {
    String fileName = Uuid().v1();
    int status = 1;

    await _firestore
        .collection('chatroom')
        .doc(chatRoomId)
        .collection('chats')
        .doc(fileName)
        .set({
      "sendby": _auth.currentUser!.displayName,
      "message": "",
      "type": "img",
      "time": FieldValue.serverTimestamp(),
    });

    var ref =
        FirebaseStorage.instance.ref().child('images').child("$fileName.jpg");

    var uploadTask = await ref.putFile(imageFile!).catchError((error) async {
      await _firestore
          .collection('chatroom')
          .doc(chatRoomId)
          .collection('chats')
          .doc(fileName)
          .delete();

      status = 0;
    });

    if (status == 1) {
      String imageUrl = await uploadTask.ref.getDownloadURL();

      await _firestore
          .collection('chatroom')
          .doc(chatRoomId)
          .collection('chats')
          .doc(fileName)
          .update({"message": imageUrl});

      print(imageUrl);
    }
  }

  void onSendMessage() async {
    if (_message.text.isNotEmpty) {
      Map<String, dynamic> messages = {
        "sendby": _auth.currentUser!.displayName,
        "message": _message.text,
        "type": "text",
        "time": FieldValue.serverTimestamp(),
      };

      _message.clear();
      await _firestore
          .collection('chatroom')
          .doc(chatRoomId)
          .collection('chats')
          .add(messages);
    } else {
      print("Enter Some Text");
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final userProvider uSerProvider = Provider.of<userProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder<DocumentSnapshot>(
          stream:
              _firestore.collection("users").doc(userMap['uid']).snapshots(),
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              return Container(
                child: Column(
                  children: [
                    Text(
                      userMap['username'],
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      snapshot.data!['status'],
                      style: TextStyle(
                          fontSize: 12,
                          color: snapshot.data!['status'] == 'Online'
                              ? Colors.greenAccent
                              : Colors.redAccent),
                    ),
                  ],
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          children: [
            Container(
              height: size.height / 1.25,
              width: size.width,
              child: StreamBuilder<QuerySnapshot>(
                stream: _firestore
                    .collection('chatroom')
                    .doc(chatRoomId)
                    .collection('chats')
                    .orderBy("time", descending: false)
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.data != null) {
                    return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        Map<String, dynamic> map = snapshot.data!.docs[index]
                            .data() as Map<String, dynamic>;
                        return messages(size, map, context);
                      },
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),
            Container(
              height: size.height / 10,
              width: size.width,
              alignment: Alignment.center,
              child: Container(
                height: size.height / 12,
                width: size.width / 1.1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: size.height / 17,
                      width: size.width / 1.3,
                      child: TextField(
                        controller: _message,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () => getImage(),
                              icon: Icon(Icons.photo),
                            ),
                            hintText: "Type Something...",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            )),
                      ),
                    ),
                    IconButton(
                        icon: Icon(Icons.arrow_forward_ios,
                            color: AppColors.secondary),
                        onPressed: onSendMessage),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget messages(Size size, Map<String, dynamic> map, BuildContext context) {
    return map['type'] == "text"
        ? Container(
            width: size.width,
            alignment: map['sendby'] == _auth.currentUser!.displayName
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: map['sendBy'] == _auth.currentUser!.displayName
                    ? Colors.lightBlueAccent
                    : Colors.transparent,
              ),
              child: Text(
                map['message'],
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          )
        : Container(
            height: size.height / 2.5,
            width: size.width,
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            alignment: map['sendby'] == _auth.currentUser!.displayName
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: InkWell(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => ShowImage(
                    imageUrl: map['message'],
                  ),
                ),
              ),
              child: Container(
                height: size.height / 2.5,
                width: size.width / 2,
                decoration: BoxDecoration(border: Border.all()),
                alignment: map['message'] != "" ? null : Alignment.center,
                child: map['message'] != ""
                    ? Image.network(
                        map['message'],
                        fit: BoxFit.cover,
                      )
                    : CircularProgressIndicator(),
              ),
            ),
          );
  }
}

class ShowImage extends StatelessWidget {
  final String imageUrl;

  const ShowImage({required this.imageUrl, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        child: Image.network(imageUrl),
      ),
    );
  }
}
