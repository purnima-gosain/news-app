// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:newsapp/home.dart';

class Splash extends StatefulWidget {
  Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    new Future.delayed(
      const Duration(seconds: 5),
      () => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) {
          return HomeScreen();
        }),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [Image.asset("assets/gimage.png")],
    ));
  }
}
