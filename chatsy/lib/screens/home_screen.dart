import 'package:chatsy/pages/message_page.dart';
import 'package:chatsy/pages/profile_page.dart';
import 'package:chatsy/screens/login_screen.dart';
import 'package:chatsy/screens/sign_up_screen.dart';
import 'package:chatsy/services/auth_methods.dart';
import 'package:chatsy/themes.dart';
import 'package:chatsy/widgets/glowing_action_button.dart';
import 'package:chatsy/widgets/helpers.dart';
import 'package:chatsy/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ValueNotifier<int> pageIndex = ValueNotifier(0);
  final ValueNotifier<String> title = ValueNotifier("Messages");
  final pages = [
    MessagesPage(
      uid: FirebaseAuth.instance.currentUser!.uid,
    ),
    ProfilePage(
      uid: FirebaseAuth.instance.currentUser!.uid,
    ),
    // CallsPage(),
    // ContactsPage(),
  ];
  final pageTitle = const [
    "Messages",
    "Profile",
  ];

  void _onNavigationItemSelected(index) {
    title.value = pageTitle[index];
    pageIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: ValueListenableBuilder(
          valueListenable: title,
          builder: (BuildContext context, String value, _) {
            leadingWidth:
            54;
            leading:
            pageIndex == 0 ? CupertinoIcons.search : null;
            return Text(
              value,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 21,
              ),
            );
          },
        ),
        // leadingWidth: 54,
        // leading: Align(
        //   alignment: Alignment.centerRight,
        //   child: IconBackground(
        //     icon: Icons.search,
        //     onTap: () {
        //       print("TODO search");
        //     },
        //   ),
        // ),
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.only(right: 24.0),
        //     // child: Avatar.small(url: Helpers.randomPictureUrl()),
        //     child: InkWell(
        //         child: Icon(Icons.logout),
        //         onTap: () async {
        //           await AuthMethods().signOut();
        //           Navigator.of(context).pushReplacement(MaterialPageRoute(
        //             builder: (context) => SignupScreen(),
        //           ));
        //         }),
        //   )
        // ],
      ),
      body: ValueListenableBuilder(
          valueListenable: pageIndex,
          builder: (BuildContext context, int value, _) {
            return pages[value];
          }),
      bottomNavigationBar: _BottomNavBar(
        onItemSelected: _onNavigationItemSelected,
      ),
    );
  }
}

class _BottomNavBar extends StatefulWidget {
  const _BottomNavBar({Key? key, required this.onItemSelected})
      : super(key: key);

  final ValueChanged<int> onItemSelected;

  @override
  State<_BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<_BottomNavBar> {
  var selectedIndex = 0;

  void handleItemSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
    widget.onItemSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return Card(
      color: (brightness == Brightness.light) ? Colors.transparent : null,
      elevation: 0,
      margin: EdgeInsets.all(0),
      child: SafeArea(
          bottom: true,
          top: false,
          child: Padding(
            padding:
                const EdgeInsets.only(top: 16.0, left: 8, right: 8, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _NavBarItem(
                  icon: FontAwesomeIcons.facebookMessenger,
                  label: "Messages",
                  index: 0,
                  isSelected: (selectedIndex == 0),
                  onTap: handleItemSelected,
                ),
                // _NavBarItem(
                //   icon: CupertinoIcons.bell_solid,
                //   label: "Notifications",
                //   index: 1,
                //   isSelected: (selectedIndex == 1),
                //   onTap: handleItemSelected,
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(
                //     left: 8.0,
                //     right: 8,
                //     bottom: 8,
                //   ),
                //   child: GlowingActionButton(
                //       color: AppColors.secondary,
                //       icon: CupertinoIcons.add,
                //       onPressed: () {} /*=> createNewConvo(context),*/),
                // ),
                // _NavBarItem(
                //   icon: CupertinoIcons.phone_fill,
                //   label: "Calls",
                //   index: 2,
                //   isSelected: (selectedIndex == 2),
                //   onTap: handleItemSelected,
                // ),
                _NavBarItem(
                    icon: Icons.person,
                    label: "Profile",
                    onTap: handleItemSelected,
                    isSelected: (selectedIndex == 1),
                    index: 1),
              ],
            ),
          )),
    );
  }
  // void createNewConvo(BuildContext context) {
  //   Navigator.of(context).push<dynamic>(MaterialPageRoute<dynamic>(
  //       builder: (BuildContext context) => NewMessageProvider()));
  // }
}

class _NavBarItem extends StatelessWidget {
  const _NavBarItem(
      {Key? key,
      required this.label,
      required this.icon,
      required this.index,
      this.isSelected = false,
      required this.onTap})
      : super(key: key);

  final String label;
  final IconData icon;
  final int index;
  final bool isSelected;

  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        onTap(index);
      },
      child: SizedBox(
        width: 70,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon,
                size: 25, color: isSelected ? AppColors.secondary : null),
            SizedBox(height: 8),
            Text(label,
                style: isSelected
                    ? TextStyle(
                        color: AppColors.secondary,
                        fontSize: 11,
                        fontWeight: FontWeight.bold)
                    : TextStyle(fontSize: 12))
          ],
        ),
      ),
    );
  }
}
