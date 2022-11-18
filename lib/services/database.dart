import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:true_vault/utils/database.dart';
import 'package:true_vault/utils/form.dart';

/*
      DATABASE STRUCTURE

      records(root directory)
        >User 1 (It should actually be User's UID, not User 1)
          >Databases(Databases Collections)
            >Database 1(Database documents)
              databaseName: "My own Database" (Database field)
              >Forms (Forms Collections)
                >Form 1 (Form Document)
                  serviceName: "Discord" (Form field)
                  username: "username1"
                  password: "myPassword1"
                  notes: "here are my notes"
                >Form 2
                >Form 3
            >Database 2
            >Database 3
        >User 2
        >User 3
 */

class DatabaseService {
  //unique user ID
  String uid;

  DatabaseService(this.uid);


  //returns the records of a user from its UID
  Future<List<Database>> returnRecords() async {
    List<Database> databases = [];

    //Get the Collection of Databases for the specific user
    final databaseCollection = await
    FirebaseFirestore.instance.collection("records") //Root Directory
        .doc(uid) //Unique User Document
        .collection("Databases").get(); //get all databases

    //Iterate the database collections (all the databases created)
    for (var database in databaseCollection.docs) {
      //first get the database name
      //database.data() returns a map of string keys to dynamic values
      Database newDatabase = Database(database.data()['databaseName'],
      database.id);

      //formsCollection hold all the forms in a specific database
      var formsCollection = await
      FirebaseFirestore.instance.collection("records") //root directory
          .doc(uid) //User Document
          .collection("Databases") //Databases collection
          .doc(database.id) //The current database
          .collection("Forms").get(); //Forms Collection

      //Iterate all the forms in a specific database
      for (var form in formsCollection.docs) {
        //map each form
        Map<String, dynamic> formData = form.data();

        //make a new form object
        Form newForm = Form([
          formData["serviceName"],
          formData["username"],
          formData["password"],
          formData["notes"],
          "url",
          "icon",
        ]);
        //append it to the database
        newDatabase.forms.add(newForm);
      }
      databases.add(newDatabase);
    }
    return databases;
  }

  Future<void> createUserDocument() async {}

  Future<void> addDatabase(String databaseName) async {

    //Get the Collection of Databases for the specific user
    await FirebaseFirestore.instance.collection("records") //Root Directory
        .doc(uid) //Unique User Document
        .collection("Databases") //accessing the Database collections
        .add({"databaseName":databaseName}); //Adding a new DB document
  }

  Future<void> addRecord(String databaseID, List<String>recordInfo) async {

    await FirebaseFirestore.instance.collection("records") //Root Directory
        .doc(uid) //Unique user document
        .collection("Databases") //Accessing the Database collections
        .doc(databaseID) //Access the specific database
        .collection("Forms") //Access the Forms collection for that DB
        .add({ //add the form
          "serviceName":recordInfo[0],
          "username" : recordInfo[1],
          "password" : recordInfo[2],
          "notes" : recordInfo[3]
    });
  }

  Future<void> removeDatabase() async {}

  Future<void> removeRecord() async {}

  Future<void> editRecord() async {}

}