import 'package:flutter/material.dart';

class LoginScreen2 extends StatefulWidget {
  const LoginScreen2({Key? key}) : super(key: key);

  @override
  State<LoginScreen2> createState() => _LoginScreen2State();
}

class _LoginScreen2State extends State<LoginScreen2> {
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
                child: Text(
                  'Log in',
                  style: TextStyle(color: Color(0xff989898)),
                ),
                color: Color(0xff189AB4),
                //  color: Color(0xff189AB4),
                onPressed: () {
                  setState(() {});
                }),
          ],
        )));
  }
}
