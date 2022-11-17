import 'package:flutter/material.dart';
import 'package:true_vault/screens/main_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:true_vault/services/auth.dart';
import 'dart:async';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool showMessage = false;
  bool _isVisible = false;
  recieveResponseFromTimer() {
    if (!mounted) return;

    setState(() {
      showMessage = false;
    });
  }

  setTimer() {
    var duration = Duration(seconds: 3);
    return Timer(duration, recieveResponseFromTimer);
  }

  @override
  void initState() {
    setTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double phoneWidth = MediaQuery.of(context).size.width; //411
    double phoneHeight = MediaQuery.of(context).size.height; //683
    return Scaffold(
        resizeToAvoidBottomInset: false, // set it to false
        backgroundColor: const Color.fromRGBO(23, 42, 58, 1.0),
        body: Center(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                    //replace with our own icon data.
                  )
                ],
              ),
            ),
            Container(
              height: 20.0,
            ),
            Container(
                width: phoneWidth / 1.265,
                height: phoneHeight / 4.55,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Color(0xff189AB4),
                ),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Icon(Icons.donut_large_rounded,
                            color: Colors.white, size: phoneWidth / 4.56),
                      ],
                    ))),
            Container(
              height: 40.0,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
              child: TextField(
                key: const Key("login-email-text-field"),
                controller: emailController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xffc9c9c9),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Color(0xffC9C9C9)),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Color(0xffC9C9C9)),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  hintText: 'Enter Email',
                  hintStyle: TextStyle(fontSize: 18, color: Color(0xff989898)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
              child: TextField(
                obscureText: !_isVisible,
                key: const Key("login-password-text-field"),
                controller: passwordController,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isVisible = !_isVisible;
                      });
                    },
                    icon: _isVisible
                        ? Icon(
                            Icons.visibility,
                            color: Colors.black,
                          )
                        : Icon(Icons.visibility_off, color: Colors.grey),
                  ),
                  filled: true,
                  fillColor: Color(0xffc9c9c9),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Color(0xffC9C9C9)),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Color(0xffC9C9C9)),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  hintText: 'Enter Password',
                  hintStyle: TextStyle(fontSize: 18, color: Color(0xff989898)),
                ),
              ),
            ),
            Container(
              height: 10.0,
            ),
            (showMessage)
                ? Text(
                    'Incorrect Login, Please Try Again',
                    style: TextStyle(fontSize: 15, color: Colors.red),
                    key: Key("incorrect-login-text-message"),
                  )
                : Text(""),
            Container(
              height: 15.0,
            ),
            RaisedButton(
                padding: const EdgeInsets.fromLTRB(75, 20, 75, 20),
                key: const Key("login-screen-button"),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: const Text(
                  'Log in',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                  key: Key("loginButtonText"),
                ),
                color: Color(0xff189AB4),
                //  color: Color(0xff189AB4),
                onPressed: () async {
                  await Firebase.initializeApp();
                  AuthService test = AuthService();
                  dynamic result = await test.signInWithEmailAndPassword(
                      emailController.text, passwordController.text);

                  if (result == null) {
                    showMessage = true;
                    setTimer();
                  } else {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => MainScreen()));
                  }
                  setState(() {});
                }),
          ],
        )));
  }
}
