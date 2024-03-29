import 'package:flutter/material.dart';
import 'package:true_vault/screens/main_screen.dart';
import 'package:true_vault/utils/database.dart';
import 'package:true_vault/screens/delete_confirmation_form.dart';
import 'package:true_vault/utils/encryptor.dart';
import 'package:true_vault/utils/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:true_vault/services/database.dart';
import 'package:true_vault/utils/user.dart';

class DeleteDatabase extends StatefulWidget {
  //all of user's databases
  //final List<Database> databases;
  final TrueVaultUser currentUser;
  final String password;
  const DeleteDatabase(
      {Key? key,
      //required this.databases,
      required this.currentUser,
      required this.password})
      : super(key: key);
  @override
  State<DeleteDatabase> createState() => _DeleteDatabaseState();
}

//Template to list over the database
Widget deleteDatabaseTemplate(
    Database database, context, index, password, deleteDatabaseInstance, uID) {
  //Individual delete buttons
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 3, 8, 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            key: Key("deleteDatabaseElevatedButton" + index.toString()),
            onPressed: () async {
              try {
                bool deleteDatabase =
                    await DeleteConfirmationScreen(context, password);
                if (deleteDatabase) {
                  Navigator.pop(context, index);
                  //trash icon
                  //delete from firebase database
                  await deleteDatabaseInstance
                      .removeDatabase(database.databaseID);
                }
              } catch (e) {}
            },
            style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                primary: const Color.fromRGBO(255, 117, 117, 1)),
            child: const Icon(Icons.delete, color: Colors.white)),
        Expanded(
          child: AspectRatio(
            aspectRatio: 16 / 4,
            child: TextButton(
                key: Key("deleteDatabaseTextButton" + index.toString()),
                onPressed: () async {
                  try {
                    bool deleteDatabase =
                        await DeleteConfirmationScreen(context, password);
                    if (deleteDatabase) {
                      Navigator.pop(context, index);
                      //database button
                      //delete from firebase database
                      await deleteDatabaseInstance
                          .removeDatabase(database.databaseID);
                    }
                  } catch (e) {}
                },
                style: TextButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(24, 154, 180, 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: Text(
                  Encryptor.cipherToPlainText(
                      database.databaseName, password,uID),
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                  key: Key("deleteDatabaseText" + index.toString()),
                )),
          ),
        ),
      ],
    ),
  );
}

class _DeleteDatabaseState extends State<DeleteDatabase> {
  @override
  Widget build(BuildContext context) {
    DatabaseService deleteDatabaseInstance =
        DatabaseService(widget.currentUser.uID);
    double phoneWidth = MediaQuery.of(context).size.width; //411
    double phoneHeight = MediaQuery.of(context).size.height; //683
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                              key: const Key("deleteDatabaseCancelButton"),
                              onPressed: () => {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MainScreen(
                                          currentUser: widget.currentUser,
                                          password: widget.password)),
                                )
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
                          padding: const EdgeInsets.fromLTRB(25, 25, 25, 5),
                          child: AspectRatio(
                            aspectRatio: 15 / 6,
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Color.fromRGBO(255, 94, 94, 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              child: const Center(
                                child: Text(
                                  "WARNING!\nDeleting the database will permanently remove all the\nrecords!",
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
                          itemBuilder: (context, int index) =>
                              deleteDatabaseTemplate(
                                  widget.currentUser.databases[index],
                                  context,
                                  index,
                                  widget.password,
                                  deleteDatabaseInstance,
                                  widget.currentUser.uID),
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
      ),
    );
  }
}
