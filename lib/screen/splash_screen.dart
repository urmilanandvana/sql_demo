import 'package:flutter/material.dart';
import 'package:sql_demo/component/color_cmp.dart';
import 'package:sql_demo/component/text_cmp.dart';
import 'package:sql_demo/screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState

    Future.delayed(
      (Duration(seconds: 4)),
      () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
            (route) => false);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/6755e5d0-5a26-4aad-abd8-02124d6c5323.jpg",
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: colorCmp.black.withOpacity(0.4),
                blurRadius: 10,
              ),
            ]),
          ),
          Positioned(
            bottom: 50,
            left: 15,
            right: 15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                text(
                  value: "Welcome to 👋",
                  color: colorCmp.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
                text(
                  value: "Shoea",
                  color: colorCmp.white,
                  fontSize: 60,
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(height: 15),
                text(
                  value:
                      "The best sneakers & shoes e-commerce app of the century for your fashion needs!",
                  color: colorCmp.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  overflow: TextOverflow.clip,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
