import 'package:flutter/material.dart';
import 'package:true_vault/screens/register_selection_screen.dart';
import 'package:true_vault/screens/login_screen.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    double phoneWidth = MediaQuery.of(context).size.width; //411
    double phoneHeight = MediaQuery.of(context).size.height; //683
    return Scaffold(
        resizeToAvoidBottomInset: false, // set it to false
        backgroundColor: const Color.fromRGBO(23, 42, 58, 1.0),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Container(
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
                          Icon(
                            Icons.donut_large_rounded,
                            color: Colors.white,
                            size: phoneWidth / 4.56,
                          ),
                        ],
                      ))),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 30, 25, 0),
              child: AspectRatio(
                  aspectRatio: 9 / 2,
                  child: TextButton(
                    key: const Key("landingScreenRegisterButton"),
                    onPressed: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const RegisterSelectionScreen()))
                    },
                    child: const Text(
                      "Register",
                      key: Key("landingScreenRegisterButtonText"),
                      style: TextStyle(fontSize: 20),
                    ),
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: const Color(0xff189AB4),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 35, 25, 0),
              child: AspectRatio(
                  aspectRatio: 9 / 2,
                  child: TextButton(
                    key: const Key("landingScreenLoginButton"),
                    onPressed: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()))
                    },
                    child: const Text(
                      "Login",
                      key: Key("landingScreenLoginButtonText"),
                      style: TextStyle(fontSize: 20),
                    ),
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: const Color(0xff189AB4),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                    ),
                  )),
            ),
          ],
        )));
  }
}
