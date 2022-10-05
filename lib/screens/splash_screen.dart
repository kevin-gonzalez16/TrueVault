import 'package:flutter/material.dart';
import 'package:true_vault/screens/landing_screen.dart';
import 'package:true_vault/screens/login_screen.dart';
import 'package:true_vault/screens/register_screen.dart';
import 'dart:async';
import 'package:true_vault/screens/main_screen.dart';
import 'package:true_vault/screens/view_database_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = Duration(seconds: 4);
    return Timer(duration, navigateToDeviceScreen);
  }

  navigateToDeviceScreen() {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => const LandingScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff189AB4),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 150.0,
            ),
            Text(
              "TrueVault",
              key: Key('splash-screen'), //will use later for testing
              style: TextStyle(
                  fontFamily: 'Times New Roman',
                  fontSize: 70,
                  fontWeight: FontWeight.normal,
                  color: Color(0xffFFFFFFB)),
            ),
            Container(
              height: 40.0,
            ),
            Icon(
              Icons.donut_large_rounded,
              color: Colors.white,
              size: 120.0,
            ),
          ],
        ),
      ),
    );
  }
}
