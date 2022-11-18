import 'package:true_vault/utils/form.dart';

class Database{

  //class variables
  String databaseName;
  String databaseLocation;
  String databaseMasterPassword;
  List <Form> forms = [];

  //constructor
  Database(this.databaseName, this.databaseLocation, this.databaseMasterPassword);

  //adders and setters
  void addForm(Form newForm){forms.add(newForm);}
  void removeForm(int index){forms.removeAt(index);}
  void renameDB(String newName){databaseName = newName;}
  void moveDB(String newLocation){databaseLocation = newLocation;}
  void changeMasterPassword(String newMasterPassword){databaseMasterPassword = newMasterPassword;}

}