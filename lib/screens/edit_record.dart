import 'package:flutter/material.dart';
import 'package:true_vault/utils/encryptor.dart';
import 'package:true_vault/utils/form.dart' as formClass;
import 'package:true_vault/screens/empty_input_dialog.dart';

class EditRecordForm extends StatefulWidget {
  final formClass.Form form;
  final String password;
  const EditRecordForm({Key? key, required this.form, required this.password}) : super(key: key);
  @override
  _EditRecordFormState createState() => _EditRecordFormState();
}

String nameShortener(String formName) {
  return formName.length > 9 ? formName.substring(0, 9) + "..." : formName;
}

class _EditRecordFormState extends State<EditRecordForm> {
  bool obscureText = true;
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
                width: phoneWidth / 1.265,
                height: phoneHeight / 1.3,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Color(0xff189AB4),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(45, 42, 0, 0),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Title",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                      child: TextFormField(
                        key: const Key("edit-title-text-field"),
                        initialValue: Encryptor.cipherToPlainText(
                            widget.form.formDetails["serviceName"], widget.password),
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
                    Container(
                      margin: EdgeInsets.fromLTRB(45, 0, 0, 0),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Username",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                      child: TextFormField(
                        key: const Key("edit-username-text-field"),
                        initialValue: Encryptor.cipherToPlainText(
                            widget.form.formDetails["username"], widget.password),
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
                    Container(
                      margin: EdgeInsets.fromLTRB(45, 0, 0, 0),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Password",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                        child: Row(
                          children: [
                            Flexible(
                              child: TextFormField(
                                key: const Key("edit-password-text-field"),
                                obscureText: obscureText,
                                initialValue: Encryptor.cipherToPlainText(
                                    widget.form.formDetails["password"],
                                    widget.password),
                                onChanged: (newText) {
                                  editedPassword = true;
                                  password = newText;
                                },
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color.fromRGBO(23, 42, 58, 1.0),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 3, color: Colors.white),
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 3, color: Colors.white),
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                              key:
                                  const Key("eye-icon-button-edit-record-form"),
                              padding: EdgeInsets.fromLTRB(10, 0, 20, 0),
                              icon: const Icon(Icons.remove_red_eye_outlined,
                                  color: Colors.white),
                              onPressed: () {
                                setState(() {
                                  obscureText = !obscureText;
                                });
                              },
                            ),
                          ],
                        )),
                    Container(
                      margin: EdgeInsets.fromLTRB(45, 0, 0, 0),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Notes",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                      child: TextFormField(
                        key: const Key("edit-notes-text-field"),
                        initialValue: Encryptor.cipherToPlainText(
                            widget.form.formDetails["notes"], widget.password),
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
                      onTap: () {
                        var titleCheck = Encryptor.cipherToPlainText(
                                widget.form.formDetails["serviceName"],
                            widget.password)
                            .replaceAll(' ', '');
                        var usernameCheck = Encryptor.cipherToPlainText(
                                widget.form.formDetails["username"], widget.password)
                            .replaceAll(' ', '');
                        var passwordCheck = Encryptor.cipherToPlainText(
                                widget.form.formDetails["password"], widget.password)
                            .replaceAll(' ', '');
                        var notesCheck = Encryptor.cipherToPlainText(
                                widget.form.formDetails["notes"], widget.password)
                            .replaceAll(' ', '');

                        if (editedTitle) {
                          titleCheck = title;
                        }
                        if (editedUsername) {
                          usernameCheck = username;
                        }

                        if (editedPassword) {
                          passwordCheck = password;
                        }

                        if (notes.isEmpty) {
                          notes = " ";
                        }

                        const emptyTitle = 'Title cannot be empty\n';
                        const emptyUsername = 'Username cannot be empty\n';
                        const emptyPassword = 'Password cannot be empty\n';
                        var errors = "";

                        if (titleCheck.isEmpty) {
                          errors += emptyTitle;
                        }
                        if (usernameCheck.isEmpty) {
                          errors += emptyUsername;
                        }
                        if (passwordCheck.isEmpty) {
                          errors += emptyPassword;
                        }

                        if (titleCheck.isNotEmpty &&
                            usernameCheck.isNotEmpty &&
                            passwordCheck.isNotEmpty) {
                          if (editedTitle) {
                            widget.form.editForm("serviceName",
                                Encryptor.plainTextToCipher(title, widget.password));
                          }

                          if (editedUsername) {
                            widget.form.editForm(
                                "username",
                                Encryptor.plainTextToCipher(
                                    username, widget.password));
                          }
                          if (editedPassword) {
                            widget.form.editForm(
                                "password",
                                Encryptor.plainTextToCipher(
                                    password, widget.password));
                          }
                          if (editedNotes) {
                            widget.form.editForm("notes",
                                Encryptor.plainTextToCipher(notes, widget.password));
                          }

                          Navigator.of(context, rootNavigator: true).pop();
                        } else {
                          emptyInputDialog(context, errors);
                        }
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
