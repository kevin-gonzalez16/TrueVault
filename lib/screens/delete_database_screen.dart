import 'package:flutter/material.dart';
import 'package:true_vault/screens/main_screen.dart';
import 'package:true_vault/utils/database.dart';
import 'package:true_vault/screens/delete_confirmation_form.dart';

class DeleteDatabase extends StatefulWidget {
  //all of user's databases
  final List<Database> databases;
  const DeleteDatabase({Key? key, required this.databases}) : super(key: key);
  @override
  State<DeleteDatabase> createState() => _DeleteDatabaseState();
}

//Template to list over the database
Widget deleteDatabaseTemplate(Database database, context, index) {
  //Individual delete buttons
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 3, 8, 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            key: Key("deleteDatabaseElevatedButton" + index.toString()),
            onPressed: () async {
              bool deleteDatabase =
                  await DeleteConfirmationScreen(context) as bool;
              if (deleteDatabase) {
                Navigator.pop(context, index);
              }
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
                  bool deleteDatabase =
                      await DeleteConfirmationScreen(context) as bool;
                  if (deleteDatabase) {
                    Navigator.pop(context, index);
                  }
                },
                style: TextButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(24, 154, 180, 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: Text(
                  database.databaseName,
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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(23, 42, 58, 1.0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                height: height - 75,
                width: width - 75,
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
                                      builder: (context) => const MainScreen()),
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
                          itemCount: databases.length,
                          itemBuilder: (BuildContext test, int index) {
                            return deleteDatabaseTemplate(
                                databases[index], context, index);
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
      ),
    );
  }
}
