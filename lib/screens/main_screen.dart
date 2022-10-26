import 'package:flutter/material.dart';
import 'package:true_vault/screens/choose_database_screen.dart';
import 'package:true_vault/screens/create_database_screen.dart';
import 'package:true_vault/screens/delete_database_screen.dart';
import 'package:true_vault/utils/database.dart';

import 'landing_screen.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

List<Database>databases = [];

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    double phoneWidth = MediaQuery.of(context).size.width; //411
    double phoneHeight = MediaQuery.of(context).size.height; //683
    return Scaffold(
        resizeToAvoidBottomInset: false, // set it to false
        backgroundColor: const Color.fromRGBO(23, 42, 58, 1.0),
        body: Center(
            child: Column(
          children: [
            Container(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton(
                  key: const Key("logoutButton"),
                    child: const Text("Logout",
                      style: TextStyle(color:Colors.grey),
                    ),
                    onPressed: ()=>{
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => const LandingScreen()))
                    },
                ),
              ],
            ),
            Container(
                width: phoneWidth/1.265,
                height: phoneHeight/4.55,
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
                          size: phoneWidth/4.56,
                        ),
                      ],
                    ))),

            ////////////
            Container(
              height: 40.0,
            ),
            Container(
              width: phoneWidth/1.417,
              height: phoneHeight/11.383,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                color: Color(0xff189AB4),
              ),
            ),

            Container(
              height: 40.0,
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Container(
                      width: 65.0,
                    ),
                    SizedBox(
                        height: phoneHeight/11.383,
                        width: phoneWidth/1.868,
                        child: TextButton(
                          key: const Key("new-database-button"),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Color(0xff189AB4)),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(
                                          color: Color.fromARGB(
                                              200, 24, 154, 180))))),
                          onPressed: () async{
                            try{
                              Database newDatabaseObject = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CreateDatabase()),
                              ) as Database;
                              setState((){
                                databases.add(newDatabaseObject);
                              });
                            }catch(e){}
                          },
                          child: const Text(
                            'New Database',
                            key: Key("new-database-button-text"),
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        )),
                    Container(
                      width: 20.0,
                    ),
                    ClipOval(
                      child: Material(
                        color: Colors.green, // Button color
                        child: InkWell(
                          key: const Key("new-database-icon-button"),
                          splashColor: Colors.white, // Splash color
                          onTap: () async{
                            try{
                              Database newDatabaseObject = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CreateDatabase()),
                              ) as Database;
                              setState((){
                                databases.add(newDatabaseObject);
                              });
                            }catch(e){}
                          },
                          child: SizedBox(
                              width: 56, height: 56, child: Icon(Icons.add)),
                        ),
                      ),
                    )
                  ],
                )),
            Container(
              height: 35.0,
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Container(
                      width: 65.0,
                    ),
                    SizedBox(
                        height: phoneHeight/11.383,
                        width: phoneWidth/1.868,
                        child: TextButton(
                          key: const Key("choose-database-button"),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Color(0xff189AB4)),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(
                                          color: Color.fromARGB(
                                              200, 24, 154, 180))))),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChooseDatabase(databases: databases,)),
                            );
                          },
                          child: const Text(
                            'Open Database',
                            key: Key("choose-database-button-text"),
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        )),
                    Container(
                      width: 20.0,
                    ),
                    ClipOval(
                      child: Material(
                        color:
                            Color.fromARGB(200, 95, 116, 170), // Button color
                        child: InkWell(
                          key: const Key("choose-database-icon-button"),
                          splashColor: Colors.white, // Splash color
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChooseDatabase(databases: databases,)),
                            );
                          },
                          child: SizedBox(
                              width: 56,
                              height: 56,
                              child: Icon(Icons.vpn_key)),
                        ),
                      ),
                    )
                  ],
                )),
            Container(
              height: 35.0,
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Container(
                      width: 65.0,
                    ),
                    SizedBox(
                        height: phoneHeight/11.383,
                        width: phoneWidth/1.868,
                        child: TextButton(
                          key: const Key("delete-database-button"),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Color(0xff189AB4)),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(
                                          color: Color.fromARGB(
                                              200, 24, 154, 180))))),
                          onPressed: () async{
                            try{
                              int indexToDelete = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DeleteDatabase(databases: databases,)),
                              ) as int;
                              setState((){
                                databases.removeAt(indexToDelete);
                              });
                            }catch(e){}
                          },
                          child: const Text(
                            'Delete Database',
                            key: Key("delete-database-button-text"),
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        )),
                    Container(
                      width: 20.0,
                    ),
                    ClipOval(
                      child: Material(
                        color: Colors.red, // Button color
                        child: InkWell(
                          key: const Key("delete-database-icon-button"),
                          splashColor: Colors.white, // Splash color
                          onTap: () async{
                            try{
                              int indexToDelete = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DeleteDatabase(databases: databases,)),
                              ) as int;
                              setState((){
                                databases.removeAt(indexToDelete);
                              });
                            }catch(e){}
                          },
                          child: SizedBox(
                              width: 56, height: 56, child: Icon(Icons.delete)),
                        ),
                      ),
                    )
                  ],
                )),
          ],
        )));
  }
}
