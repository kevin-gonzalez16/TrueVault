import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:true_vault/screens/main_screen.dart';
import 'package:true_vault/screens/view_database_screen.dart';
import 'package:true_vault/services/database.dart';
import 'package:true_vault/utils/database.dart';
import 'package:true_vault/utils/encryptor.dart';
import 'package:true_vault/screens/empty_input_dialog.dart';
import 'package:true_vault/utils/user.dart';

class CreateDatabase extends StatefulWidget {
  final TrueVaultUser currentUser;
  final String password;
  const CreateDatabase(
      {Key? key, required this.currentUser, required this.password})
      : super(key: key);

  @override
  State<CreateDatabase> createState() => _CreateDatabase();
}

class _CreateDatabase extends State<CreateDatabase> {
  TextEditingController databaseNameController = TextEditingController();
  TextEditingController databaseLocationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double phoneWidth = MediaQuery.of(context).size.width; //411
    double phoneHeight = MediaQuery.of(context).size.height; //683
    return Scaffold(
      resizeToAvoidBottomInset: false, // set it to false

      backgroundColor: const Color.fromRGBO(23, 42, 58, 1.0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: phoneHeight / 1.12,
              width: phoneWidth / 1.22,
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
                            key: const Key("newDatabaseCancelButton"),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MainScreen(
                                          currentUser: widget.currentUser,
                                          password: widget.password)));
                            },
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
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          runSpacing: 100,
                          children: [
                            TextField(
                              key: const Key("newDatabaseNameTextField"),
                              controller: databaseNameController,
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
                            TextField(
                              key: const Key("newDatabaseLocationTextField"),
                              controller: databaseLocationController,
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
                            SizedBox(
                                height: phoneHeight / 8.537,
                                width: phoneWidth / 1.644,
                                child: TextButton(
                                  key: const Key("createDatabaseButton"),
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
                                  onPressed: () {
                                    setState(() async {
                                      var locationCheck =
                                          databaseLocationController.text
                                              .replaceAll(' ', '');
                                      var nameCheck = databaseNameController
                                          .text
                                          .replaceAll(' ', '');

                                      var errors = "";
                                      if (nameCheck.isEmpty) {
                                        errors += "Name cannot be empty\n";
                                      }
                                      if (locationCheck.isEmpty) {
                                        errors += "Location cannot be empty\n";
                                      }
                                      if (nameCheck.isEmpty ||
                                          locationCheck.isEmpty) {
                                        emptyInputDialog(context, errors);
                                      } else {
                                        final DatabaseService test =
                                            DatabaseService(
                                                widget.currentUser.uID);

                                        String newDB = await test.addDatabase(
                                            Encryptor.plainTextToCipher(
                                                databaseNameController.text,
                                                widget.password));

                                        Database databaseObj = Database(
                                            Encryptor.plainTextToCipher(
                                                databaseNameController.text,
                                                widget.password),
                                            newDB);

                                        Navigator.pop(context, databaseObj);

                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ViewDatabaseScreen(
                                                        database:
                                                            databaseObj, password: widget.password,)));
                                      }
                                    });
                                  },
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
