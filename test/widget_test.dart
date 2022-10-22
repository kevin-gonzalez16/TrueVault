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

void main() {
  testWidgets("Logout button takes you to the landing screen",
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: MainScreen()));
    expect(find.text("Logout"), findsOneWidget);
    await tester.tap(find.byKey(const Key("logoutButton")));
    await tester.pumpAndSettle();
    expect(find.text("Register"), findsOneWidget);
    expect(find.text("Login"), findsOneWidget);
  });
  testWidgets("Cancel button in Choose Database returns to main screen",
      (WidgetTester tester) async {
    List<Database> databases = [];
    Database newDatabase = Database(
      Encryptor.plainTextToCipher("new database2", "PASSWORD"),
      Encryptor.plainTextToCipher("/", "PASSWORD"),
      Encryptor.plainTextToCipher("SECURE_PASSWORD123", "PASSWORD"),
    );        databases.add(newDatabase);
    await tester
        .pumpWidget(MaterialApp(home: ChooseDatabase(databases: databases)));
    expect(find.text("cancel"), findsOneWidget);
    expect(find.text("New Database"), findsNothing);

    await tester.tap(find.byKey(const Key("chooseDatabaseCancelButton")));
    await tester.pumpAndSettle();

    expect(find.text("New Database"), findsOneWidget);
  });

  testWidgets("Cancel button in Delete Database returns to main screen",
      (WidgetTester tester) async {
    List<Database> databases = [];
    Database newDatabase = Database(
      Encryptor.plainTextToCipher("new database2", "PASSWORD"),
      Encryptor.plainTextToCipher("/", "PASSWORD"),
      Encryptor.plainTextToCipher("SECURE_PASSWORD123", "PASSWORD"),
    );
    databases.add(newDatabase);
    await tester
        .pumpWidget(MaterialApp(home: DeleteDatabase(databases: databases)));
    expect(find.text("cancel"), findsOneWidget);
    expect(find.text("New Database"), findsNothing);

    await tester.tap(find.byKey(const Key("deleteDatabaseCancelButton")));
    await tester.pumpAndSettle();

    expect(find.text("New Database"), findsOneWidget);
  });

  testWidgets("Cancel button in Create Database returns to main screen",
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: CreateDatabase()));
    expect(find.text("cancel"), findsOneWidget);
    expect(find.text("New Database"), findsNothing);

    await tester.tap(find.byKey(const Key("newDatabaseCancelButton")));
    await tester.pumpAndSettle();

    expect(find.text("New Database"), findsOneWidget);
  });

  testWidgets("Correct password redirects you to the main screen",
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: LoginScreen()));
    expect(find.text("Master Password"), findsOneWidget);

    await tester.enterText(find.byType(TextField), "PASSWORD");
    await tester.tap(find.byType(RaisedButton));

    await tester.pumpAndSettle();

    expect(find.text("New Database"), findsOneWidget);
    expect(find.text("Open Database"), findsOneWidget);
    expect(find.text("Delete Database"), findsOneWidget);
  });

  testWidgets("Incorrect password keeps you in the login screen",
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: LoginScreen()));
    expect(find.text("Master Password"), findsOneWidget);

    await tester.enterText(find.byType(TextField), "NOT_PASSWORD");
    await tester.tap(find.byType(RaisedButton));

    await tester.pumpAndSettle();

    expect(find.text("New Database"), findsNothing);
    expect(find.text("Open Database"), findsNothing);
    expect(find.text("Delete Database"), findsNothing);
  });

  testWidgets("Landing screen Login button takes to Login screen",
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: LandingScreen()));
    expect(find.text("Register"), findsOneWidget);
    expect(find.text("Login"), findsOneWidget);

    await tester.tap(find.byKey(const Key("landingScreenLoginButton")));

    await tester.pumpAndSettle();
    expect(find.text("Master Password"), findsOneWidget);
  });
}
