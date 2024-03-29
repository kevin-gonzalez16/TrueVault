import 'package:flutter/material.dart';
import 'package:true_vault/screens/register_screen.dart';

class RegisterSelectionScreen extends StatefulWidget {
  const RegisterSelectionScreen({Key? key}) : super(key: key);

  @override
  State<RegisterSelectionScreen> createState() =>
      _RegisterSelectionScreenState();
}

class _RegisterSelectionScreenState extends State<RegisterSelectionScreen> {
  TextEditingController emailTextEditingController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailTextEditingController.dispose();
    super.dispose();
  }

  bool validInput = true;

  @override
  Widget build(BuildContext context) {
    double phoneWidth = MediaQuery.of(context).size.width; //411
    double phoneHeight = MediaQuery.of(context).size.height; //683
    return Scaffold(
        resizeToAvoidBottomInset: false, // set it to false
        backgroundColor: const Color.fromRGBO(23, 42, 58, 1.0),
        body: Center(
            child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: Row(
                children: [
                  IconButton(
                    key: const Key("return-button-register-selection-screen"),

                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                    //replace with our own icon data.
                  )
                ],
              ),
            ),
            SizedBox(height: phoneHeight / 7),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  key: const Key("email-text-button-register-selection-screen"),
                  onPressed: () {
                    FocusScope.of(context).requestFocus(FocusNode());

                    setState(() {});
                  },
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                  ),
                  child: const Text(
                    "EMAIL",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 0, 50, 50),
                  child: TextFormField(
                      onChanged: (value) {
                        RegExp validEmail = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                        if (!validEmail.hasMatch(value)) {
                          setState(() {
                            validInput = false;
                          });
                        } else {
                          validInput = true;
                        }
                      },
                      key: const Key(
                          "email-text-field-register-selection-screen"),
                      controller: emailTextEditingController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xffc9c9c9),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 3,
                              color: validInput
                                  ? Color(0xffC9C9C9)
                                  : Colors.redAccent),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 3,
                              color: validInput
                                  ? Color(0xffC9C9C9)
                                  : Colors.redAccent),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        hintText: 'Email Address',
                        hintStyle:
                            TextStyle(fontSize: 18, color: Color(0xff989898)),
                      )),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
              child: AspectRatio(
                  aspectRatio: 9 / 2,
                  child: TextButton(
                    key: const Key("next-button-register-selection-screen"),
                    onPressed: () {
                      RegExp validEmail = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                      if (!validEmail
                          .hasMatch(emailTextEditingController.text)) {
                        setState(() {
                          validInput = false;
                        });
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterScreen(
                                    email: emailTextEditingController)));
                      }
                    },
                    child: const Text(
                      "Next",
                      style: TextStyle(fontSize: 20),
                    ),
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: const Color(0xff189AB4),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                    ),
                  )),
            ),
            //Text("Not a valid test")
          ],
        )));
  }
}
