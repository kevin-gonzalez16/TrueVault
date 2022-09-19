import 'package:flutter/material.dart';

class CreateDatabase extends StatefulWidget {
  const CreateDatabase({Key? key}) : super(key: key);

  @override
  State<CreateDatabase> createState() => _CreateDatabase();
}

class _CreateDatabase extends State<CreateDatabase> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(23, 42, 58, 1.0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 625,
              width: 325,
              child: Container(
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(239, 239, 239, 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TextButton(
                            onPressed: () => Navigator.pushReplacementNamed(
                                context, 'main_screen'),
                            style: TextButton.styleFrom(
                              primary: const Color.fromRGBO(165, 165, 165, 1),
                            ),
                            child: const Text(
                              "cancel",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 5, 30, 25),
                        child: Column(
                          children: [
                            Container(
                              height: 40.0,
                            ),
                            TextField(
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Color(0xffC9C9C9),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 3, color: Color(0xffC9C9C9)),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                hintText: 'Database Name',
                                hintStyle: TextStyle(
                                    fontSize: 18, color: Color(0xff989898)),
                              ),
                            ),
                            Container(
                              height: 50.0,
                            ),
                            TextField(
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Color(0xffC9C9C9),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 3, color: Color(0xffC9C9C9)),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                hintText: 'Database Location',
                                hintStyle: TextStyle(
                                    fontSize: 18, color: Color(0xff989898)),
                              ),
                            ),
                            Container(
                              height: 180.0,
                            ),
                            SizedBox(
                                height: 80,
                                width: 250,
                                child: TextButton(
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(
                                          Color.fromARGB(200, 24, 154, 180)),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                              side: BorderSide(
                                                  color: Color.fromARGB(
                                                      200, 24, 154, 180))))),
                                  onPressed: () {},
                                  child: const Text(
                                    'Create Database',
                                    style: TextStyle(
                                        fontSize: 25, color: Colors.white),
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
