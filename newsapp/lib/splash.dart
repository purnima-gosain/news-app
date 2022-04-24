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
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
                child: Image.asset("assets/news.jpg")),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Get the latest news",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.orange,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            const Text(
              "On your finger tip",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.orange,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Click on skip to see the news",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.orange,
                fontSize: 15,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 100,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(50, 60, 50, 0),
                child: ElevatedButton(
                  child: const Text("Skip >>"),
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(220, 41, 167, 131),
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                    // minimumSize: const Size.fromWidth(100),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: ((context) => HomeScreen())));
                  },
                ),
              ),
            ),
          ],
        ));
  }
}
