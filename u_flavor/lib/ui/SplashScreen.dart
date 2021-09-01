import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:u_flavor/ui/screens/TableScreen.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: AnimatedSplashScreen(
          splash: Column(
            children: [
              Image.asset('assets/sp_image.png'),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.red,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 2.0,
                      spreadRadius: 0.0,
                      offset: Offset(2.0, 2.0), // shadow direction: bottom right
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "U Flavor",
                    style: TextStyle(
                        fontSize: 50.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                              color: Colors.black.withOpacity(1.0),
                              offset: Offset(0.5, 0.9),
                              blurRadius: 1.0)
                        ]),
                  ),
                ),
              )
            ],
          ),
          nextScreen: TableScreen(),
          backgroundColor: Colors.redAccent,
          splashTransition: SplashTransition.slideTransition,
          splashIconSize: 500.0,
          pageTransitionType: PageTransitionType.fade
      ),
    );
  }
}


