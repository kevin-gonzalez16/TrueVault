import 'package:flutter_test/flutter_test.dart';
import 'package:true_vault/utils/database.dart';
import 'package:true_vault/utils/form.dart';
import 'package:true_vault/utils/encryptor.dart';

void main(){
  String uID = "2LrMteAPf2XoLYUFc8RM2xDh8P02";

  test("Database should be created correctly", (){
    Database newDatabase = Database(
        Encryptor.plainTextToCipher("new database", "PASSWORD", uID),
        Encryptor.plainTextToCipher("DATABASE ID", "PASSWORD", uID),
    );

    expect(Encryptor.cipherToPlainText(newDatabase.databaseName, "PASSWORD", uID), "new database");
    expect(Encryptor.cipherToPlainText(newDatabase.databaseID, "PASSWORD", uID), "DATABASE ID");
    expect(newDatabase.forms.length, 0);
  });

  test("Database adds a form correctly to the end", (){

    Database newDatabase = Database(
      Encryptor.plainTextToCipher("new database", "PASSWORD", uID),
      Encryptor.plainTextToCipher("/", "PASSWORD", uID),
    );
    expect(newDatabase.forms.length, 0);

    newDatabase.addForm(Form([
      Encryptor.plainTextToCipher("Discord", "PASSWORD", uID),
      Encryptor.plainTextToCipher("username", "PASSWORD", uID),
      Encryptor.plainTextToCipher("password", "PASSWORD", uID),
      Encryptor.plainTextToCipher("notes", "PASSWORD", uID),
      Encryptor.plainTextToCipher("discord.com", "PASSWORD", uID),
      Encryptor.plainTextToCipher("icon.jpeg", "PASSWORD", uID),
    ], " "));

    expect(newDatabase.forms.length, 1);
    Map matcher = {
      "serviceName" : "Discord",
      "username" : "username",
      "password" : "password",
      "notes" : "notes",
      "url" : "discord.com",
      "icon" : "icon.jpeg"
    };
    newDatabase.forms[0].formDetails.forEach((key, value) {
      expect(Encryptor.cipherToPlainText(newDatabase.forms[0].formDetails[key], "PASSWORD", uID), matcher[key]);
    });

    newDatabase.addForm(Form([
      Encryptor.plainTextToCipher("Facebook", "PASSWORD", uID),
      Encryptor.plainTextToCipher("username1", "PASSWORD", uID),
      Encryptor.plainTextToCipher("password123", "PASSWORD", uID),
      Encryptor.plainTextToCipher("new account", "PASSWORD", uID),
      Encryptor.plainTextToCipher("facebook.com", "PASSWORD", uID),
      Encryptor.plainTextToCipher("facebook.jpeg", "PASSWORD", uID),
    ], " "));

    expect(newDatabase.forms.length, 2);
    matcher = {
      "serviceName" : "Facebook",
      "username" : "username1",
      "password" : "password123",
      "notes" : "new account",
      "url" : "facebook.com",
      "icon" : "facebook.jpeg"
    };
    newDatabase.forms[1].formDetails.forEach((key, value) {
      expect(Encryptor.cipherToPlainText(newDatabase.forms[1].formDetails[key], "PASSWORD", uID), matcher[key]);
    });
  });

  test("Database removes a form correctly from index", (){

    Database newDatabase = Database(
      Encryptor.plainTextToCipher("new database", "PASSWORD", uID),
      Encryptor.plainTextToCipher("/", "PASSWORD", uID),
    );
    newDatabase.addForm(Form([
      Encryptor.plainTextToCipher("Discord", "PASSWORD", uID),
      Encryptor.plainTextToCipher("username", "PASSWORD", uID),
      Encryptor.plainTextToCipher("password", "PASSWORD", uID),
      Encryptor.plainTextToCipher("notes", "PASSWORD", uID),
      Encryptor.plainTextToCipher("discord.com", "PASSWORD", uID),
      Encryptor.plainTextToCipher("icon.jpeg", "PASSWORD", uID),
    ], " "));
    expect(newDatabase.forms.length, 1);

    newDatabase.addForm(Form([
      Encryptor.plainTextToCipher("Facebook", "PASSWORD", uID),
      Encryptor.plainTextToCipher("username1", "PASSWORD", uID),
      Encryptor.plainTextToCipher("password123", "PASSWORD", uID),
      Encryptor.plainTextToCipher("new account", "PASSWORD", uID),
      Encryptor.plainTextToCipher("facebook.com", "PASSWORD", uID),
      Encryptor.plainTextToCipher("facebook.jpeg", "PASSWORD", uID),
    ], " "));
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
    newDatabase.forms[0].formDetails.forEach((key, value) {
      expect(Encryptor.cipherToPlainText(newDatabase.forms[0].formDetails[key], "PASSWORD", uID), matcher[key]);
    });
    newDatabase.removeForm(0);
    expect(newDatabase.forms.length, 0);

  });

  test("Database can be renamed correctly", (){
    Database newDatabase = Database(
      Encryptor.plainTextToCipher("new database", "PASSWORD", uID),
      Encryptor.plainTextToCipher("/", "PASSWORD", uID),
    );
    expect(Encryptor.cipherToPlainText(newDatabase.databaseName, "PASSWORD", uID), "new database");


    newDatabase.renameDB(Encryptor.plainTextToCipher("newer database", "PASSWORD", uID));
    expect(Encryptor.cipherToPlainText(newDatabase.databaseName, "PASSWORD", uID), "newer database");

    newDatabase.renameDB(Encryptor.plainTextToCipher("newest database", "PASSWORD", uID));
    expect(Encryptor.cipherToPlainText(newDatabase.databaseName, "PASSWORD", uID), "newest database");

  });

}