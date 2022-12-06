import 'package:flutter_test/flutter_test.dart';
import 'package:true_vault/screens/choose_database_screen.dart';
import 'package:true_vault/screens/delete_database_screen.dart';
import 'package:true_vault/screens/view_database_screen.dart';
import 'package:true_vault/utils/database.dart';
import 'package:true_vault/utils/form.dart' as formClass;
import 'package:true_vault/utils/encryptor.dart';

void main() {
  String uID = "2LrMteAPf2XoLYUFc8RM2xDh8P02";

  test('Template function creates a button for each database', () {
    List<Database> databases = [];
    Database newDatabase = Database(
      Encryptor.plainTextToCipher("new database", "PASSWORD", uID),
      Encryptor.plainTextToCipher("/", "PASSWORD", uID),
    );

    Database newDatabase1 = Database(
      Encryptor.plainTextToCipher("new database2", "PASSWORD", uID),
      Encryptor.plainTextToCipher("/", "PASSWORD", uID),
    );
    Database newDatabase2 = Database(
      Encryptor.plainTextToCipher("new database3", "PASSWORD", uID),
      Encryptor.plainTextToCipher("/", "PASSWORD", uID),
    );

    databases.add(newDatabase);
    databases.add(newDatabase1);
    databases.add(newDatabase2);
    formClass.Form myForm = formClass.Form([
      Encryptor.plainTextToCipher("Discord", "PASSWORD", uID),
      Encryptor.plainTextToCipher("username", "PASSWORD", uID),
      Encryptor.plainTextToCipher("password", "PASSWORD", uID),
      Encryptor.plainTextToCipher("notes", "PASSWORD", uID),
      Encryptor.plainTextToCipher("discord.com", "PASSWORD", uID),
      Encryptor.plainTextToCipher("icon.jpeg", "PASSWORD", uID),
    ], " ");

    final chooseButtons = [];
    chooseButtons.add(chooseDatabaseTemplate(databases[0], 0, 0, "PASSWORD", uID));
    chooseButtons.add(chooseDatabaseTemplate(databases[1], 1, 0, "PASSWORD", uID));
    chooseButtons.add(chooseDatabaseTemplate(databases[2], 2, 0, "PASSWORD", uID));

    final deleteButtons = databases
        .map((database) => deleteDatabaseTemplate(database, 0, 0, "PASSWORD", "",uID))
        .toList();

    final recordButtons = databases
        .map((database) => viewDatabaseTemplate(myForm, 0, 0, database,"PASSWORD", uID))
        .toList();

    expect(chooseButtons.length, 3);
    expect(deleteButtons.length, 3);
    expect(recordButtons.length, 3);
  });
}
