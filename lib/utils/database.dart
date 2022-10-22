import 'package:true_vault/utils/form.dart';
import 'package:encrypt/encrypt.dart';

class Database{

  //class variables
  Encrypted databaseName;
  Encrypted databaseLocation;
  Encrypted databaseMasterPassword;
  List <Form> forms = [];

  //constructor
  Database(this.databaseName, this.databaseLocation, this.databaseMasterPassword);

  //adders and setters
  void addForm(Form newForm){forms.add(newForm);}
  void removeForm(int index){forms.removeAt(index);}
  void renameDB(Encrypted newName){databaseName = newName;}
  void moveDB(Encrypted newLocation){databaseLocation = newLocation;}
  void changeMasterPassword(Encrypted newMasterPassword){databaseMasterPassword = newMasterPassword;}

}