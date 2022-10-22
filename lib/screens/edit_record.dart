import 'package:flutter/material.dart';
import 'package:true_vault/screens/choose_database_screen.dart';
import 'package:true_vault/screens/main_screen.dart';
import 'package:true_vault/screens/view_database_screen.dart';
import 'package:true_vault/utils/database.dart';
import 'package:flutter/services.dart';
import 'package:true_vault/utils/encryptor.dart';
import 'package:true_vault/utils/form.dart' as formClass;

class EditRecordForm extends StatefulWidget {
  final formClass.Form form;
  const EditRecordForm({Key? key, required this.form}) : super(key: key);
  @override
  _EditRecordFormState createState() => _EditRecordFormState();
}

String nameShortener(String formName) {
  return formName.length > 9 ? formName.substring(0, 9) + "..." : formName;
}

class _EditRecordFormState extends State<EditRecordForm> {
  String title = "";
  String username = "";
  String password = "";
  String notes = "";
  bool editedTitle = false;
  bool editedUsername = false;
  bool editedPassword = false;
  bool editedNotes = false;
  @override
  Widget build(BuildContext context) {
    double phoneWidth = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).viewPadding;
    double phoneHeight = height - padding.top - padding.bottom;

    return Scaffold(
        backgroundColor: Color.fromRGBO(23, 42, 58, 1.0),
        resizeToAvoidBottomInset: false,
        body: Center(
            child: Column(
          children: [
            Container(
              height: 20.0,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
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
            ),
            Container(
                width: 325.0,
                height: phoneHeight / 1.3,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Color(0xff189AB4),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 42, 20, 20),
                      child: TextFormField(
                        key: const Key("edit-title-text-field"),
                        initialValue:Encryptor.cipherToPlainText(widget.form.formDetails["serviceName"], "PASSWORD"),
                        onChanged: (newText) {
                          setState(() {
                            editedTitle = true;
                            title = newText;
                          });
                        },
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromRGBO(23, 42, 58, 1.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 3, color: Colors.white),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 3, color: Colors.white),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 15, 20, 20),
                      child: TextFormField(
                        key: const Key("edit-username-text-field"),
                        initialValue: Encryptor.cipherToPlainText(widget.form.formDetails["username"], "PASSWORD"),
                        onChanged: (newText) {
                          editedUsername = true;
                          username = newText;
                        },
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromRGBO(23, 42, 58, 1.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 3, color: Colors.white),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 3, color: Colors.white),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 15, 20, 20),
                      child: TextFormField(
                        key: const Key("edit-password-text-field"),
                        initialValue: Encryptor.cipherToPlainText(widget.form.formDetails["password"], "PASSWORD"),
                        onChanged: (newText) {
                          editedPassword = true;
                          password = newText;
                        },
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromRGBO(23, 42, 58, 1.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 3, color: Colors.white),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 3, color: Colors.white),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 15, 20, 20),
                      child: TextFormField(
                        key: const Key("edit-notes-text-field"),
                        initialValue: Encryptor.cipherToPlainText(widget.form.formDetails["notes"], "PASSWORD"),
                        onChanged: (newText) {
                          editedNotes = true;
                          notes = newText;
                        },
                        style: TextStyle(color: Colors.white),
                        minLines: 1,
                        maxLines: 5,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromRGBO(23, 42, 58, 1.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 3, color: Colors.white),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 3, color: Colors.white),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
            Container(
              height: 25.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 40.0,
                ),
                Spacer(),
                ClipOval(
                  child: Material(
                    color: Color(0xff189AB4), // Button color
                    child: InkWell(
                      key: const Key("save-edits-button"),
                      splashColor: Colors.white, // Splash color
                      onTap: () async {
                        if (editedTitle) {
                          widget.form.editForm("serviceName", Encryptor.plainTextToCipher(title, "PASSWORD"));
                        }

                        if (editedUsername) {
                          widget.form.editForm("username", Encryptor.plainTextToCipher(username, "PASSWORD"));
                        }
                        if (editedPassword) {
                          widget.form.editForm("password", Encryptor.plainTextToCipher(password, "PASSWORD"));
                        }
                        if (editedNotes) {
                          widget.form.editForm("notes", Encryptor.plainTextToCipher(notes, "PASSWORD"));
                        }

                        Navigator.of(context, rootNavigator: true).pop();
                      },
                      child: SizedBox(
                          width: 56,
                          height: 56,
                          child: Icon(Icons.save_rounded,
                              size: 35, color: Colors.white)),
                    ),
                  ),
                ),
                Container(
                  width: 40.0,
                ),
              ],
            )
          ],
        )));
  }
}
