import 'package:flutter/material.dart';
import 'package:u_flavor/ui/SplashScreen.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'U Flavor',
      debugShowCheckedModeBanner: false ,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: SplashScreen(),
    );
  }
}


