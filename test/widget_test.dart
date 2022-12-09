// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:true_vault/screens/choose_database_screen.dart';
import 'package:true_vault/screens/create_database_screen.dart';
import 'package:true_vault/screens/delete_database_screen.dart';
import 'package:true_vault/screens/landing_screen.dart';
import 'package:true_vault/screens/login_screen.dart';
import 'package:true_vault/screens/main_screen.dart';
import 'package:true_vault/screens/register_screen.dart';
import 'package:true_vault/utils/database.dart';
import 'package:true_vault/utils/encryptor.dart';
import 'package:true_vault/utils/user.dart';
import 'package:true_vault/screens/main_drawer.dart';

void main() {
  String uID = "2LrMteAPf2XoLYUFc8RM2xDh8P02";

  testWidgets("Logout button takes you to the landing screen",
      (WidgetTester tester) async {
    TrueVaultUser test = TrueVaultUser("uID", "email", []);
    await tester.pumpWidget(
        MaterialApp(home: MainScreen(currentUser: test, password: "")));
    expect(find.text("New Database"), findsOneWidget);

    await tester.tap(find.byKey(const Key("MainDrawerKey")));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key("logoutButton")));
    await tester.pumpAndSettle();
    expect(find.text("Register"), findsOneWidget);
    expect(find.text("Login"), findsOneWidget);
  });

  testWidgets("Cancel button in Choose Database returns to main screen",
      (WidgetTester tester) async {
    TrueVaultUser test = TrueVaultUser("uID", "email", []);
    List<Database> databases = [];
    Database newDatabase = Database(
      Encryptor.plainTextToCipher("new database2", "PASSWORD", uID),
      Encryptor.plainTextToCipher("/", "PASSWORD", uID),
    );
    databases.add(newDatabase);
    await tester.pumpWidget(MaterialApp(
        home: ChooseDatabase(currentUser: test, password: "PASSWORD")));
    expect(find.text("cancel"), findsOneWidget);
    expect(find.text("New Database"), findsNothing);

    await tester.tap(find.byKey(const Key("chooseDatabaseCancelButton")));
    await tester.pumpAndSettle();

    expect(find.text("New Database"), findsOneWidget);
  });

  testWidgets("Cancel button in Delete Database returns to main screen",
      (WidgetTester tester) async {
    TrueVaultUser test = TrueVaultUser("uID", "email", []);
    List<Database> databases = [];
    Database newDatabase = Database(
      Encryptor.plainTextToCipher("new database2", "PASSWORD", uID),
      Encryptor.plainTextToCipher("/", "PASSWORD", uID),
    );
    databases.add(newDatabase);
    await tester.pumpWidget(MaterialApp(
        home: DeleteDatabase(currentUser: test, password: "PASSWORD")));
    expect(find.text("cancel"), findsOneWidget);
    expect(find.text("New Database"), findsNothing);

    await tester.tap(find.byKey(const Key("deleteDatabaseCancelButton")));
    await tester.pumpAndSettle();

    expect(find.text("New Database"), findsOneWidget);
  });

  testWidgets("Cancel button in Create Database returns to main screen",
      (WidgetTester tester) async {
    TrueVaultUser test = TrueVaultUser("uID", "email", []);
    await tester.pumpWidget(MaterialApp(
        home: CreateDatabase(
      currentUser: test,
      password: "",
    )));
    expect(find.text("cancel"), findsOneWidget);
    expect(find.text("New Database"), findsNothing);

    await tester.tap(find.byKey(const Key("newDatabaseCancelButton")));
    await tester.pumpAndSettle();

    expect(find.text("New Database"), findsOneWidget);
  });
}
