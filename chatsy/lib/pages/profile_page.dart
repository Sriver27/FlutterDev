import 'package:chatsy/screens/login_screen.dart';
import 'package:chatsy/services/auth_methods.dart';
import 'package:chatsy/themes.dart';
import 'package:chatsy/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key, required this.uid}) : super(key: key);

  final String uid;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Card get logoutCard => Card(
        child: ListTile(
            title: Row(
              children: const [
                Icon(FontAwesomeIcons.rightFromBracket, color: Colors.red),
                SizedBox(width: 25),
                Text('Logout',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.red)),
              ],
            ),
            onTap: () async {
              await AuthMethods().signOut();
              await Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => loginScreen()));
            }),
      );

  Text get displayName => Text(
        userData['username'] ?? "Username",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
      );

  Text get userEmail => Text(
        userData['email'] ?? ".......@gmail.com",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
        ),
      );

  get profilePhoto => Center(
        child: CircleAvatar(
          backgroundImage: NetworkImage(userData['photoUrl'] ??
              "https://img.freepik.com/free-vector/active-tourist-hiking-mountain-man-wearing-backpack-enjoying-trekking-looking-snowcapped-peaks-vector-illustration-nature-wilderness-adventure-travel-concept_74855-9800.jpg?t=st=1647868953~exp=1647869553~hmac=48041ed0d544be64b485113cc5700c4208a5304b56e8ca85342d553449648cd8&w=996"),
          radius: 64,
        ),
      );
  var userData = {};
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    setState(() {
      isLoading = true;
    });
    try {
      var Usersnap = await FirebaseFirestore.instance
          .collection('users')
          .doc(widget.uid)
          .get();

      userData = Usersnap.data()!;
      setState(() {});
    } catch (e) {
      showSnackBar(e.toString(), context);
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final text = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
        ? 'Dark Theme'
        : 'Light Theme';
    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  physics: const BouncingScrollPhysics(),
                  children: [
                    const SizedBox(height: 50),
                    profilePhoto,
                    const SizedBox(height: 32),
                    displayName,
                    const SizedBox(height: 10),
                    userEmail,
                    const SizedBox(height: 40),
                    Card(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 12.0),
                                child: Text("Theme",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 12.0),
                                child: Text(text,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 40),
                        Switch.adaptive(
                            value:
                                Provider.of<ThemeProvider>(context).isDarkMode,
                            onChanged: (val) {
                              final provider = Provider.of<ThemeProvider>(
                                  context,
                                  listen: false);
                              provider.toggleTheme(val);
                            })
                      ],
                    )),
                    const SizedBox(height: 20),
                    logoutCard,
                  ],
                ),
              ),
            ),
          );
  }
}
