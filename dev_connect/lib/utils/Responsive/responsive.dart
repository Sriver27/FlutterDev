import 'package:dev_connect/providers/user_provider.dart';
import 'package:dev_connect/utils/globalvar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class responsiveLayout extends StatefulWidget {
  final Widget webScreenLayout;
  final Widget mobileScreenLayout;
  const responsiveLayout({
    Key? key,
    required this.webScreenLayout,
    required this.mobileScreenLayout,
  }) : super(key: key);

  @override
  State<responsiveLayout> createState() => _responsiveLayoutState();
}

class _responsiveLayoutState extends State<responsiveLayout> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addData();
  }

  void addData() async {
    userProvider _userProvider = Provider.of(context, listen: false);
    await _userProvider.refreshUser();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > webScreenSize) {
          //webScreen
          return widget.webScreenLayout;
        }
        //mobile Screen
        else {
          return widget.mobileScreenLayout;
        }
      },
    );
  }
}
