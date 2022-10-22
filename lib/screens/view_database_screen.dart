import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:true_vault/screens/choose_database_screen.dart';
import 'package:true_vault/utils/database.dart';
import 'package:true_vault/screens/new_record_form.dart';
import 'package:true_vault/screens/view_record.dart';
import 'package:true_vault/utils/encryptor.dart';
import 'package:true_vault/utils/form.dart' as formClass;

class ViewDatabaseScreen extends StatefulWidget {
  final Database database;
  const ViewDatabaseScreen({Key? key, required this.database})
      : super(key: key);

  @override
  State<ViewDatabaseScreen> createState() => _ViewDatabaseScreenState();
}

String nameShortener(String databaseName) {
  return databaseName.length > 14
      ? databaseName.substring(0, 13) + "..."
      : databaseName;
}

Widget viewDatabaseTemplate(
    formClass.Form form, context, index, Database database) {
  return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              height: 60,
              width: 220,
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
                onPressed: () async{
                  form = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ViewRecordForm(form: form))
                  ) as formClass.Form;
                },
                child: Text(
                  Encryptor.cipherToPlainText(form.formDetails["serviceName"], "PASSWORD"),
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
                  onTap: () {
                    database.removeForm(index);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ViewDatabaseScreen(database: database)));
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChooseDatabase(
                                    databases: [],
                                  )));
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
                          const Icon(
                            Icons.donut_large_rounded,
                            color: Colors.white,
                            size: 90.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              nameShortener(
                                Encryptor.cipherToPlainText(widget.database.databaseName, "PASSWORD")
                              ),
                              key: Key(Encryptor.cipherToPlainText(widget.database.databaseName, "PASSWORD") + "_text"),
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
                  width: 325.0,
                  height: 375.0,
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
                              widget.database);
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
                          formClass.Form myform = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const NewRecordForm())) as formClass.Form;
                          setState(() {
                            widget.database.addForm(myform);
                          });
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
