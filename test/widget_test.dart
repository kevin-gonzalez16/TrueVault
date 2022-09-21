// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:true_vault/screens/choose_database_screen.dart';
import 'package:true_vault/screens/delete_database_screen.dart';
import 'package:true_vault/screens/login_screen.dart';
import 'package:true_vault/screens/register_screen.dart';
import 'package:true_vault/screens/splash_screen.dart';

void main() {

  testWidgets("Cancel button in Choose Database returns to main screen", (WidgetTester tester) async{
    await tester.pumpWidget(const MaterialApp(home:ChooseDatabase()));
    expect(find.text("cancel"), findsOneWidget);
    expect(find.text("New Database"), findsNothing);

    await tester.tap(find.byKey(const Key("chooseDatabaseCancelButton")));
    await tester.pumpAndSettle();

    expect(find.text("New Database"), findsOneWidget);

  });

  testWidgets("Cancel button in Delete Database returns to main screen", (WidgetTester tester) async{

    await tester.pumpWidget(const MaterialApp(home:DeleteDatabase()));
    expect(find.text("cancel"), findsOneWidget);
    expect(find.text("New Database"), findsNothing);

    await tester.tap(find.byKey(const Key("deleteDatabaseCancelButton")));
    await tester.pumpAndSettle();

    expect(find.text("New Database"), findsOneWidget);

  });

  testWidgets("Correct password redirects you to the main screen", (WidgetTester tester) async{

    await tester.pumpWidget(const MaterialApp(home:LoginScreen()));
    expect(find.text("Master Password"), findsOneWidget);

    await tester.enterText(find.byType(TextField), "PASSWORD");
    await tester.tap(find.byType(RaisedButton));

    await tester.pumpAndSettle();

    expect(find.text("New Database"), findsOneWidget);
    expect(find.text("Open Database"), findsOneWidget);
    expect(find.text("Delete Database"), findsOneWidget);

  });

  testWidgets("Incorrect password keeps you in the login screen", (WidgetTester tester) async{

    await tester.pumpWidget(const MaterialApp(home:LoginScreen()));
    expect(find.text("Master Password"), findsOneWidget);

    await tester.enterText(find.byType(TextField), "NOT_PASSWORD");
    await tester.tap(find.byType(RaisedButton));

    await tester.pumpAndSettle();

    expect(find.text("New Database"), findsNothing);
    expect(find.text("Open Database"), findsNothing);
    expect(find.text("Delete Database"), findsNothing);

  });
}
