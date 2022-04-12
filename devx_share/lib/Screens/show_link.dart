import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:clipboard/clipboard.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ShowLinks extends StatefulWidget {
  const ShowLinks({Key? key, @required this.userID}) : super(key: key);

  final String? userID;

  @override
  _ShowLinksState createState() => _ShowLinksState();
}

class _ShowLinksState extends State<ShowLinks> {
  final _firebaseFirestore = FirebaseFirestore.instance.collection('Users');

  copytoClipBoard(String text) {
    print(text);
    if (text.isNotEmpty) {
      FlutterClipboard.copy(text).then((value) {});
      Fluttertoast.showToast(
          msg: "Link Copied",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    Fluttertoast.showToast(
        msg: "No Link is Added",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
        title: Text(
          'View Your Links',
          style: GoogleFonts.poppins(color: Colors.white),
        ),
        elevation: 0,
      ),
      body: FutureBuilder(
        future: _firebaseFirestore.doc(widget.userID).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text('Error Fetchig Data'),
            );
          }
          Map linkMap = snapshot.data!.get("linkMap");
          return ListView(
            children: [
              ListTile(
                minLeadingWidth: 30,
                contentPadding: const EdgeInsets.all(4.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                tileColor: const Color(0xff2D2D35),
                leading: const CircleAvatar(
                  radius: 23,
                  backgroundColor: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(2.0),
                    child: CircleAvatar(
                      radius: 20,
                      foregroundImage: AssetImage("Assets/Images/Linkedin.png"),
                    ),
                  ),
                ),
                title: Text(
                  linkMap['Linkedin'] == ""
                      ? "No Link added"
                      : linkMap['Linkedin'],
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    copytoClipBoard(linkMap['Linkedin']);
                  },
                  icon: const Icon(
                    Icons.copy,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              ListTile(
                minLeadingWidth: 30,
                contentPadding: const EdgeInsets.all(4.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                leading: const CircleAvatar(
                  radius: 23,
                  backgroundColor: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(2.0),
                    child: CircleAvatar(
                      radius: 20,
                      foregroundImage: AssetImage("Assets/Images/facebook.png"),
                    ),
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    copytoClipBoard(linkMap['Facebook']);
                  },
                  icon: const Icon(
                    Icons.copy,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  linkMap['Facebook'] == ""
                      ? "No Link added"
                      : linkMap['Facebook'],
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              ListTile(
                minLeadingWidth: 30,
                contentPadding: const EdgeInsets.all(4.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                leading: const CircleAvatar(
                  radius: 23,
                  backgroundColor: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(2.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 20,
                      foregroundImage: AssetImage("Assets/Images/github.png"),
                    ),
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    copytoClipBoard(linkMap['Github']);
                  },
                  icon: const Icon(
                    Icons.copy,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  linkMap['Github'] == "" ? "No Link added" : linkMap['Github'],
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              ListTile(
                minLeadingWidth: 30,
                contentPadding: const EdgeInsets.all(4.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                leading: const CircleAvatar(
                  radius: 23,
                  backgroundColor: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(2.0),
                    child: CircleAvatar(
                      radius: 20,
                      foregroundImage: AssetImage("Assets/Images/codechef.png"),
                    ),
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    copytoClipBoard(linkMap['Codechef']);
                  },
                  icon: const Icon(
                    Icons.copy,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  linkMap['Codechef'] == ""
                      ? "No Link added"
                      : linkMap['Codechef'],
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              ListTile(
                minLeadingWidth: 30,
                contentPadding: const EdgeInsets.all(4.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                leading: const CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(2.0),
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.white,
                      foregroundImage: AssetImage("Assets/Images/insta.png"),
                    ),
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    copytoClipBoard(linkMap['Instagram']);
                  },
                  icon: const Icon(
                    Icons.copy,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  linkMap['Instagram'] == ""
                      ? "No Link added"
                      : linkMap['Instagram'],
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              ListTile(
                minLeadingWidth: 30,
                contentPadding: const EdgeInsets.all(4.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                leading: const CircleAvatar(
                  radius: 23,
                  backgroundColor: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(2.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 20,
                      foregroundImage:
                          AssetImage("Assets/Images/codeforces.png"),
                    ),
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    copytoClipBoard(linkMap['Codeforces']);
                  },
                  icon: const Icon(
                    Icons.copy,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  linkMap['Codeforces'] == ""
                      ? "No Link added"
                      : linkMap['Codeforces'],
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              ListTile(
                minLeadingWidth: 30,
                contentPadding: const EdgeInsets.all(4.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                leading: const CircleAvatar(
                  radius: 23,
                  backgroundColor: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(2.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 20,
                      foregroundImage: AssetImage("Assets/Images/leetcode.png"),
                    ),
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    copytoClipBoard(linkMap['Leetcode']);
                  },
                  icon: const Icon(
                    Icons.copy,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  linkMap['Leetcode'] == ""
                      ? "No Link added"
                      : linkMap['Leetcode'],
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              ListTile(
                minLeadingWidth: 30,
                contentPadding: const EdgeInsets.all(4.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                leading: const CircleAvatar(
                  radius: 23,
                  backgroundColor: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(2.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 20,
                      foregroundImage:
                          AssetImage("Assets/Images/hackerrank.png"),
                    ),
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    copytoClipBoard(linkMap['Hackerrank']);
                  },
                  icon: const Icon(
                    Icons.copy,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  linkMap['Hackerrank'] == ""
                      ? "No Link added"
                      : linkMap['Hackerrank'],
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              ListTile(
                minLeadingWidth: 30,
                contentPadding: const EdgeInsets.all(4.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                leading: const CircleAvatar(
                  radius: 23,
                  backgroundColor: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(2.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 20,
                      foregroundImage: AssetImage("Assets/Images/twitter.png"),
                    ),
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    copytoClipBoard(linkMap['Twitter']);
                  },
                  icon: const Icon(
                    Icons.copy,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  linkMap['Twitter'] == ""
                      ? "No Link added"
                      : linkMap['Twitter'],
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              ListTile(
                minLeadingWidth: 30,
                contentPadding: const EdgeInsets.all(4.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                leading: const CircleAvatar(
                  radius: 23,
                  backgroundColor: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(2.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 20,
                      foregroundImage:
                          AssetImage("Assets/Images/hackerearth.png"),
                    ),
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    copytoClipBoard(linkMap['Hackerearth']);
                  },
                  icon: const Icon(
                    Icons.copy,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  linkMap['Hackerearth'] == ""
                      ? "No Link added"
                      : linkMap['Hackerearth'],
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              ListTile(
                minLeadingWidth: 30,
                contentPadding: const EdgeInsets.all(4.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                leading: const CircleAvatar(
                  radius: 23,
                  backgroundColor: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(2.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 20,
                      foregroundImage: AssetImage("Assets/Images/devfolio.png"),
                    ),
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    copytoClipBoard(linkMap['DevFolio']);
                  },
                  icon: const Icon(
                    Icons.copy,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  linkMap['DevFolio'] == ""
                      ? "No Link added"
                      : linkMap['DevFolio'],
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              ListTile(
                minLeadingWidth: 30,
                contentPadding: const EdgeInsets.all(4.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                leading: const CircleAvatar(
                  radius: 23,
                  backgroundColor: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(2.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 20,
                      foregroundImage: AssetImage("Assets/Images/gmail.png"),
                    ),
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    copytoClipBoard(linkMap['Gmail']);
                  },
                  icon: const Icon(
                    Icons.copy,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  linkMap['Gmail'] == "" ? "No Link added" : linkMap['Gmail'],
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              ListTile(
                minLeadingWidth: 30,
                contentPadding: const EdgeInsets.all(4.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                leading: const CircleAvatar(
                  radius: 23,
                  backgroundColor: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(2.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 20,
                      foregroundImage: AssetImage("Assets/Images/yt.png"),
                    ),
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    copytoClipBoard(linkMap['YouTube']);
                  },
                  icon: const Icon(
                    Icons.copy,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  linkMap['YouTube'] == ""
                      ? "No Link added"
                      : linkMap['YouTube'],
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              ListTile(
                minLeadingWidth: 30,
                contentPadding: const EdgeInsets.all(4.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                leading: const CircleAvatar(
                  radius: 23,
                  backgroundColor: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(2.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 20,
                      foregroundImage: AssetImage("Assets/Images/g+.png"),
                    ),
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    copytoClipBoard(linkMap['Google+']);
                  },
                  icon: const Icon(
                    Icons.copy,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  linkMap['Google+'] == ""
                      ? "No Link added"
                      : linkMap['Google+'],
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              ListTile(
                minLeadingWidth: 30,
                contentPadding: const EdgeInsets.all(4.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                leading: const CircleAvatar(
                  radius: 23,
                  backgroundColor: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(2.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 20,
                      foregroundImage: AssetImage("Assets/Images/GFG.png"),
                    ),
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    copytoClipBoard(linkMap['GFG']);
                  },
                  icon: const Icon(
                    Icons.copy,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  linkMap['GFG'] == "" ? "No Link added" : linkMap['GFG'],
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              ListTile(
                minLeadingWidth: 30,
                contentPadding: const EdgeInsets.all(4.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                leading: const CircleAvatar(
                  radius: 23,
                  backgroundColor: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(2.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 20,
                      foregroundImage: AssetImage("Assets/Images/atcoder.png"),
                    ),
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    copytoClipBoard(linkMap['AtCoder']);
                  },
                  icon: const Icon(
                    Icons.copy,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  linkMap['AtCoder'] == ""
                      ? "No Link added"
                      : linkMap['AtCoder'],
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              ListTile(
                minLeadingWidth: 30,
                contentPadding: const EdgeInsets.all(4.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                leading: const CircleAvatar(
                  radius: 23,
                  backgroundColor: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(2.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 20,
                      foregroundImage: AssetImage("Assets/Images/spoj.png"),
                    ),
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    copytoClipBoard(linkMap['Spoj']);
                  },
                  icon: const Icon(
                    Icons.copy,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  linkMap['Spoj'] == "" ? "No Link added" : linkMap['Spoj'],
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              ListTile(
                minLeadingWidth: 30,
                contentPadding: const EdgeInsets.all(4.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                leading: const CircleAvatar(
                  radius: 23,
                  backgroundColor: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(2.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 20,
                      foregroundImage:
                          AssetImage("Assets/Images/interviewbit.png"),
                    ),
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    copytoClipBoard(linkMap['InterviewBit']);
                  },
                  icon: const Icon(
                    Icons.copy,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  linkMap['InterviewBit'] == ""
                      ? "No Link added"
                      : linkMap['InterviewBit'],
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              ListTile(
                minLeadingWidth: 30,
                contentPadding: const EdgeInsets.all(4.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                leading: const CircleAvatar(
                  radius: 23,
                  backgroundColor: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(2.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 20,
                      foregroundImage: AssetImage("Assets/Images/topcoder.png"),
                    ),
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    copytoClipBoard(linkMap['TopCoder']);
                  },
                  icon: const Icon(
                    Icons.copy,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  linkMap['TopCoder'] == ""
                      ? "No Link added"
                      : linkMap['TopCoder'],
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
