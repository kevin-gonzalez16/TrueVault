import 'package:flutter/material.dart';

Future<bool> DeleteConfirmationScreen(BuildContext context) async {

  return await showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            content: const Text(
              "Are you sure you want to delete this record?",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
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
                    onPressed: () {
                        Navigator.of(context).pop(true);
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
