import 'package:flutter_test/flutter_test.dart';
import 'package:true_vault/utils/database.dart';
import 'package:true_vault/utils/form.dart';

void main(){

  test("Database should be created correctly", (){
    Database newDatabase = Database("new database", "/", "SECURE_PASSWORD123");
    expect(newDatabase.databaseName, "new database");
    expect(newDatabase.databaseLocation, "/");
    expect(newDatabase.databaseMasterPassword, "SECURE_PASSWORD123");
    expect(newDatabase.forms.length, 0);
  });

  test("Database adds a form correctly to the end", (){

    Database newDatabase = Database("new database", "/", "SECURE_PASSWORD123");
    expect(newDatabase.forms.length, 0);

    newDatabase.addForm(Form(["Discord","username","password","notes","discord.com","icon.jpeg"]));
    expect(newDatabase.forms.length, 1);
    Map matcher = {
      "serviceName" : "Discord",
      "username" : "username",
      "password" : "password",
      "notes" : "notes",
      "url" : "discord.com",
      "icon" : "icon.jpeg"
    };
    expect(newDatabase.forms[0].formDetails, matcher);

    newDatabase.addForm(Form(["Facebook","username1","password123","new account","facebook.com","facebook.jpeg"]));
    expect(newDatabase.forms.length, 2);
    matcher = {
      "serviceName" : "Facebook",
      "username" : "username1",
      "password" : "password123",
      "notes" : "new account",
      "url" : "facebook.com",
      "icon" : "facebook.jpeg"
    };
    expect(newDatabase.forms[1].formDetails, matcher);

  });

  test("Database removes a form correctly from index", (){

    Database newDatabase = Database("new database", "/", "SECURE_PASSWORD123");
    newDatabase.addForm(Form(["Discord","username","password","notes","discord.com","icon.jpeg"]));
    expect(newDatabase.forms.length, 1);
    newDatabase.addForm(Form(["Facebook","username1","password123","new account","facebook.com","facebook.jpeg"]));
    expect(newDatabase.forms.length, 2);

    newDatabase.removeForm(0);
    expect(newDatabase.forms.length, 1);
    Map matcher = {
      "serviceName" : "Facebook",
      "username" : "username1",
      "password" : "password123",
      "notes" : "new account",
      "url" : "facebook.com",
      "icon" : "facebook.jpeg"
    };
    expect(newDatabase.forms[0].formDetails, matcher);

    newDatabase.removeForm(0);
    expect(newDatabase.forms.length, 0);

  });

  test("Database can be renamed correctly", (){
    Database newDatabase = Database("new database", "/", "SECURE_PASSWORD123");
    expect(newDatabase.databaseName, "new database");

    newDatabase.renameDB("newer database");
    expect(newDatabase.databaseName, "newer database");

    newDatabase.renameDB("newest database");
    expect(newDatabase.databaseName, "newest database");

  });

  test("Database can be moved correctly", (){
    Database newDatabase = Database("new database", "/", "SECURE_PASSWORD123");
    expect(newDatabase.databaseLocation, "/");

    newDatabase.moveDB("/home/databases/");
    expect(newDatabase.databaseLocation, "/home/databases/");

    newDatabase.moveDB("/home/");
    expect(newDatabase.databaseLocation, "/home/");

  });

  test("Database password can be changed correctly", (){
    Database newDatabase = Database("new database", "/", "SECURE_PASSWORD123");
    expect(newDatabase.databaseMasterPassword, "SECURE_PASSWORD123");

      newDatabase.changeMasterPassword("QWERTY1234");
    expect(newDatabase.databaseMasterPassword, "QWERTY1234");

    newDatabase.changeMasterPassword("MyDogsName+TheStreetIGrewUp");
    expect(newDatabase.databaseMasterPassword, "MyDogsName+TheStreetIGrewUp");

  });
}