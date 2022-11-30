import 'package:flutter_test/flutter_test.dart';
import 'package:true_vault/utils/database.dart';
import 'package:true_vault/utils/form.dart';
import 'package:true_vault/utils/encryptor.dart';

void main(){

  test("Database should be created correctly", (){
    Database newDatabase = Database(
        Encryptor.plainTextToCipher("new database", "PASSWORD"),
        Encryptor.plainTextToCipher("DATABASE ID", "PASSWORD"),
    );

    expect(Encryptor.cipherToPlainText(newDatabase.databaseName, "PASSWORD"), "new database");
    expect(Encryptor.cipherToPlainText(newDatabase.databaseID, "PASSWORD"), "DATABASE ID");
    expect(newDatabase.forms.length, 0);
  });

  test("Database adds a form correctly to the end", (){

    Database newDatabase = Database(
      Encryptor.plainTextToCipher("new database", "PASSWORD"),
      Encryptor.plainTextToCipher("/", "PASSWORD"),
    );
    expect(newDatabase.forms.length, 0);

    newDatabase.addForm(Form([
      Encryptor.plainTextToCipher("Discord", "PASSWORD"),
      Encryptor.plainTextToCipher("username", "PASSWORD"),
      Encryptor.plainTextToCipher("password", "PASSWORD"),
      Encryptor.plainTextToCipher("notes", "PASSWORD"),
      Encryptor.plainTextToCipher("discord.com", "PASSWORD"),
      Encryptor.plainTextToCipher("icon.jpeg", "PASSWORD"),
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
      expect(Encryptor.cipherToPlainText(newDatabase.forms[0].formDetails[key], "PASSWORD"), matcher[key]);
    });

    newDatabase.addForm(Form([
      Encryptor.plainTextToCipher("Facebook", "PASSWORD"),
      Encryptor.plainTextToCipher("username1", "PASSWORD"),
      Encryptor.plainTextToCipher("password123", "PASSWORD"),
      Encryptor.plainTextToCipher("new account", "PASSWORD"),
      Encryptor.plainTextToCipher("facebook.com", "PASSWORD"),
      Encryptor.plainTextToCipher("facebook.jpeg", "PASSWORD"),
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
      expect(Encryptor.cipherToPlainText(newDatabase.forms[1].formDetails[key], "PASSWORD"), matcher[key]);
    });
  });

  test("Database removes a form correctly from index", (){

    Database newDatabase = Database(
      Encryptor.plainTextToCipher("new database", "PASSWORD"),
      Encryptor.plainTextToCipher("/", "PASSWORD"),
    );
    newDatabase.addForm(Form([
      Encryptor.plainTextToCipher("Discord", "PASSWORD"),
      Encryptor.plainTextToCipher("username", "PASSWORD"),
      Encryptor.plainTextToCipher("password", "PASSWORD"),
      Encryptor.plainTextToCipher("notes", "PASSWORD"),
      Encryptor.plainTextToCipher("discord.com", "PASSWORD"),
      Encryptor.plainTextToCipher("icon.jpeg", "PASSWORD"),
    ], " "));
    expect(newDatabase.forms.length, 1);

    newDatabase.addForm(Form([
      Encryptor.plainTextToCipher("Facebook", "PASSWORD"),
      Encryptor.plainTextToCipher("username1", "PASSWORD"),
      Encryptor.plainTextToCipher("password123", "PASSWORD"),
      Encryptor.plainTextToCipher("new account", "PASSWORD"),
      Encryptor.plainTextToCipher("facebook.com", "PASSWORD"),
      Encryptor.plainTextToCipher("facebook.jpeg", "PASSWORD"),
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
      expect(Encryptor.cipherToPlainText(newDatabase.forms[0].formDetails[key], "PASSWORD"), matcher[key]);
    });
    newDatabase.removeForm(0);
    expect(newDatabase.forms.length, 0);

  });

  test("Database can be renamed correctly", (){
    Database newDatabase = Database(
      Encryptor.plainTextToCipher("new database", "PASSWORD"),
      Encryptor.plainTextToCipher("/", "PASSWORD"),
    );
    expect(Encryptor.cipherToPlainText(newDatabase.databaseName, "PASSWORD"), "new database");


    newDatabase.renameDB(Encryptor.plainTextToCipher("newer database", "PASSWORD"));
    expect(Encryptor.cipherToPlainText(newDatabase.databaseName, "PASSWORD"), "newer database");

    newDatabase.renameDB(Encryptor.plainTextToCipher("newest database", "PASSWORD"));
    expect(Encryptor.cipherToPlainText(newDatabase.databaseName, "PASSWORD"), "newest database");

  });

}