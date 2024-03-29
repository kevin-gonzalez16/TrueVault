import 'package:flutter/material.dart';
import 'package:true_vault/screens/choose_database_screen.dart';
import 'package:true_vault/utils/database.dart';
import 'package:true_vault/screens/new_record_form.dart';
import 'package:true_vault/screens/view_record.dart';
import 'package:true_vault/utils/encryptor.dart';
import 'package:true_vault/utils/form.dart' as formClass;
import 'package:true_vault/screens/delete_record_confirmation.dart';
import 'package:true_vault/services/database.dart';

double phoneWidth = 0;
double phoneHeight = 0;

class ViewDatabaseScreen extends StatefulWidget {
  final Database database;
  final String password;
  final String uid;
  const ViewDatabaseScreen(
      {Key? key,
      required this.database,
      required this.password,
      required this.uid})
      : super(key: key);
  @override
  State<ViewDatabaseScreen> createState() => _ViewDatabaseScreenState();
}

String nameShortener(String databaseName) {
  return databaseName.length >= 14
      ? databaseName.substring(0, 12) + "..."
      : databaseName;
}

Widget viewDatabaseTemplate(
    formClass.Form form, context, index, Database database, password, uid) {
  return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              height: phoneHeight / 11.383,
              width: phoneWidth / 1.868,
              child: TextButton(
                key: Key("view-record-button" + index.toString()),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromRGBO(23, 42, 58, 1.0)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            side: const BorderSide(
                                color: Colors.white, width: 2.5)))),
                onPressed: () async {
                  try {
                    form = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ViewRecordForm(
                                  form: form,
                                  password: password,
                                  databaseID: database.databaseID,
                                  uid: uid,
                                ))) as formClass.Form;
                  } catch (e) {}
                },
                child: Text(
                  Encryptor.cipherToPlainText(
                      form.formDetails["serviceName"], password, uid),
                  key: Key("view-record-button-text" + index.toString()),
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
              )),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: ClipOval(
              child: Material(
                color: Colors.red, // Button color
                child: InkWell(
                  key: Key("delete-record-icon-button" + index.toString()),
                  splashColor: Colors.white, // Splash color
                  onTap: () async {
                    try {
                      bool deleteDatabase =
                          await DeleteConfirmationScreen(context);

                      if (deleteDatabase) {
                        //delete from firebase

                        DatabaseService databaseService = DatabaseService(uid);
                        databaseService.removeRecord(
                            database.databaseID, form.recordID);

                        database.removeForm(index);

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ViewDatabaseScreen(
                                      database: database,
                                      password: password,
                                      uid: uid,
                                    )));
                      }
                    } catch (e) {}
                  },
                  child: const SizedBox(
                      width: 50, height: 50, child: Icon(Icons.delete)),
                ),
              ),
            ),
          ),
        ],
      ));
}

class _ViewDatabaseScreenState extends State<ViewDatabaseScreen> {
  @override
  Widget build(BuildContext context) {
    phoneWidth = MediaQuery.of(context).size.width; //411
    phoneHeight = MediaQuery.of(context).size.height; //683
    return Scaffold(
        resizeToAvoidBottomInset: false, // set it to false
        backgroundColor: const Color.fromRGBO(23, 42, 58, 1.0),
        body: Center(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 15.0, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton(
                    key: const Key("chooseRecordBackButton"),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: TextButton.styleFrom(
                      primary: const Color.fromRGBO(165, 165, 165, 1),
                    ),
                    child: const Text(
                      "back",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
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
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              nameShortener(Encryptor.cipherToPlainText(
                                  widget.database.databaseName,
                                  widget.password, widget.uid)),
                              key: Key(Encryptor.cipherToPlainText(
                                      widget.database.databaseName,
                                      widget.password, widget.uid) +
                                  "_text"),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 25),
                            ),
                          ),
                        ],
                      ))),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
              child: Container(
                  width: phoneWidth / 1.265,
                  height: phoneHeight / 1.821,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Color(0xff189AB4),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                          child: SizedBox(
                              child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: widget.database.forms.length,
                        itemBuilder: (BuildContext test, int index) {
                          return viewDatabaseTemplate(
                              widget.database.forms[index],
                              context,
                              index,
                              widget.database,
                              widget.password,
                              widget.uid);
                        },
                      ))),
                    ],
                  )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ClipOval(
                    child: Material(
                      color: const Color(0xff189AB4), // Button color
                      child: InkWell(
                        key: const Key("new-record-icon-button"),
                        splashColor: Colors.white, // Splash color
                        onTap: () async {
                          try {
                            formClass.Form myform = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NewRecordForm(
                                          password: widget.password,
                                          database: widget.database,
                                          uID: widget.uid,
                                        ))) as formClass.Form;
                            setState(() {
                              widget.database.addForm(myform);
                            });
                          } catch (e) {}
                        },
                        child: const SizedBox(
                            width: 56,
                            height: 56,
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            )),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        )));
  }
}
