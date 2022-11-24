import 'package:flutter/material.dart';
import 'package:true_vault/screens/choose_database_screen.dart';
import 'package:true_vault/screens/create_database_screen.dart';
import 'package:true_vault/screens/delete_database_screen.dart';
import 'package:true_vault/screens/view_database_screen.dart';
import 'package:true_vault/screens/view_record.dart';
import 'package:true_vault/utils/database.dart';
import 'package:true_vault/utils/encryptor.dart';
import 'package:true_vault/utils/user.dart';

import 'landing_screen.dart';

class MainScreen extends StatefulWidget {
  final TrueVaultUser currentUser;
  final String password;
  const MainScreen(
      {Key? key, required this.currentUser, required this.password})
      : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

int databaseIndex = 0;
int recordIndex = 0;

class _MainScreenState extends State<MainScreen> {
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
            Container(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton(
                  key: const Key("logoutButton"),
                  child: const Text(
                    "Logout",
                    style: TextStyle(color: Colors.grey),
                  ),
                  onPressed: () {
                    setState(() {
                      databaseIndex = 0;
                      recordIndex = 0;
                    });
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LandingScreen()));
                  },
                ),
              ],
            ),
            GestureDetector(
              //Swiper for database
              onHorizontalDragEnd: (dragEndDetails) {
                //Swipe right gesture
                if (dragEndDetails.primaryVelocity! < 0) {
                  setState(() {
                    databaseIndex += 1;
                    recordIndex = 0;
                    databaseIndex =
                        databaseIndex >= widget.currentUser.databases.length
                            ? 0
                            : databaseIndex;
                  });
                }
                //swipe left gesture
                else if (dragEndDetails.primaryVelocity! > 0) {
                  setState(() {
                    databaseIndex -= 1;
                    recordIndex = 0;
                    databaseIndex = databaseIndex < 0
                        ? widget.currentUser.databases.length - 1
                        : databaseIndex;
                  });
                }
              },
              child: Container(
                  width: phoneWidth / 1.265,
                  height: phoneHeight / 4.55,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Color(0xff189AB4),
                  ),
                  child: Row(
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: [
                              Container(
                                width: 10.0,
                              ),
                              Icon(
                                Icons.donut_large_rounded,
                                color: Colors.white,
                                size: phoneWidth / 4.56,
                              ),
                            ],
                          )),
                      Container(
                        width: 10.0,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          widget.currentUser.databases.isEmpty
                              ? " "
                              : Encryptor.cipherToPlainText(
                                  widget.currentUser.databases[databaseIndex]
                                      .databaseName,
                                  "PASSWORD"),
                          style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  )),
              onTap: () {
                if (widget.currentUser.databases.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ViewDatabaseScreen(
                            database:
                                widget.currentUser.databases[databaseIndex])),
                  );
                }
              },
            ),
            ////////////
            Container(
              height: 40.0,
            ),
            GestureDetector(
              //Swiper for records
              onHorizontalDragEnd: (dragEndDetails) {
                //swipe right gesture
                if (dragEndDetails.primaryVelocity! < 0) {
                  setState(() {
                    recordIndex += 1;
                    if (widget.currentUser.databases.isEmpty) {
                      recordIndex = 0;
                    } else {
                      recordIndex = recordIndex >=
                              widget.currentUser.databases[databaseIndex].forms
                                  .length
                          ? 0
                          : recordIndex;
                    }
                  });
                }
                //swipe left gesture
                else if (dragEndDetails.primaryVelocity! > 0) {
                  setState(() {
                    recordIndex -= 0;
                    if (widget.currentUser.databases.isEmpty) {
                      recordIndex = 0;
                    } else {
                      recordIndex = recordIndex < 0
                          ? widget.currentUser.databases[databaseIndex].forms
                                  .length -
                              1
                          : recordIndex;
                    }
                  });
                }
              },
              child: Container(
                width: phoneWidth / 1.417,
                height: phoneHeight / 11.383,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  color: Color(0xff189AB4),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.currentUser.databases.isEmpty
                          ? " "
                          : widget.currentUser.databases[databaseIndex].forms
                                  .isEmpty
                              ? " "
                              : Encryptor.cipherToPlainText(
                                  widget
                                      .currentUser
                                      .databases[databaseIndex]
                                      .forms[recordIndex]
                                      .formDetails["serviceName"],
                                  "PASSWORD"),
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              onTap: () {
                if (widget.currentUser.databases.isNotEmpty &&
                    widget.currentUser.databases[databaseIndex].forms
                        .isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ViewRecordForm(
                            form: widget.currentUser.databases[databaseIndex]
                                .forms[recordIndex])),
                  );
                }
              },
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
                        height: phoneHeight / 11.383,
                        width: phoneWidth / 1.868,
                        child: TextButton(
                          key: const Key("new-database-button"),
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
                          onPressed: () async {
                            try {
                              Database newDatabaseObject = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CreateDatabase(
                                        currentUser: widget.currentUser,
                                        password: widget.password)),
                              ) as Database;
                              setState(() {
                                widget.currentUser.databases
                                    .add(newDatabaseObject);
                              });
                            } catch (e) {}
                          },
                          child: const Text(
                            'New Database',
                            key: Key("new-database-button-text"),
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
                          key: const Key("new-database-icon-button"),
                          splashColor: Colors.white, // Splash color
                          onTap: () async {
                            try {
                              Database newDatabaseObject = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CreateDatabase(
                                        currentUser: widget.currentUser,
                                        password: widget.password)),
                              ) as Database;
                              setState(() {
                                widget.currentUser.databases
                                    .add(newDatabaseObject);
                              });
                            } catch (e) {}
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
                        height: phoneHeight / 11.383,
                        width: phoneWidth / 1.868,
                        child: TextButton(
                          key: const Key("choose-database-button"),
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
                                  builder: (context) => ChooseDatabase(
                                      databases: widget.currentUser.databases,
                                      currentUser: widget.currentUser,
                                      password: widget.password)),
                            );
                          },
                          child: const Text(
                            'Open Database',
                            key: Key("choose-database-button-text"),
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
                          key: const Key("choose-database-icon-button"),
                          splashColor: Colors.white, // Splash color
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChooseDatabase(
                                      databases: widget.currentUser.databases,
                                      currentUser: widget.currentUser,
                                      password: widget.password)),
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
                        height: phoneHeight / 11.383,
                        width: phoneWidth / 1.868,
                        child: TextButton(
                          key: const Key("delete-database-button"),
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
                          onPressed: () async {
                            try {
                              while (true) {
                                int indexToDelete = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DeleteDatabase(
                                          databases:
                                              widget.currentUser.databases,
                                          currentUser: widget.currentUser,
                                          password: widget.password)),
                                ) as int;
                                setState(() {
                                  widget.currentUser.databases
                                      .removeAt(indexToDelete);
                                });
                              }
                            } catch (e) {}
                          },
                          child: const Text(
                            'Delete Database',
                            key: Key("delete-database-button-text"),
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
                          key: const Key("delete-database-icon-button"),
                          splashColor: Colors.white, // Splash color
                          onTap: () async {
                            while (true) {
                              try {
                                int indexToDelete = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DeleteDatabase(
                                          databases:
                                              widget.currentUser.databases,
                                          currentUser: widget.currentUser,
                                          password: widget.password)),
                                ) as int;
                                setState(() {
                                  widget.currentUser.databases
                                      .removeAt(indexToDelete);
                                });
                              } catch (e) {}
                            }
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
