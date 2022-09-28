// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('TrueVault App Setup', () {
    // First, define the Finders and use them to locate widgets from the
    // test suite. Note: the Strings provided to the `byValueKey` method must
    // be the same as the Strings we used for the Keys.
    final loginScreenButton = find.byValueKey('login-screen-button');
    final loginTextField = find.byValueKey('login-text-field');

    final registerLoginButton = find.byValueKey('register-screen-button');

    final newDatabaseButton = find.byValueKey('new-database-button');
    final chooseDatabaseButton = find.byValueKey('choose-database-button');
    final deleteDatabaseButton = find.byValueKey('delete-database-button');

    final newDatabaseButtonText = find.byValueKey('new-database-button-text');
    final chooseDatabaseButtonText =
        find.byValueKey('choose-database-button-text');
    final deleteDatabaseButtonText =
        find.byValueKey('delete-database-button-text');

    final newDatabaseIconButton = find.byValueKey('new-database-icon-button');
    final chooseDatabaseIconButton =
        find.byValueKey('choose-database-icon-button');
    final deleteDatabaseIconButton =
        find.byValueKey('delete-database-icon-button');

    final newDatabaseNameTextField = find.byValueKey('newDatabaseNameTextField');
    final newDatabaseLocationTextField = find.byValueKey('newDatabaseLocationTextField');
    final createDatabaseButton = find.byValueKey('createDatabaseButton');

    final chooseDatabaseCancelButton =
        find.byValueKey('chooseDatabaseCancelButton');
    final deleteDatabaseCancelButton =
        find.byValueKey('deleteDatabaseCancelButton');
    final newDatabaseCancelButton = find.byValueKey('newDatabaseCancelButton');

    final splashScreenTextFinder = find.byValueKey('splash-screen');

    final registerTextField1 = find.byValueKey('register-text-field-1');
    final registerTextField2 = find.byValueKey('register-text-field-2');

    late FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });
    group('Happy Paths', () {
      test('splash screen works', () async {
        expect(await driver.getText(splashScreenTextFinder), "TrueVault");
      });

      test('register password works', () async {
        //not actually testing a created password yet

        await driver.tap(registerTextField1);
        await driver.enterText("PASSWORD");

        await driver.tap(registerTextField2);
        await driver.enterText("PASSWORD");
        await driver.tap(registerLoginButton);
        expect(await driver.getText(newDatabaseButtonText), "New Database");
      });

      test('new-database button works', () async {
        expect(await driver.getText(newDatabaseButtonText), "New Database");
        await driver.tap(newDatabaseButton);
        //Testing actual database creation
        await driver.tap(newDatabaseNameTextField);
        await driver.enterText("New Database Name");
        await driver.tap(newDatabaseLocationTextField);
        await driver.enterText("New Database Location");
        await driver.tap(createDatabaseButton);
        expect(await driver.getText(newDatabaseButtonText), "New Database");
        await driver.tap(newDatabaseButton);
        //
        await driver.tap(newDatabaseCancelButton);
        expect(await driver.getText(newDatabaseButtonText), "New Database");
      });
      test('new-database-icon button works', () async {
        expect(await driver.getText(newDatabaseButtonText), "New Database");
        await driver.tap(newDatabaseIconButton);
        //Testing actual database creation
        await driver.tap(newDatabaseNameTextField);
        await driver.enterText("New Database Name 1");
        await driver.tap(newDatabaseLocationTextField);
        await driver.enterText("New Database Location 1");
        await driver.tap(createDatabaseButton);
        expect(await driver.getText(newDatabaseButtonText), "New Database");
        await driver.tap(newDatabaseButton);
        //Testing acutal database creation
        await driver.tap(newDatabaseNameTextField);
        await driver.enterText("New Database Name 2");
        await driver.tap(newDatabaseLocationTextField);
        await driver.enterText("New Database Location 2");
        await driver.tap(createDatabaseButton);
        expect(await driver.getText(newDatabaseButtonText), "New Database");
        await driver.tap(newDatabaseButton);
        //
        await driver.tap(newDatabaseCancelButton);
        expect(await driver.getText(newDatabaseButtonText), "New Database");
      });
      test('open-database button works', () async {
        expect(await driver.getText(chooseDatabaseButtonText), "Open Database");
        await driver.tap(chooseDatabaseButton);
        //Checking for created databases
        final chooseDatabaseButton0 = find.byValueKey('chooseDatabaseButtonText0');
        final chooseDatabaseButton1 = find.byValueKey('chooseDatabaseButtonText1');
        expect(await driver.getText(chooseDatabaseButton0), "New Database Name");
        expect(await driver.getText(chooseDatabaseButton1), "New Database Name 1");
        final chooseDatabaseButton2 = find.byValueKey('chooseDatabaseButtonText2');
        expect(await driver.getText(chooseDatabaseButton2), "New Database Name 2");
        //
        await driver.tap(chooseDatabaseCancelButton);
        expect(await driver.getText(chooseDatabaseButtonText), "Open Database");
      });
      test('open-database-icon button works', () async {
        expect(await driver.getText(chooseDatabaseButtonText), "Open Database");
        await driver.tap(chooseDatabaseIconButton);
        await driver.tap(chooseDatabaseCancelButton);
        expect(await driver.getText(chooseDatabaseButtonText), "Open Database");
      });
      test('delete-database button works', () async {
        expect(
            await driver.getText(deleteDatabaseButtonText), "Delete Database");
        await driver.tap(deleteDatabaseButton);
        //Testing for actual database deletion
        final deleteDatabaseElevatedButton1 = find.byValueKey("deleteDatabaseElevatedButton1");
        await driver.tap(deleteDatabaseElevatedButton1);
        expect(
            await driver.getText(deleteDatabaseButtonText), "Delete Database");
        await driver.tap(deleteDatabaseButton);
        final deleteDatabaseText0 = find.byValueKey("deleteDatabaseText0");
        expect(await driver.getText(deleteDatabaseText0), "New Database Name");
        //
        await driver.tap(deleteDatabaseCancelButton);
        expect(
            await driver.getText(deleteDatabaseButtonText), "Delete Database");
      });
      test('delete-database-icon button works', () async {
        expect(
            await driver.getText(deleteDatabaseButtonText), "Delete Database");
        await driver.tap(deleteDatabaseIconButton);
        //Testing for actual database deletion
        final deleteDatabaseElevatedButton0 = find.byValueKey("deleteDatabaseElevatedButton0");
        await driver.tap(deleteDatabaseElevatedButton0);
        expect(
            await driver.getText(deleteDatabaseButtonText), "Delete Database");
        await driver.tap(deleteDatabaseButton);
        final deleteDatabaseText0 = find.byValueKey("deleteDatabaseText0");
        expect(await driver.getText(deleteDatabaseText0), "New Database Name 2");
        //
        await driver.tap(deleteDatabaseCancelButton);
        expect(
            await driver.getText(deleteDatabaseButtonText), "Delete Database");
      });
    });
  });
}
