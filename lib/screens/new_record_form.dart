import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:true_vault/utils/database.dart';
import 'package:true_vault/utils/encryptor.dart';
import 'package:true_vault/utils/form.dart' as formClass;
import 'package:true_vault/screens/generate_password_dialog.dart';
import 'package:true_vault/screens/empty_input_dialog.dart';
import 'package:true_vault/services/database.dart';
import 'package:true_vault/utils/user.dart';

class NewRecordForm extends StatefulWidget {
  final String password;
  final Database database;
  const NewRecordForm(
      {Key? key, required this.password, required this.database})
      : super(key: key);

  @override
  State<NewRecordForm> createState() => _NewRecordFormState();
}

class _NewRecordFormState extends State<NewRecordForm> {
  bool obscureText = true;
  TextEditingController passwordController = TextEditingController();
  String title = "";
  String username = "";
  String password = "";
  String notes = "";

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
                key: const Key("new-record-back-button"),
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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 42, 20, 20),
                      child: TextField(
                        key: const Key("title-input-new-form"),
                        onChanged: (newText) {
                          setState(() {
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
                          hintText: "Title",
                          hintStyle:
                              TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 15, 20, 20),
                      child: TextField(
                        key: const Key("username-input-new-form"),
                        onChanged: (newText) {
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
                          hintText: "Username",
                          hintStyle:
                              TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 15, 20, 20),
                      child: Row(
                        children: [
                          Flexible(
                            child: TextField(
                              controller: passwordController,
                              obscureText: obscureText,
                              key: const Key("password-input-new-form"),
                              onChanged: (newText) {
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
                                hintText: 'Password',
                                hintStyle: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ),
                          ),
                          IconButton(
                            key: const Key("eye-icon-button-new-record-form"),
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
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 15, 20, 20),
                      child: TextField(
                        key: const Key("notes-input-new-form"),
                        onChanged: (newText) {
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
                          hintText: 'Notes',
                          hintStyle:
                              TextStyle(fontSize: 18, color: Colors.white),
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
                ClipOval(
                  child: Material(
                    color: Color(0xff189AB4), // Button color
                    child: InkWell(
                      key: const Key("generate-password-button"),
                      splashColor: Colors.white, // Splash color
                      onTap: () async {
                        try {
                          password = await generatePasswordDialog(context);
                          passwordController.text = password;
                        } catch (e) {}
                      },
                      child: SizedBox(
                          width: 56,
                          height: 56,
                          child: Icon(Icons.vpn_key_outlined,
                              size: 35, color: Colors.white)),
                    ),
                  ),
                ),
                Spacer(),
                ClipOval(
                  child: Material(
                    color: Color(0xff189AB4), // Button color
                    child: InkWell(
                      key: const Key("new-form-save-button"),
                      splashColor: Colors.white, // Splash color
                      onTap: () async {
                        var titleCheck = title.replaceAll(' ', '');
                        var usernameCheck = username.replaceAll(' ', '');
                        var passwordCheck = password.replaceAll(' ', '');
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

                        if (titleCheck.isEmpty ||
                            usernameCheck.isEmpty ||
                            passwordCheck.isEmpty) {
                          emptyInputDialog(context, errors);
                        }
                        if (notes.isEmpty) {
                          notes = " ";
                        }

                        if (titleCheck.isNotEmpty &&
                            usernameCheck.isNotEmpty &&
                            passwordCheck.isNotEmpty) {

                          //create a new form in firebase
                          final user = FirebaseAuth.instance.currentUser!;
                          final DatabaseService addRec =
                              DatabaseService(user.uid);
                          String recordID = await addRec.addRecord(widget.database.databaseID, [
                            Encryptor.plainTextToCipher(title, widget.password),
                            Encryptor.plainTextToCipher(
                                username, widget.password),
                            Encryptor.plainTextToCipher(
                                password, widget.password),
                            Encryptor.plainTextToCipher(notes, widget.password)
                          ]);

                          //create a new form
                          formClass.Form newForm = formClass.Form([
                            Encryptor.plainTextToCipher(title, widget.password),
                            Encryptor.plainTextToCipher(
                                username, widget.password),
                            Encryptor.plainTextToCipher(
                                password, widget.password),
                            Encryptor.plainTextToCipher(notes, widget.password),
                            Encryptor.plainTextToCipher(" ", widget.password),
                            Encryptor.plainTextToCipher(" ", widget.password),
                          ], recordID);

                          Navigator.pop(context, newForm);
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
