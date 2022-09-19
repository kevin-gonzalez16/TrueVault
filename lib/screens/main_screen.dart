import 'package:flutter/material.dart';
import 'package:true_vault/screens/choose_database_screen.dart';
import 'package:true_vault/screens/create_database_screen.dart';
import 'package:true_vault/screens/delete_database_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
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

            ////////////
            Container(
              height: 40.0,
            ),
            Container(
              width: 290.0,
              height: 60.0,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                color: Color(0xff189AB4),
              ),
            ),

            Container(
              height: 40.0,
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Container(
                      width: 65.0,
                    ),
                    SizedBox(
                        height: 60,
                        width: 220,
                        child: TextButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Color(0xff189AB4)),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(
                                          color: Color.fromARGB(
                                              200, 24, 154, 180))))),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CreateDatabase()),
                            );
                          },
                          child: const Text(
                            'New Database',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        )),
                    Container(
                      width: 20.0,
                    ),
                    ClipOval(
                      child: Material(
                        color: Colors.green, // Button color
                        child: InkWell(
                          splashColor: Colors.white, // Splash color
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CreateDatabase()),
                            );
                          },
                          child: SizedBox(
                              width: 56, height: 56, child: Icon(Icons.add)),
                        ),
                      ),
                    )
                  ],
                )),
            Container(
              height: 35.0,
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Container(
                      width: 65.0,
                    ),
                    SizedBox(
                        height: 60,
                        width: 220,
                        child: TextButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Color(0xff189AB4)),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(
                                          color: Color.fromARGB(
                                              200, 24, 154, 180))))),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChooseDatabase()),
                            );
                          },
                          child: const Text(
                            'Open Database',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        )),
                    Container(
                      width: 20.0,
                    ),
                    ClipOval(
                      child: Material(
                        color:
                            Color.fromARGB(200, 95, 116, 170), // Button color
                        child: InkWell(
                          splashColor: Colors.white, // Splash color
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChooseDatabase()),
                            );
                          },
                          child: SizedBox(
                              width: 56,
                              height: 56,
                              child: Icon(Icons.vpn_key)),
                        ),
                      ),
                    )
                  ],
                )),
            Container(
              height: 35.0,
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Container(
                      width: 65.0,
                    ),
                    SizedBox(
                        height: 60,
                        width: 220,
                        child: TextButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Color(0xff189AB4)),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(
                                          color: Color.fromARGB(
                                              200, 24, 154, 180))))),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DeleteDatabase()),
                            );
                          },
                          child: const Text(
                            'Delete Database',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        )),
                    Container(
                      width: 20.0,
                    ),
                    ClipOval(
                      child: Material(
                        color: Colors.red, // Button color
                        child: InkWell(
                          splashColor: Colors.white, // Splash color
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DeleteDatabase()),
                            );
                          },
                          child: SizedBox(
                              width: 56, height: 56, child: Icon(Icons.delete)),
                        ),
                      ),
                    )
                  ],
                )),
          ],
        )));
  }
}
