import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:true_vault/screens/choose_database_screen.dart';
import 'package:true_vault/screens/delete_database_screen.dart';
import 'package:true_vault/screens/view_database_screen.dart';
import 'package:true_vault/utils/database.dart';

void main() {
  test('Template function creates a button for each database', () {
    List<Database> databases = [];
    Database newDatabase = Database("new database1", "/", "SECURE_PASSWORD123");
    Database newDatabase1 =
        Database("new database2", "/", "SECURE_PASSWORD123");
    Database newDatabase2 =
        Database("new database3", "/", "SECURE_PASSWORD123");
    databases.add(newDatabase);
    databases.add(newDatabase1);
    databases.add(newDatabase2);

    //final chooseButtons = databases.map((database) => chooseDatabaseTemplate(database)).toList();
    final chooseButtons = [];
    chooseButtons.add(chooseDatabaseTemplate(databases[0], 0, 0));
    chooseButtons.add(chooseDatabaseTemplate(databases[1], 1, 0));
    chooseButtons.add(chooseDatabaseTemplate(databases[2], 2, 0));

    final deleteButtons = databases
        .map((database) => deleteDatabaseTemplate(database, 0, 0))
        .toList();

    final recordButtons = databases
        .map((database) => viewDatabaseTemplate("database", 0, 0))
        .toList();

    expect(chooseButtons.length, 3);
    expect(deleteButtons.length, 3);
    expect(recordButtons.length, 3);
  });
}
