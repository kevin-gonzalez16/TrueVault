import 'package:flutter/material.dart';
import 'package:true_vault/screens/main_screen.dart';
import 'package:true_vault/utils/user.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(23, 42, 58, 1.0),
        body: Center(
            child: Column(
          children: [
            Container(
              height: 60.0,
            ),
            Container(
                width: 325.0,
                height: 150.0,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Color(0xff189AB4),
                ),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Container(
                          width: 20.0,
                        ),
                        Icon(
                          Icons.donut_large_rounded,
                          color: Colors.white,
                          size: 90.0,
                        ),
                      ],
                    ))),
            Container(
              height: 60.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                key: const Key("login-text-field"),
                controller: passwordController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xffc9c9c9),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Color(0xffC9C9C9)),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  hintText: 'Master Password',
                  hintStyle: TextStyle(fontSize: 18, color: Color(0xff989898)),
                ),
              ),
            ),
            Container(
              height: 30.0,
            ),
            RaisedButton(
                key: const Key("login-screen-button"),
                child: Text(
                  'Log in',
                  style: TextStyle(color: Color(0xff989898)),
                ),
                color: Color(0xff189AB4),
                //  color: Color(0xff189AB4),
                onPressed: () {
                  User user = User();
                  if (user.password == passwordController.text) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => MainScreen()));
                  }
                  setState(() {});
                }),
          ],
        )));
  }
}
