import 'dart:async';

import 'package:flutter/material.dart';

import '../../../database/sqlite.dart';
import 'Login.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    LiteSolution.initializeDatabase();
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                    Login()
            )
        )
    );
  }
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Image.asset(
              "assests/background.png",
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
            ),
            Image.asset(
              "assests/spalshcar.png",
              height: MediaQuery.of(context).size.height-70,
              width: MediaQuery.of(context).size.width-30,
              fit: BoxFit.fill,
            ),

          ],
        ),
      ),
    );
  }
}
