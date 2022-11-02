import 'package:flutter/material.dart';

void emptyInputDialog(BuildContext context, String errors) async {
  return await showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            content: Text(
              errors,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.warning_rounded,
                  color: Colors.yellow[600],
                  size: 90.0,
                )
              ],
            ),

            // Text('Empty Fields'),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlatButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: Text(
                      'Ok',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    color: Colors.grey,
                  ),
                ],
              )
            ],
          );
        });
      });
}
