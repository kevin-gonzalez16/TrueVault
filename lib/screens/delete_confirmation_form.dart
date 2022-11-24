import 'package:flutter/material.dart';

Future<bool> DeleteConfirmationScreen(BuildContext context, password) async {
  String check = "false";

  return await showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
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
                    key: Key("text-field-database-deletion-password"),
                    onChanged: (text) {
                      check = text;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Password',
                    ),
                  ),
                ),
              ),
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
