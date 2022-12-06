import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:true_vault/utils/encryptor.dart';
import 'package:true_vault/utils/form.dart' as formClass;

import 'package:true_vault/screens/edit_record.dart';

class ViewRecordForm extends StatefulWidget {
  final formClass.Form form;
  final String password;
  final String databaseID;
  final String uid;
  const ViewRecordForm(
      {Key? key,
      required this.form,
      required this.password,
      required this.databaseID,
      required this.uid})
      : super(key: key);
  @override
  _ViewRecordFormState createState() => _ViewRecordFormState();
}

String nameShortener(String formName) {
  return formName.length > 9 ? formName.substring(0, 9) + "..." : formName;
}

class _ViewRecordFormState extends State<ViewRecordForm> {
  String password = "Secret";
  bool obscureText = true;

  @override
  Widget build(
    BuildContext context,
  ) {
    double phoneWidth = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).viewPadding;
    double phoneHeight = height - padding.top - padding.bottom;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromRGBO(23, 42, 58, 1.0),
        body: Center(
            child: Column(
          children: [
            Container(
              height: 20.0,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                    key: const Key("view-record-back-button"),
                  )
                ],
              ),
            ),
            Container(
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
                        Container(
                          width: 20.0,
                        ),
                        Text(
                          nameShortener(Encryptor.cipherToPlainText(
                              widget.form.formDetails["serviceName"],
                              widget.password, widget.uid)),
                          key: const Key("view-form-title"),
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ))),
            Container(
              height: 30.0,
            ),
            Container(
                width: phoneWidth / 1.265,
                height: phoneHeight / 1.9,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Color(0xff189AB4),
                ),
                child: Column(
                  children: [
                    /////////////////////ROW 1///////////////////
                    Container(
                      margin: EdgeInsets.fromLTRB(45, 15, 0, 0),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Username",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),

                    Row(
                      children: [
                        Container(
                            margin: EdgeInsets.fromLTRB(25, 0, 0, 15),
                            padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                            width: phoneWidth / 1.957,
                            height: phoneHeight / 11.383,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(23, 42, 58, 1.0),
                                border:
                                    Border.all(color: Colors.white, width: 3),
                                borderRadius: BorderRadius.circular(25.0)),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                Encryptor.cipherToPlainText(
                                    widget.form.formDetails["username"],
                                    widget.password, widget.uid),
                                key: const Key("view-form-username"),
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            )),
                        IconButton(
                          padding: EdgeInsets.fromLTRB(45, 0, 0, 20),
                          icon: const Icon(Icons.content_copy,
                              color: Colors.white),
                          onPressed: () async {
                            Clipboard.setData(new ClipboardData(
                                    text: Encryptor.cipherToPlainText(
                                        widget.form.formDetails["username"],
                                        widget.password, widget.uid)))
                                .then((_) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content:
                                          Text('Copied to your clipboard !')));
                            });
                          },
                        ),
                      ],
                    ),

                    /////////////////////ROW 2///////////////////

                    Container(
                      margin: EdgeInsets.fromLTRB(45, 0, 0, 0),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Password',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                            margin: EdgeInsets.fromLTRB(25, 0, 0, 15),
                            padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                            width: phoneWidth / 1.957,
                            height: phoneHeight / 11.383,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(23, 42, 58, 1.0),
                                border:
                                    Border.all(color: Colors.white, width: 3),
                                borderRadius: BorderRadius.circular(25.0)),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                obscureText == true
                                    ? '${password.replaceAll(RegExp(r"."), "*")}'
                                    : Encryptor.cipherToPlainText(
                                        widget.form.formDetails["password"],
                                        widget.password, widget.uid),
                                key: const Key("view-form-password"),
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            )),
                        Expanded(
                          child: IconButton(
                            key: const Key("eye-icon-button-view-form"),
                            padding: EdgeInsets.fromLTRB(10, 0, 20, 20),
                            icon: const Icon(Icons.remove_red_eye_outlined,
                                color: Colors.white),
                            onPressed: () {
                              setState(() {
                                obscureText = !obscureText;
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: IconButton(
                            padding: EdgeInsets.fromLTRB(0, 0, 40, 20),
                            icon: const Icon(Icons.content_copy,
                                color: Colors.white),
                            onPressed: () async {
                              Clipboard.setData(new ClipboardData(
                                      text: Encryptor.cipherToPlainText(
                                          widget.form.formDetails["password"],
                                          widget.password, widget.uid)))
                                  .then((_) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            'Copied to your clipboard !')));
                              });
                            },
                          ),
                        ),
                      ],
                    ),

                    /////////////////////ROW 3///////////////////
                    ///
                    Container(
                      margin: EdgeInsets.fromLTRB(45, 0, 0, 0),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Notes',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(25, 0, 0, 20),
                          padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                          width: phoneWidth / 1.957,
                          height: phoneHeight / 7.189,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(23, 42, 58, 1.0),
                              border: Border.all(color: Colors.white, width: 3),
                              borderRadius: BorderRadius.circular(25.0)),
                          child: SingleChildScrollView(
                              padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  Encryptor.cipherToPlainText(
                                      widget.form.formDetails["notes"],
                                      widget.password, widget.uid),
                                  key: const Key("view-form-notes"),
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white),
                                ),
                              )),
                        ),
                        IconButton(
                          padding: EdgeInsets.fromLTRB(45, 0, 0, 20),
                          icon: const Icon(Icons.content_copy,
                              color: Colors.white),
                          onPressed: () async {
                            Clipboard.setData(new ClipboardData(
                              text: Encryptor.cipherToPlainText(
                                  widget.form.formDetails["notes"],
                                  widget.password, widget.uid),
                            )).then((_) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content:
                                          Text('Copied to your clipboard !')));
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                )),
            Container(
              height: 15.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ClipOval(
                  child: Material(
                    color: Color(0xff189AB4), // Button color
                    child: InkWell(
                      key: const Key("edit-form"),
                      splashColor: Colors.white, // Splash color
                      onTap: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditRecordForm(
                                      form: widget.form,
                                      password: widget.password,
                                      databaseID: widget.databaseID,
                                      uid: widget.uid,
                                    ))).then((value) => setState(() {}));
                      },
                      child: SizedBox(
                          width: 56,
                          height: 56,
                          child: Icon(Icons.create_outlined,
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
