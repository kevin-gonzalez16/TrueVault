import 'package:true_vault/utils/form.dart';

class Database{

  //class variables
  String databaseName;
  String databaseID;
  List <Form> forms = [];

  //constructor
  Database(this.databaseName, this.databaseID);

  //adders and setters
  void addForm(Form newForm){forms.add(newForm);}
  void removeForm(int index){forms.removeAt(index);}
  void renameDB(String newName){databaseName = newName;}

}