// import 'package:chatsy/themes.dart';
// import 'package:faker/faker.dart';
// import 'package:flutter/material.dart';
// import 'package:jiffy/jiffy.dart';

// import '../models/models.dart';
// import '../screens/chat_screen.dart';
// import '../widgets/helpers.dart';
// import '../widgets/widgets.dart';

// class MessagesPage extends StatefulWidget {
//   const MessagesPage({Key? key}) : super(key: key);

//   @override
//   State<MessagesPage> createState() => _MessagesPageState();
// }

// class _MessagesPageState extends State<MessagesPage> {
//   @override
//   Widget build(BuildContext context) {
//     return CustomScrollView(
//       slivers: [
//         // SliverToBoxAdapter(child: _Stories()),
//         SliverList(delegate: SliverChildBuilderDelegate(_delegate)),
//       ],
//     );
//   }

//   Widget _delegate(BuildContext context, int index) {
//     final Faker faker = Faker();
//     final date = Helpers.randomDateTime();
//     return MessageTitle(
//       messageData: MessageData(
//           senderName: faker.person.name(),
//           message: faker.lorem.sentence(),
//           messageDate: date,
//           dateMessage: Jiffy(date).fromNow(),
//           profilePic: Helpers.randomPictureUrl()),
//     );
//   }
// }

// class MessageTitle extends StatelessWidget {
//   const MessageTitle({Key? key, required this.messageData}) : super(key: key);

