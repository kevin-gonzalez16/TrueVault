import 'package:flutter/material.dart';
import 'package:true_vault/utils/passwordGenerator.dart';

List<String> makeComposedCharacters(List<bool>vars){
  List<String>composedCharacters = [];

  if(vars[0]) composedCharacters.add("upper");
  if(vars[1]) composedCharacters.add("lower");
  if(vars[2]) composedCharacters.add("digit");
  if(vars[3]) composedCharacters.add("space");
  if(vars[4]) composedCharacters.add("special");

  return composedCharacters;
}

Future<String> generatePasswordDialog(BuildContext context) async {
  TextEditingController sizeController = TextEditingController();
  TextEditingController includeController = TextEditingController();
  TextEditingController ignoreController = TextEditingController();
  int _value = 15;
  sizeController.text = _value.toString();
  bool upper = true;
  bool lower = true;
  bool digit = true;
  bool space = false;
  bool special = true;
  String password = generatePassword(_value.round(), [], [],
      makeComposedCharacters([upper,lower,digit,space,special]
      ));
  bool obscureText = true;
  return await showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            backgroundColor: const Color(0xff189AB4),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
            ),
            content: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Form(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                              width: 210,
                              height: 60,
                              decoration: BoxDecoration(
                                  color: const Color.fromRGBO(23, 42, 58, 1.0),
                                  border:
                                  Border.all(color: Colors.white, width: 3),
                                  borderRadius: BorderRadius.circular(25.0)),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text (
                                  obscureText == true
                                      ? password.replaceAll(RegExp(r"."), "*")
                                      : password,
                                  style: const TextStyle(
                                      fontSize: 18, color: Colors.white),
                                  key: const Key("generated-password-text"),
                                ),
                              )),
                          Expanded(
                            child: IconButton(
                              key: const Key("password-generator-eye-button"),
                              icon: const Icon(Icons.remove_red_eye_outlined,
                                  color: Colors.black),
                              onPressed: () {
                                setState(() {
                                  obscureText = !obscureText;
                                });
                              },
                            ),
                          ),
                          Expanded(
                            child: IconButton(
                              icon: const Icon(Icons.sync,
                                  color: Colors.black),
                              onPressed: ()  {
                                setState((){
                                  password = generatePassword(_value.round(),
                                      ignoreController.text.split(" "),
                                      includeController.text.split(" "),
                                      makeComposedCharacters(
                                          [upper,lower,digit,space,special]
                                      ));
                                });
                              },
                            ),
                          ),
                        ],
                      ),

                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Slider(
                              min: 5,
                              max: 65,
                              activeColor: Colors.black,
                              thumbColor: Colors.grey,
                              inactiveColor: Colors.grey,
                              value: _value.toDouble(),
                              onChanged: (value) {
                                setState((){
                                  _value = value.toInt();
                                  sizeController.text = _value.toString();
                                  password = generatePassword(_value.round(),
                                      ignoreController.text.split(" "),
                                      includeController.text.split(" "),
                                      makeComposedCharacters(
                                          [upper,lower,digit,space,special]
                                      ));
                                });
                              },
                            ),
                            SizedBox(
                              width: 45,
                              height: 45,
                              child: TextField(
                                controller: sizeController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  enabledBorder: const OutlineInputBorder(borderSide: BorderSide(width: 3)),
                                  focusedBorder: const OutlineInputBorder(borderSide: BorderSide(width: 3)),
                                  hintText: sizeController.text,
                                ),
                                onSubmitted: (value){

                                  int newValue = int.parse(value) < 5 ? 5 : int.parse(value);
                                  newValue = newValue > 65 ? 65 : newValue;

                                  setState((){
                                    _value = newValue;
                                    sizeController.text = _value.toString();
                                    password = generatePassword(_value.round(),
                                        ignoreController.text.split(" "),
                                        includeController.text.split(" "),
                                        makeComposedCharacters(
                                            [upper,lower,digit,space,special]
                                        ));
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                              onPressed: () {
                                setState((){
                                  upper = !upper;
                                  password = generatePassword(_value.round(),
                                      ignoreController.text.split(" "),
                                      includeController.text.split(" "),
                                      makeComposedCharacters(
                                          [upper,lower,digit,space,special]
                                      ));
                                });
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: upper ? Colors.grey : Colors.white,
                                shape:
                                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),
                                    side: const BorderSide(width: 3, color:Colors.black)),
                              ),
                              child: const Text(
                                "A-Z",
                                style: TextStyle(color: Colors.black, fontSize: 15),
                              )
                          ),

                          TextButton(
                              onPressed: () {
                                setState((){
                                  lower = !lower;
                                  password = generatePassword(_value.round(),
                                      ignoreController.text.split(" "),
                                      includeController.text.split(" "),
                                      makeComposedCharacters(
                                          [upper,lower,digit,space,special]
                                      ));
                                });
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: lower ? Colors.grey : Colors.white,
                                shape:
                                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),
                                    side: const BorderSide(width: 3, color:Colors.black)
                                ),
                              ),
                              child: const Text(
                                "a-z",
                                style: TextStyle(color: Colors.black, fontSize: 15),
                              )
                          ),

                          TextButton(
                              onPressed: () {
                                setState((){
                                  digit = !digit;
                                  password = generatePassword(_value.round(),
                                      ignoreController.text.split(" "),
                                      includeController.text.split(" "),
                                      makeComposedCharacters(
                                          [upper,lower,digit,space,special]
                                      ));
                                });
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: digit ? Colors.grey : Colors.white,
                                shape:
                                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),
                                    side: const BorderSide(width: 3, color:Colors.black)),
                              ),
                              child: const Text(
                                "0-9",
                                style: TextStyle(color: Colors.black, fontSize: 15),
                              )
                          ),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                              onPressed: () {
                                setState((){
                                  space = !space;
                                  password = generatePassword(_value.round(),
                                      ignoreController.text.split(" "),
                                      includeController.text.split(" "),
                                      makeComposedCharacters(
                                          [upper,lower,digit,space,special]
                                      ));
                                });
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: space ? Colors.grey : Colors.white,
                                shape:
                                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),
                                    side: const BorderSide(width: 3, color:Colors.black)),
                              ),
                              child: const Text(
                                "Space",
                                style: TextStyle(color: Colors.black, fontSize: 15),
                              )
                          ),

                          TextButton(
                              onPressed: () {
                                setState((){
                                  special = !special;
                                  password = generatePassword(_value.round(),
                                      ignoreController.text.split(" "),
                                      includeController.text.split(" "),
                                      makeComposedCharacters(
                                          [upper,lower,digit,space,special]
                                      ));
                                });
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: special ? Colors.grey : Colors.white,
                                shape:
                                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),
                                    side: const BorderSide(width: 3, color:Colors.black)),
                              ),
                              child: const Text(
                                "Special",
                                style: TextStyle(color: Colors.black, fontSize: 15),
                              )
                          ),
                        ],
                      ),

                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextField(
                          controller: includeController,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromRGBO(23, 42, 58, 1.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              const BorderSide(width: 3, color: Colors.white),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              const BorderSide(width: 3, color: Colors.white),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            hintText: 'Include',
                            hintStyle:
                            const TextStyle(fontSize: 18, color: Colors.white),
                          ),
                          onSubmitted: (value){
                            setState((){
                              password = generatePassword(_value.round(),
                                  ignoreController.text.split(" "),
                                  includeController.text.split(" "),
                                  makeComposedCharacters(
                                      [upper,lower,digit,space,special]
                                  ));
                            });
                          },
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextField(
                          controller: ignoreController,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromRGBO(23, 42, 58, 1.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              const BorderSide(width: 3, color: Colors.white),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              const BorderSide(width: 3, color: Colors.white),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            hintText: 'Ignore',
                            hintStyle:
                            const TextStyle(fontSize: 18, color: Colors.white),
                          ),
                          onSubmitted: (value){
                            setState((){
                              password = generatePassword(_value.round(),
                                  ignoreController.text.split(" "),
                                  includeController.text.split(" "),
                                  makeComposedCharacters(
                                      [upper,lower,digit,space,special]
                                  ));
                            });
                          },
                        ),
                      ),
                    ],
                  )),
            ),
            title: const Text('Password Generator'),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipOval(
                    child: Material(
                      color: const Color(0xff189AB4), // Button color
                      child: InkWell(
                        key: const Key("password-generator-done-button"),
                        splashColor: Colors.white, // Splash color
                        onTap: ()  {
                          Navigator.pop(context,password);
                        },
                        child: const SizedBox(
                            width: 56,
                            height: 56,
                            child: Icon(Icons.check_circle_outline,
                                size: 35, color: Colors.black)
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        });
      });
}