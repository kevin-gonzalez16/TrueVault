import 'package:flutter/material.dart';
import 'dart:async';

Future<bool> DeleteConfirmationScreen(BuildContext context, password) async {
  String check = "false";

  bool _isVisible = false;
  bool showMessage = false;

  return await showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          recieveResponseFromTimer() {
            setState(() {
              showMessage = false;
            });
          }

          setTimer() {
            var duration = Duration(seconds: 3);
            return Timer(duration, recieveResponseFromTimer);
          }

          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            content: const Text(
              "Are you sure you want to delete this database?",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
              key: Key("deleteConfirmationTextPrompt"),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.cancel_outlined,
                  color: Colors.red,
                  size: 90.0,
                )
              ],
            ),
            // const Text('Database Deletion'),

            actions: <Widget>[
              Container(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  width: 225.0,
                  child: TextField(
                    obscureText: !_isVisible,
                    key: const Key("text-field-database-deletion-password"),
                    onChanged: (text) {
                      check = text;
                    },
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isVisible = !_isVisible;
                          });
                        },
                        icon: _isVisible
                            ? Icon(
                                Icons.visibility,
                                color: Colors.black,
                              )
                            : Icon(Icons.visibility_off, color: Colors.grey),
                      ),
                      filled: true,
                      fillColor: Color(0xffc9c9c9),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 3, color: Color(0xffC9C9C9)),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 3, color: Color(0xffC9C9C9)),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      hintText: 'Enter Password',
                      hintStyle:
                          TextStyle(fontSize: 18, color: Color(0xff989898)),
                      //),
                      //),
                      //border: OutlineInputBorder(),
                      // hintText: 'Enter Password',
                    ),
                  ),
                ),
              ),
              Container(
                height: 10.0,
              ),
              (showMessage)
                  ? Center(
                      child: Text(
                      'Incorrect password',
                      style: TextStyle(fontSize: 15, color: Colors.red),

                      //   key: Key("incorrect-login-text-message"),
                    ))
                  : Text(""),
              Container(
                height: 30.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlatButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    color: Colors.grey,
                  ),
                  FlatButton(
                    key: Key("DeleteConfirmationButton"),
                    onPressed: () {
                      if (check == password) {
                        Navigator.of(context).pop(true);
                      } else {
                        //display incorrect password message
                        setState(() {
                          showMessage = true;
                          setTimer();
                        });
                      }
                    },
                    child: Text(
                      'Delete',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w700),
                    ),
                    color: Colors.red[300],
                  ),
                ],
              )
            ],
          );
        });
      });
}
