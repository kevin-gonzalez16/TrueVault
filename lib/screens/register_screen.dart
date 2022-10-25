import 'package:flutter/material.dart';
import 'package:true_vault/screens/main_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController createMasterPasswordTextEditingController =
      TextEditingController();

  TextEditingController confirmMasterPasswordTextEditingController =
      TextEditingController();

  bool _isVisible = false;
  bool _isPassword8Characters = false;
  bool _hasPassword1Number = false;
  bool _hasPassword1SpecialCharacter = false;
  bool _hasPassword1UppercaseCharacter = false;
  bool _hasPassword1LowercaseCharacter = false;
  bool match = true;
  bool _match = true;
  bool _isEmpty = true;
  bool empty = false;
  bool isValidPassword = false;
  bool notValid = true;

  onPasswordChanged(String password) {
    final numericRegex = RegExp(r'[0-9]');
    final specialRegex = RegExp(r'[!@#\$&*~]');
    final lowerCaseRegex = RegExp(r'[a-z]');
    final upperCaseRegex = RegExp(r'[A-Z]');

    setState(() {
      password.length > 0 ? _isEmpty = false : _isEmpty = true;
      //log(_isEmpty.toString());

      _isPassword8Characters = false;
      if (password.length >= 8) _isPassword8Characters = true;

      _hasPassword1Number = false;
      if (numericRegex.hasMatch(password)) _hasPassword1Number = true;

      _hasPassword1SpecialCharacter = false;
      if (specialRegex.hasMatch(password)) _hasPassword1SpecialCharacter = true;

      _hasPassword1LowercaseCharacter = false;
      if (lowerCaseRegex.hasMatch(password))
        _hasPassword1LowercaseCharacter = true;

      _hasPassword1UppercaseCharacter = false;
      if (upperCaseRegex.hasMatch(password))
        _hasPassword1UppercaseCharacter = true;

      _match = createMasterPasswordTextEditingController.text ==
          confirmMasterPasswordTextEditingController.text;

      isValidPassword = _isPassword8Characters &&
          _hasPassword1Number &&
          _hasPassword1SpecialCharacter &&
          _hasPassword1UppercaseCharacter &&
          _hasPassword1LowercaseCharacter;
    });
  }

  @override
  Widget build(BuildContext context) {
    double phoneWidth = MediaQuery.of(context).size.width; //411
    double phoneHeight = MediaQuery.of(context).size.height; //683
    return Scaffold(
        resizeToAvoidBottomInset: false, // set it to false
        backgroundColor: const Color.fromRGBO(23, 42, 58, 1.0),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
                      ],
                    ))),
            Container(
              height: 60.0,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 30.0),
              child: TextField(
                key: const Key("register-text-field-1"),
                controller: createMasterPasswordTextEditingController,
                onChanged: (password) {
                  onPasswordChanged(password);
                  if (!_isEmpty) {
                    if (_match) {
                      match = true;
                    } else {
                      match = false;
                    }
                    if (isValidPassword) {
                      notValid = true;
                    } else if (!isValidPassword) {
                      notValid = false;
                    }

                    empty = false;
                  } else {
                    empty = true;
                  }
                },
                obscureText: !_isVisible,
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
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide:
                          BorderSide(width: 3, color: Color(0xffC9C9C9))),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black)),
                  hintText: "Create Master Password",
                  hintStyle: TextStyle(fontSize: 18, color: Color(0xff989898)),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: TextField(
                key: const Key("register-text-field-2"),
                controller: confirmMasterPasswordTextEditingController,
                onChanged: (password) {
                  onPasswordChanged(password);
                  if (!_isEmpty) {
                    if (_match) {
                      match = true;
                    } else {
                      match = false;
                    }
                    if (isValidPassword) {
                      notValid = true;
                    } else if (!isValidPassword) {
                      notValid = false;
                    }
                    empty = false;
                  } else {
                    empty = true;
                  }
                },
                obscureText: !_isVisible,
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
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide:
                          BorderSide(width: 3, color: Color(0xffC9C9C9))),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide:
                          BorderSide(width: 3, color: Color(0xffC9C9C9))),
                  hintText: "Confirm Master Password",
                  hintStyle: TextStyle(fontSize: 18, color: Color(0xff989898)),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                ),
              ),
            ),
            Text(
              match ? "" : "Password Don't Match",
              style: TextStyle(
                fontSize: 15,
                color: Colors.red,
              ),
            ),
            Text(
              notValid ? "" : "Password does not meet the requirements",
              style: TextStyle(
                fontSize: 15,
                color: Colors.red,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 0, 0, 5),
              child: Row(
                children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    width: 18,
                    height: 18,
                    decoration: BoxDecoration(
                        color: _isPassword8Characters
                            ? Colors.green
                            : Colors.transparent,
                        border: _isPassword8Characters
                            ? Border.all(color: Colors.transparent)
                            : Border.all(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 12,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Contains at least 8 characters",
                      style: TextStyle(color: Color(0xff189AB4)))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 0, 0, 5),
              child: Row(
                children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    width: 18,
                    height: 18,
                    decoration: BoxDecoration(
                        color: _hasPassword1Number
                            ? Colors.green
                            : Colors.transparent,
                        border: _hasPassword1Number
                            ? Border.all(color: Colors.transparent)
                            : Border.all(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 12,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Contains at least 1 number",
                      style: TextStyle(color: Color(0xff189AB4)))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 0, 0, 5),
              child: Row(
                children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    width: 18,
                    height: 18,
                    decoration: BoxDecoration(
                        color: _hasPassword1SpecialCharacter
                            ? Colors.green
                            : Colors.transparent,
                        border: _hasPassword1SpecialCharacter
                            ? Border.all(color: Colors.transparent)
                            : Border.all(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 12,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Contains at least 1 special charcter",
                      style: TextStyle(color: Color(0xff189AB4)))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 0, 0, 5),
              child: Row(
                children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    width: 18,
                    height: 18,
                    decoration: BoxDecoration(
                        color: _hasPassword1UppercaseCharacter
                            ? Colors.green
                            : Colors.transparent,
                        border: _hasPassword1UppercaseCharacter
                            ? Border.all(color: Colors.transparent)
                            : Border.all(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 12,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Contains at least 1 uppercase",
                      style: TextStyle(color: Color(0xff189AB4)))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 0, 0, 0),
              child: Row(
                children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    width: 18,
                    height: 18,
                    decoration: BoxDecoration(
                        color: _hasPassword1LowercaseCharacter
                            ? Colors.green
                            : Colors.transparent,
                        border: _hasPassword1LowercaseCharacter
                            ? Border.all(color: Colors.transparent)
                            : Border.all(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 12,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Contains at least 1 lowercase",
                      style: TextStyle(color: Color(0xff189AB4)))
                ],
              ),
            ),
            Container(
              height: 15.0,
            ),
            RaisedButton(
                key: const Key("register-screen-button"),
                child: Text(
                  'Create Account',
                  style: TextStyle(color: Color(0xff989898)),
                ),
                color: Color(0xff189AB4),
                onPressed: () {
                  setState(() {
                    if (!_isEmpty) {
                      if (_match) {
                        match = true;
                      } else {
                        match = false;
                      }
                      if (isValidPassword) {
                        notValid = true;
                      } else if (!isValidPassword) {
                        notValid = false;
                      }

                      if (isValidPassword && match) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MainScreen()));
                      }
                      empty = false;
                    } else {
                      empty = true;
                    }
                  });
                }),
          ],
        )));
  }
}