//   final MessageData messageData;

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       child: InkWell(
//         onTap: () {
//           Navigator.of(context).push(ChatScreen.route(messageData));
//         },
//         child: Container(
//           height: 100,
//           margin: EdgeInsets.symmetric(horizontal: 8),
//           decoration: const BoxDecoration(
//               border: Border(
//                   bottom: BorderSide(
//             color: Colors.grey,
//             width: 0.2,
//           ))),
//           child: Padding(
//             padding: const EdgeInsets.all(4.0),
//             child: Row(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: Avatar.medium(
//                     url: messageData.profilePic,
//                   ),
//                 ),
//                 Expanded(
//                     child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 8.0),
//                       child: Text(messageData.senderName,
//                           style: const TextStyle(
//                               overflow: TextOverflow.ellipsis,
//                               letterSpacing: 0.2,
//                               wordSpacing: 1.5,
//                               fontWeight: FontWeight.w900)),
//                     ),
//                     SizedBox(
//                         height: 20,
//                         child: Text(
//                           messageData.message,
//                           overflow: TextOverflow.ellipsis,
//                           style: TextStyle(
//                               fontSize: 12, color: AppColors.textFaded),
//                         )),
//                   ],
//                 )),
//                 Padding(
//                   padding: const EdgeInsets.only(right: 20.0),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                       const SizedBox(height: 4),
//                       Text(
//                         messageData.dateMessage.toUpperCase(),
//                         style: TextStyle(
//                             fontSize: 11,
//                             letterSpacing: -0.2,
//                             fontWeight: FontWeight.w600,
//                             color: AppColors.textFaded),
//                       ),
//                       SizedBox(height: 8),
//                       Container(
//                           height: 18,
//                           width: 18,
//                           decoration: const BoxDecoration(
//                               color: AppColors.secondary,
//                               shape: BoxShape.circle),
//                           child: Center(
//                               child: Text('1',
//                                   style: TextStyle(
//                                       color: AppColors.textLigth,
//                                       fontSize: 10))))
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _Stories extends StatelessWidget {
//   const _Stories({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 0,
//       child: SizedBox(
//         height: 134,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(top: 8.0, left: 16, bottom: 16),
//               child: Text(
//                 "Stories",
//                 style: TextStyle(
//                   fontWeight: FontWeight.w900,
//                   color: AppColors.textFaded,
//                   fontSize: 15,
//                 ),
//               ),
//             ),
//             Expanded(
//               child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemBuilder: (BuildContext context, int index) {
//                     final faker = Faker();
//                     return Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: SizedBox(
//                         width: 60,
//                         child: _StoryCard(
//                           storyData: StoryData(
//                             name: faker.person.firstName(),
//                             url: Helpers.randomPictureUrl(),
//                           ),
//                         ),
//                       ),
//                     );
//                   }),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _StoryCard extends StatelessWidget {
//   const _StoryCard({
//     Key? key,
//     required this.storyData,
//   }) : super(key: key);

//   final StoryData storyData;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Avatar.medium(url: storyData.url),
//         Expanded(
//           child: Padding(
//             padding: const EdgeInsets.only(top: 16.0),
//             child: Text(
//               storyData.name,
//               overflow: TextOverflow.ellipsis,
//               style: const TextStyle(
//                 fontSize: 11,
//                 letterSpacing: 0.3,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:chatsy/services/auth_methods.dart';
import 'package:chatsy/screens/chat_screen.dart';
import 'package:chatsy/group_chats/group_chat_screen.dart';
import 'package:chatsy/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({Key? key, required this.uid}) : super(key: key);

  final String uid;
  @override
  _MessagesPageState createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage>
    with WidgetsBindingObserver {
  Map<String, dynamic>? userMap;
  Stream<QuerySnapshot>? chats;
  bool isLoading = false;
  final TextEditingController _search = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
    setStatus("Online");
    // getAvailableChats();
    // getData();
  }

  void setStatus(String status) async {
    await _firestore.collection('users').doc(_auth.currentUser!.uid).update({
      "status": status,
    });
  }

  // Widget chatMessages(){
  //   return StreamBuilder(
  //     stream: chats,
  //     builder: (context, snapshot){
  //       return snapshot.hasData ?  ListView.builder(
  //         itemCount: snapshot.data!.doc.length,
  //           itemBuilder: (context, index){
  //             return MessageTile(
  //               message: snapshot.data.documents[index].data["message"],
  //               sendByMe: Constants.myName == snapshot.data.documents[index].data["sendBy"],
  //             );
  //           }) : Container();
  //     },
  //   );
  // }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // online
      setStatus("Online");
    } else {
      // offline
      setStatus("Offline");
    }
  }

  String chatRoomId(String user1, String user2) {
    if (user1[0].toLowerCase().codeUnits[0] >
        user2.toLowerCase().codeUnits[0]) {
      return "$user1$user2";
    } else {
      return "$user2$user1";
    }
  }

  void onSearch() async {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;

    try {
      setState(() {
        isLoading = true;
      });

      await _firestore
          .collection('users')
          .where("username", isEqualTo: _search.text)
          .get()
          .then((value) {
        setState(() {
          userMap = value.docs[0].data();
          isLoading = false;
        });
        print(userMap);
      });
    } catch (e) {
      showSnackBar("User not found", context);
      setState(() {
        isLoading = false;
      });
    }
  }

  List chatList = [];

  // void getAvailableChats() async {
  //   String uid = _auth.currentUser!.uid;
  //   String roomId = chatRoomId(
  //       _auth.currentUser!.displayName!,
  //       // userData['username'],
  //       userMap!['username']);

  //   await _firestore
  //       .collection('chatroom')
  //       .where(roomId, arrayContains: _auth.currentUser!.displayName!)
  //       .get()
  //       .then((value) {
  //     setState(() {
  //       chatList = value.docs;
  //       isLoading = false;
  //     });
  //   });
  // }

  // var userData = {};

  // getData() async {
  //   setState(() {
  //     isLoading = true;
  //   });
  //   try {
  //     var Usersnap = await FirebaseFirestore.instance
  //         .collection('users')
  //         .doc(widget.uid)
  //         .get();

  //     userData = Usersnap.data()!;
  //     setState(() {});
  //   } catch (e) {
  //     showSnackBar(e.toString(), context);
  //   }
  //   setState(() {
  //     isLoading = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final brightness = Theme.of(context).brightness;

    return Scaffold(
      body: isLoading
          ? Center(
              child: Container(
                height: size.height / 20,
                width: size.height / 20,
                child: CircularProgressIndicator(),
              ),
            )
          : Column(
              children: [
                SizedBox(
                  height: size.height / 20,
                ),
                Container(
                  height: size.height / 14,
                  width: size.width,
                  alignment: Alignment.center,
                  child: Container(
                    height: size.height / 14,
                    width: size.width / 1.15,
                    child: TextField(
                      controller: _search,
                      decoration: InputDecoration(
                        hintText: "Search",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height / 50,
                ),
                ElevatedButton(
                  onPressed: onSearch,
                  child: Text("Search"),
                ),
                SizedBox(
                  height: size.height / 30,
                ),
                userMap == null
                    ? Container(height: 100, width: 100, child: Text(" "))
                    : ListTile(
                        onTap: () {
                          String roomId = chatRoomId(
                              _auth.currentUser!.displayName!,
                              // userData['username'],
                              userMap!['username']);

                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => ChatRoom(
                                chatRoomId: roomId,
                                userMap: userMap!,
                              ),
                            ),
                          );
                        },

                        // leading: Icon(Icons.account_box, color: Colors.black),
                        leading: Image.network(userMap!['photoUrl']),

                        title: Text(
                          userMap!['username'],
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        subtitle: Text(userMap!['email'],
                            style: TextStyle(
                              fontSize: 13,
                              color: (brightness == Brightness.light)
                                  ? Colors.black
                                  : Colors.white,
                            )),
                        trailing: Icon(
                          Icons.chat,
                        ),
                      ),
                // ListView.builder(
                //   itemCount: chatList.length,
                //   itemBuilder: (context, index) {
                //     return ListTile(
                //       onTap: () => Navigator.of(context).push(
                //         MaterialPageRoute(
                //           builder: (_) => ChatRoom(
                //             chatRoomId: chatList[index]['roomId'],
                //             userMap: userMap!,
                //           ),
                //         ),
                //       ),
                //       leading: Icon(Icons.group),
                //       title: Text(userMap!['username']),
                //     );
                //   },
                // ),
              ],
            ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.group),
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => GroupChatHomeScreen(),
          ),
        ),
      ),
    );
  }
}
