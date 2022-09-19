import 'package:flutter/material.dart';
import 'package:true_vault/screens/main_screen.dart';


class ChooseDatabase extends StatefulWidget {
  const ChooseDatabase({Key? key}) : super(key: key);

  @override
  State<ChooseDatabase> createState() => _ChooseDatabaseState();
}

//Mock Database for now while we make data dynamic
List databases = ["Database 1","Database 2","Database 3","Database 4","Database 5","Database 6","Database 7"];

//Template to list over the databases
Widget chooseDatabaseTemplate(database){
  //Individual Database Buttons
  return Padding(
    padding: const EdgeInsets.fromLTRB(8, 3, 8, 10),
    child: AspectRatio(
      aspectRatio: 16/4,
      child: TextButton(
          onPressed: ()=>{
          },
          style: TextButton.styleFrom(
            backgroundColor: const Color.fromRGBO(24, 154, 180, 1),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          child: Text(database,style: const TextStyle(color: Colors.white, fontSize: 20),)
      ),
    ),
  );
}

class _ChooseDatabaseState extends State<ChooseDatabase> {

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(23, 42, 58, 1.0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                height: height-75,
                width: width-75,
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TextButton(
                            key: const Key("chooseDatabaseCancelButton"),
                            onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MainScreen()),
                              );
                            },
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
                        padding: const EdgeInsets.fromLTRB(25,25,25,5),
                        child: AspectRatio(
                          aspectRatio: 15/5,
                          child: Container(
                            decoration: const BoxDecoration(
                              color:Color.fromRGBO(95, 116, 170, 1),
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                            ),
                            child: const Center(
                              child: Text("Choose a database\nto open",
                                style: TextStyle(fontSize: 20,color:Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                          child: SizedBox(
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: databases.length,
                              itemBuilder: (BuildContext test, int index){
                                return chooseDatabaseTemplate(databases[index]);
                              },
                            )
                          )
                      ),
                    ],
                  ),
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(239, 239, 239, 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  )
                ),
              ),
            )
          ],
        ),
      )

    );
  }
}
