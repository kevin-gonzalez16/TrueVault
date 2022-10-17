import 'package:flutter/material.dart';
import 'package:true_vault/screens/choose_database_screen.dart';
import 'package:true_vault/screens/main_screen.dart';
import 'package:true_vault/utils/database.dart';
import 'package:flutter/services.dart';
import 'package:true_vault/utils/form.dart' as formClass;

class ViewRecordForm extends StatefulWidget {
  final formClass.Form form;
  const ViewRecordForm({Key? key, required this.form}) : super(key: key);
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
              child: TextButton(
                key: const Key("view-record-back-button"),
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
                height: 150.0,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Color(0xff189AB4),
                ),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Container(
                          width: 20.0,
                        ),
                        Icon(
                          Icons.donut_large_rounded,
                          color: Colors.white,
                          size: 90.0,
                        ),
                        Container(
                          width: 20.0,
                        ),
                        Text(
                          nameShortener(widget.form.formDetails["serviceName"]),
                          key: const Key("view-form-title"),
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ))),
            Container(
              height: 40.0,
            ),
            Container(
                width: 325.0,
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
                        "username",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),

                    Row(
                      children: [
                        Container(
                            margin: EdgeInsets.fromLTRB(25, 0, 0, 15),
                            padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                            width: 210,
                            height: 60,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(23, 42, 58, 1.0),
                                border:
                                    Border.all(color: Colors.white, width: 3),
                                borderRadius: BorderRadius.circular(25.0)),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                widget.form.formDetails["username"],
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
                                    text: widget.form.formDetails["username"]))
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
                            width: 210,
                            height: 60,
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
                                    : widget.form.formDetails["password"],
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
                                      text:
                                          widget.form.formDetails["password"]))
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
                          width: 210,
                          height: 95,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(23, 42, 58, 1.0),
                              border: Border.all(color: Colors.white, width: 3),
                              borderRadius: BorderRadius.circular(25.0)),
                          child: SingleChildScrollView(
                              padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  widget.form.formDetails["notes"],
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
                              text: widget.form.formDetails["notes"],
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
                      splashColor: Colors.white, // Splash color
                      onTap: () {},
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
