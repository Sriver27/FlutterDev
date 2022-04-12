import 'package:devx_share/Screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:devx_share/Services/google_auth_api.dart';
import 'package:devx_share/Widgets/login_screen_animation.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'ProShare',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                const Icon(
                  Icons.share,
                  color: Colors.white,
                  size: 40,
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    const Color(0xff0276E8),
                  ),
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 35))),
              onPressed: () async {
                final user = await GoogleAuthApi().loginWithGoogle(context);
                if (user) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const HomeScreen()));
                }
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0)),
                    child: Image.network(
                      "https://cdn.icon-icons.com/icons2/2631/PNG/512/google_search_new_logo_icon_159150.png",
                      height: 30,
                      width: 30,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Get Started',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const BuildRotatedWidget(
            image: "codeforces_logo",
            top: 50,
            left: 50,
            tilt: 40,
          ),
          BuildRotatedWidget(
            image: "devfolio",
            top: MediaQuery.of(context).size.height - 90,
            left: MediaQuery.of(context).size.width - 90,
            tilt: 40,
          ),
          const BuildRotatedWidget(
            image: "leetcode",
            top: 650,
            left: 110,
            tilt: 78,
          ),
          // const BuildRotatedWidget(
          //   image: "atcoder",
          //   top: 450,
          //   left: 350,
          //   tilt: 37,
          // ),
          const BuildRotatedWidget(
            image: "LinkedIn",
            top: 270,
            left: 18,
            tilt: 12,
          ),
          BuildRotatedWidget(
            image: "gmail",
            top: MediaQuery.of(context).size.height - 65,
            left: 18,
            tilt: 12,
          ),
          const BuildRotatedWidget(
            image: "yt",
            top: 500,
            left: 300,
            tilt: 37,
          ),
          BuildRotatedWidget(
            image: "gfg",
            top: 55,
            left: MediaQuery.of(context).size.width - 90,
            tilt: 12,
          ),
          BuildRotatedWidget(
            image: "fb",
            top: MediaQuery.of(context).size.width + 75,
            left: MediaQuery.of(context).size.height * 0.1,
            tilt: 12,
          ),
          const BuildRotatedWidget(
            image: "g+",
            top: 170,
            left: 170,
            tilt: 15,
          ),
          BuildRotatedWidget(
            image: "github",
            top: MediaQuery.of(context).size.height * 0.5 - 150,
            left: MediaQuery.of(context).size.width - 95,
            tilt: 15,
            height: 75,
            width: 75,
          )
        ],
      ),
    );
  }

  // Widget buildRotatedWidget(
  //         String image, double top, double left, double tilt) =>
  //     ;

}
