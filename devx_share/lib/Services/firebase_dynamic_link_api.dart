import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:devx_share/Provider/user_data.dart';
import 'package:devx_share/Screens/show_link.dart';
import 'package:provider/provider.dart';

class DynamicLinkAPI {
  void initDynamicLinks(context) async {
    // FirebaseDynamicLinks.instance.onLink;

    final PendingDynamicLinkData? data =
        await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri? deepLink = data?.link;

    if (deepLink != null) {
      print(deepLink.queryParameters.toString());
      print(deepLink.queryParameters['u']);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ShowLinks(userID: deepLink.queryParameters['u']),
        ),
      );
    }
  }

  Future createDynamicLink(context) async {
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: 'https://devxshare.page.link',
      link: Uri.parse(
          'https://www.devxshare.in/?u=${Provider.of<UserData>(context, listen: false).uID}'),
      androidParameters: AndroidParameters(
        packageName: 'com.example.devx_share',
        minimumVersion: 0,
      ),
      // dynamicLinkParametersOptions: DynamicLinkParametersOptions(
      //   shortDynamicLinkPathLength: ShortDynamicLinkPathLength.short,
      // ),
      socialMetaTagParameters: SocialMetaTagParameters(
        description: "Hey! Please checkout my profile",
        title: "Connect With Me",
        imageUrl: Uri.parse(
            "https://www.crushpixel.com/big-static18/preview4/initial-ps-letter-logo-creative-2985290.jpg"),
      ),
    );

    // Uri url;
    // final ShortDynamicLink shortLink = await parameters.buildShortLink();
    // url = shortLink.shortUrl;
    // print(url);
    // return url;
  }
}
