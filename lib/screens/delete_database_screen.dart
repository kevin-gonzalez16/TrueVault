import 'package:flutter/material.dart';

class DeleteDatabase extends StatefulWidget {
  const DeleteDatabase({Key? key}) : super(key: key);

  @override
  State<DeleteDatabase> createState() => _DeleteDatabaseState();
}

//Mock Database for now while we make data dynamic
List databases = ["Database 1","Database 2","Database 3","Database 4","Database 5","Database 6","Database 7"];

//Template to list over the database
Widget deleteDatabaseTemplate(database){
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 0, 8, 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(onPressed: ()=>{},
            style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.fromLTRB(5,5,5,5),
                primary: const Color.fromRGBO(255, 117, 117, 1)
            ), child: const Icon(Icons.delete, color:Colors.white)
        ),
        TextButton(
            onPressed: ()=>{},
            style: TextButton.styleFrom(
              backgroundColor: const Color.fromRGBO(24, 154, 180, 1),
              minimumSize: const Size(250,50),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            child:  Text(database,style: const TextStyle(color: Colors.white, fontSize: 25),)
        ),
      ],
    ),
  );
}

class _DeleteDatabaseState extends State<DeleteDatabase> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(23, 42, 58, 1.0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 625,
              width: 325,
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
                            onPressed: ()=>{Navigator.pushReplacementNamed(context, "main_screen")},
                            style: TextButton.styleFrom(
                              primary: const Color.fromRGBO(165, 165, 165, 1),
                            ),
                            child: const Text("cancel",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 5, 30, 25),
                        child: SizedBox(
                          height: 100,
                          width: 275,
                          child: Container(
                            decoration: const BoxDecoration(
                              color:Color.fromRGBO(255, 94, 94, 1),
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                            ),
                            child: const Center(
                              child: Text("WARNING!\nDeleting the database will permanently remove all the\nrecords!",
                                style: TextStyle(fontSize: 20,color:Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 400,
                        child:ListView(children: databases.map((database) => deleteDatabaseTemplate(database)).toList(),),
                      ),

                    ],
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}