import 'package:flutter/material.dart';
import 'package:true_vault/screens/main_screen.dart';
import 'package:true_vault/screens/view_database_screen.dart';
import 'package:true_vault/utils/database.dart';
import 'package:true_vault/utils/encryptor.dart';
import 'package:true_vault/utils/user.dart';

class ChooseDatabase extends StatefulWidget {
  //all of user's databases
  final TrueVaultUser currentUser;
  final String password;
  const ChooseDatabase(
      {Key? key,
      required this.currentUser,
      required this.password})
      : super(key: key);
  @override
  State<ChooseDatabase> createState() => _ChooseDatabaseState();
}

//Template to list over the databases
Widget chooseDatabaseTemplate(Database database, int index, context, password, uid) {
  //Individual Database Buttons
  return Padding(
    padding: const EdgeInsets.fromLTRB(8, 3, 8, 10),
    child: AspectRatio(
      aspectRatio: 16 / 4,
      child: TextButton(
          key: Key("chooseDatabaseButton" + index.toString()),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ViewDatabaseScreen(database: database, password: password, uid:uid)));
          },
          style: TextButton.styleFrom(
            backgroundColor: const Color.fromRGBO(24, 154, 180, 1),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          child: Text(
            Encryptor.cipherToPlainText(database.databaseName, password),
            style: const TextStyle(color: Colors.white, fontSize: 20),
            key: Key("chooseDatabaseButtonText" + index.toString()),
          )),
    ),
  );
}

class _ChooseDatabaseState extends State<ChooseDatabase> {
  @override
  Widget build(BuildContext context) {
    double phoneWidth = MediaQuery.of(context).size.width; //411
    double phoneHeight = MediaQuery.of(context).size.height; //683
    return Scaffold(
        backgroundColor: const Color.fromRGBO(23, 42, 58, 1.0),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  height: phoneHeight / 1.12,
                  width: phoneWidth / 1.22,
                  child: Container(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextButton(
                                key: const Key("chooseDatabaseCancelButton"),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MainScreen(
                                              currentUser: widget.currentUser,
                                              password: widget.password,
                                            )),
                                  );
                                },
                                style: TextButton.styleFrom(
                                  primary:
                                      const Color.fromRGBO(165, 165, 165, 1),
                                ),
                                child: const Text(
                                  "cancel",
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(25, 25, 25, 5),
                            child: AspectRatio(
                              aspectRatio: 15 / 5,
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Color.fromRGBO(95, 116, 170, 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                ),
                                child: const Center(
                                  child: Text(
                                    "Choose a database\nto open",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                              child: SizedBox(
                                  child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: widget.currentUser.databases.length,
                            itemBuilder: (BuildContext test, int index) {
                              return chooseDatabaseTemplate(
                                  widget.currentUser.databases[index], index, context, widget.password, widget.currentUser.uID);
                            },
                          ))),
                        ],
                      ),
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(239, 239, 239, 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      )),
                ),
              )
            ],
          ),
        ));
  }
}
