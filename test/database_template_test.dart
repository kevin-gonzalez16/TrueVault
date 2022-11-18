import 'package:flutter_test/flutter_test.dart';
import 'package:true_vault/screens/choose_database_screen.dart';
import 'package:true_vault/screens/delete_database_screen.dart';
import 'package:true_vault/screens/view_database_screen.dart';
import 'package:true_vault/utils/database.dart';
import 'package:true_vault/utils/form.dart' as formClass;
import 'package:true_vault/utils/encryptor.dart';

void main() {
  test('Template function creates a button for each database', () {
    List<Database> databases = [];
    Database newDatabase = Database(
      Encryptor.plainTextToCipher("new database", "PASSWORD"),
      Encryptor.plainTextToCipher("/", "PASSWORD"),
    );

    Database newDatabase1 = Database(
      Encryptor.plainTextToCipher("new database2", "PASSWORD"),
      Encryptor.plainTextToCipher("/", "PASSWORD"),
    );
    Database newDatabase2 = Database(
      Encryptor.plainTextToCipher("new database3", "PASSWORD"),
      Encryptor.plainTextToCipher("/", "PASSWORD"),
    );

    databases.add(newDatabase);
    databases.add(newDatabase1);
    databases.add(newDatabase2);
    formClass.Form myForm = formClass.Form([
      Encryptor.plainTextToCipher("Discord", "PASSWORD"),
      Encryptor.plainTextToCipher("username", "PASSWORD"),
      Encryptor.plainTextToCipher("password", "PASSWORD"),
      Encryptor.plainTextToCipher("notes", "PASSWORD"),
      Encryptor.plainTextToCipher("discord.com", "PASSWORD"),
      Encryptor.plainTextToCipher("icon.jpeg", "PASSWORD"),
    ]);

    final chooseButtons = [];
    chooseButtons.add(chooseDatabaseTemplate(databases[0], 0, 0));
    chooseButtons.add(chooseDatabaseTemplate(databases[1], 1, 0));
    chooseButtons.add(chooseDatabaseTemplate(databases[2], 2, 0));

    final deleteButtons = databases
        .map((database) => deleteDatabaseTemplate(database, 0, 0))
        .toList();

    final recordButtons = databases
        .map((database) => viewDatabaseTemplate(myForm, 0, 0, database))
        .toList();

    expect(chooseButtons.length, 3);
    expect(deleteButtons.length, 3);
    expect(recordButtons.length, 3);
  });
}
