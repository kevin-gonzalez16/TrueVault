import 'package:flutter/material.dart';
import 'package:true_vault/screens/choose_database_screen.dart';
import 'package:true_vault/screens/main_screen.dart';
import 'package:true_vault/utils/database.dart';

class CreateDatabase extends StatefulWidget {
  const CreateDatabase({Key? key}) : super(key: key);

  @override
  State<CreateDatabase> createState() => _CreateDatabase();
}

class _CreateDatabase extends State<CreateDatabase> {
  TextEditingController databaseNameController = TextEditingController();
  TextEditingController databaseLocationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false, // set it to false

      backgroundColor: const Color.fromRGBO(23, 42, 58, 1.0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: height - 75,
              width: width - 75,
              child: Container(
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(239, 239, 239, 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TextButton(
                            key: const Key("newDatabaseCancelButton"),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const MainScreen()));
                            },
                            style: TextButton.styleFrom(
                              primary: const Color.fromRGBO(165, 165, 165, 1),
                            ),
                            child: const Text(
                              "cancel",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 5, 30, 25),
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          runSpacing: 100,
                          children: [
                            //  SizedBox(height: 40),
                            TextField(
                              key:const Key("newDatabaseNameTextField"),
                              controller: databaseNameController,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Color(0xffC9C9C9),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 3, color: Color(0xffC9C9C9)),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                hintText: 'Database Name',
                                hintStyle: TextStyle(
                                    fontSize: 18, color: Color(0xff989898)),
                              ),
                            ),
                            // SizedBox(height: 50),
                            TextField(
                              key:const Key("newDatabaseLocationTextField"),
                              controller: databaseLocationController,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Color(0xffC9C9C9),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 3, color: Color(0xffC9C9C9)),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                hintText: 'Database Location',
                                hintStyle: TextStyle(
                                    fontSize: 18, color: Color(0xff989898)),
                              ),
                            ),
                            // SizedBox(height: 180), // give it width
                            SizedBox(
                                height: 80,
                                width: 250,
                                child: TextButton(
                                  key:const Key("createDatabaseButton"),
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(
                                          Color.fromARGB(200, 24, 154, 180)),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                              side: BorderSide(
                                                  color: Color.fromARGB(
                                                      200, 24, 154, 180))))),
                                  onPressed: () {
                                    setState(() {
                                      if(databaseLocationController.text == "" || databaseNameController.text == ""){
                                        //TODO
                                        //Do not allow empty fields
                                      }
                                      else{
                                        Database databaseObj = Database(
                                        databaseNameController.text,
                                            databaseLocationController.text,
                                            "PASSWORD"
                                        );
                                        //TODO
                                        //Redirect the user to the opened database view
                                        Navigator.pop(context,databaseObj);

                                      }
                                    });
                                  },
                                  child: const Text(
                                    'Create Database',
                                    style: TextStyle(
                                        fontSize: 25, color: Colors.white),
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
