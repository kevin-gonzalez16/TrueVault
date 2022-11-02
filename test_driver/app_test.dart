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

    final landingScreenRegisterButton =
        find.byValueKey("landingScreenRegisterButton");
    final landingScreenLoginButton =
        find.byValueKey("landingScreenLoginButton");

    final registerLoginButton = find.byValueKey('register-screen-button');
    final logoutButton = find.byValueKey("logoutButton");
    final landingScreenRegisterButtonText =
        find.byValueKey("landingScreenRegisterButtonText");
    final landingScreenLoginButtonText =
        find.byValueKey("landingScreenLoginButtonText");

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

    final newDatabaseNameTextField =
        find.byValueKey('newDatabaseNameTextField');
    final newDatabaseLocationTextField =
        find.byValueKey('newDatabaseLocationTextField');
    final createDatabaseButton = find.byValueKey('createDatabaseButton');

    final chooseDatabaseCancelButton =
        find.byValueKey('chooseDatabaseCancelButton');
    final deleteDatabaseCancelButton =
        find.byValueKey('deleteDatabaseCancelButton');
    final newDatabaseCancelButton = find.byValueKey('newDatabaseCancelButton');

    final splashScreenTextFinder = find.byValueKey('splash-screen');

    final registerTextField1 = find.byValueKey('register-text-field-1');
    final registerTextField2 = find.byValueKey('register-text-field-2');

    String generatedPasswordTextString = "";

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
        await driver.tap(landingScreenRegisterButton);

        await driver.tap(registerTextField1);
        await driver.enterText("myPASSWORD1!");

        await driver.tap(registerTextField2);
        await driver.enterText("myPASSWORD1!");
        await driver.tap(registerLoginButton);
        expect(await driver.getText(newDatabaseButtonText), "New Database");
      });

      test('new-database button works', () async {
        final chooseDatabaseButton0 = find.byValueKey('Database Name_text');
        final chooseRecordBackButton =
            find.byValueKey('chooseRecordBackButton');
        expect(await driver.getText(newDatabaseButtonText), "New Database");
        await driver.tap(newDatabaseButton);
        //Testing actual database creation
        await driver.tap(newDatabaseNameTextField);
        await driver.enterText("Database Name");
        await driver.tap(newDatabaseLocationTextField);
        await driver.enterText("New Database Location");
        await driver.tap(createDatabaseButton);

        expect(await driver.getText(chooseDatabaseButton0), "Database Name");
        await driver.tap(chooseRecordBackButton);
        await driver.tap(chooseDatabaseCancelButton);
        await driver.tap(newDatabaseButton);
        //
        await driver.tap(newDatabaseCancelButton);
        expect(await driver.getText(newDatabaseButtonText), "New Database");
      });
      test('new-database-icon button works', () async {
        final chooseDatabaseButton0 = find.byValueKey('Database 1_text');
        final chooseDatabaseButton1 = find.byValueKey('Database 2_text');
        final chooseRecordBackButton =
            find.byValueKey('chooseRecordBackButton');
        final chooseDatabaseCancelButton =
            find.byValueKey('chooseDatabaseCancelButton');

        expect(await driver.getText(newDatabaseButtonText), "New Database");

        await driver.tap(newDatabaseIconButton);
        //Testing actual database creation
        await driver.tap(newDatabaseNameTextField);
        await driver.enterText("Database 1");
        await driver.tap(newDatabaseLocationTextField);
        await driver.enterText("New Database Location 1");
        await driver.tap(createDatabaseButton);

        expect(await driver.getText(chooseDatabaseButton0), "Database 1");

        await driver.tap(chooseRecordBackButton);
        await driver.tap(chooseDatabaseCancelButton);
        await driver.tap(newDatabaseButton);
        //Testing actual database creation
        await driver.tap(newDatabaseNameTextField);
        await driver.enterText("Database 2");
        await driver.tap(newDatabaseLocationTextField);
        await driver.enterText("New Database Location 2");
        await driver.tap(createDatabaseButton);

        expect(await driver.getText(chooseDatabaseButton1), "Database 2");

        await driver.tap(chooseRecordBackButton);

        //
        await driver.tap(chooseDatabaseCancelButton);
        expect(await driver.getText(newDatabaseButtonText), "New Database");
      });
      test('open-database button works', () async {
        expect(await driver.getText(chooseDatabaseButtonText), "Open Database");
        await driver.tap(chooseDatabaseButton);
        //Checking for created databases
        final chooseDatabaseButton0 =
            find.byValueKey('chooseDatabaseButtonText0');
        final chooseDatabaseButton1 =
            find.byValueKey('chooseDatabaseButtonText1');
        expect(await driver.getText(chooseDatabaseButton0), "Database Name");
        expect(await driver.getText(chooseDatabaseButton1), "Database 1");
        final chooseDatabaseButton2 =
            find.byValueKey('chooseDatabaseButtonText2');
        expect(await driver.getText(chooseDatabaseButton2), "Database 2");
        //
        await driver.tap(chooseDatabaseCancelButton);
        expect(await driver.getText(chooseDatabaseButtonText), "Open Database");
      });

      test('chooseDatabaseButton works', () async {
        expect(await driver.getText(chooseDatabaseButtonText), "Open Database");
        await driver.tap(chooseDatabaseButton);

        final chooseDatabaseButton0 = find.byValueKey('chooseDatabaseButton0');
        await driver.tap(chooseDatabaseButton0);
        final databaseNameText = find.byValueKey("Database Name_text");
        expect(await driver.getText(databaseNameText), "Database Name");
        final chooseRecordBackButton =
            find.byValueKey("chooseRecordBackButton");
        await driver.tap(chooseRecordBackButton);

        final chooseDatabaseButtonText0 =
            find.byValueKey('chooseDatabaseButtonText0');
        final chooseDatabaseButtonText1 =
            find.byValueKey('chooseDatabaseButtonText1');
        expect(
            await driver.getText(chooseDatabaseButtonText0), "Database Name");
        expect(await driver.getText(chooseDatabaseButtonText1), "Database 1");
        final chooseDatabaseButtonText2 =
            find.byValueKey('chooseDatabaseButtonText2');
        expect(await driver.getText(chooseDatabaseButtonText2), "Database 2");
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
        final databaseDeletionConfirmationPassword =
            find.byValueKey("text-field-database-deletion-password");
        expect(
            await driver.getText(deleteDatabaseButtonText), "Delete Database");
        await driver.tap(deleteDatabaseButton);
        //Testing for actual database deletion
        final deleteDatabaseElevatedButton1 =
            find.byValueKey("deleteDatabaseElevatedButton1");
        await driver.tap(deleteDatabaseElevatedButton1);
        final deleteConfirmationButton =
            find.byValueKey("DeleteConfirmationButton");
        await driver.tap(databaseDeletionConfirmationPassword);
        await driver.enterText("PASSWORD"); //hard coded for now
        await driver.tap(deleteConfirmationButton);
        await driver.tap(deleteDatabaseCancelButton);
        expect(
            await driver.getText(deleteDatabaseButtonText), "Delete Database");

        await driver.tap(deleteDatabaseButton);
        final deleteDatabaseText0 = find.byValueKey("deleteDatabaseText0");
        expect(await driver.getText(deleteDatabaseText0), "Database Name");
        //
        await driver.tap(deleteDatabaseCancelButton);
        expect(
            await driver.getText(deleteDatabaseButtonText), "Delete Database");
      });
      test('delete-database-icon button works', () async {
        final databaseDeletionConfirmationPassword =
            find.byValueKey("text-field-database-deletion-password");
        expect(
            await driver.getText(deleteDatabaseButtonText), "Delete Database");
        await driver.tap(deleteDatabaseIconButton);
        //Testing for actual database deletion
        final deleteDatabaseElevatedButton0 =
            find.byValueKey("deleteDatabaseElevatedButton0");
        await driver.tap(deleteDatabaseElevatedButton0);
        final deleteConfirmationButton =
            find.byValueKey("DeleteConfirmationButton");
        await driver.tap(databaseDeletionConfirmationPassword);
        await driver.enterText("PASSWORD"); //hard coded for now
        await driver.tap(deleteConfirmationButton);
        await driver.tap(deleteDatabaseCancelButton);
        expect(
            await driver.getText(deleteDatabaseButtonText), "Delete Database");
        await driver.tap(deleteDatabaseButton);
        final deleteDatabaseText0 = find.byValueKey("deleteDatabaseText0");
        expect(await driver.getText(deleteDatabaseText0), "Database 2");
        //
        await driver.tap(deleteDatabaseCancelButton);
        expect(
            await driver.getText(deleteDatabaseButtonText), "Delete Database");
      });
    });
    test('Login Password Works', () async {
      await driver.tap(logoutButton);
      expect(await driver.getText(landingScreenRegisterButtonText), "Register");
      expect(await driver.getText(landingScreenLoginButtonText), "Login");
      await driver.tap(landingScreenLoginButton);
      await driver.tap(loginTextField);
      await driver.enterText("PASSWORD");
      await driver.tap(loginScreenButton);
      expect(await driver.getText(newDatabaseButtonText), "New Database");
    });

    test('Be able to create a new record form inside a database', () async {
      final eyeIconEditRecordForm =
          find.byValueKey("eye-icon-button-new-record-form");
      //open database we previously created
      await driver.tap(chooseDatabaseButton);
      final chooseDatabaseButton2 = find.byValueKey('chooseDatabaseButton0');
      await driver.tap(chooseDatabaseButton2);
      //create a form
      final newRecordIconButton = find.byValueKey('new-record-icon-button');
      await driver.tap(newRecordIconButton);

      final titleInputNewForm = find.byValueKey('title-input-new-form');
      await driver.tap(titleInputNewForm);
      await driver.enterText("Title1");
      final usernameInputNewForm = find.byValueKey('username-input-new-form');
      await driver.tap(usernameInputNewForm);
      await driver.enterText("Username Example");
      final passwordInputNewForm = find.byValueKey('password-input-new-form');
      await driver.tap(passwordInputNewForm);
      await driver.enterText("myPASSWORD1");
      await driver.tap(eyeIconEditRecordForm);

      final notesInputNewForm = find.byValueKey('notes-input-new-form');
      await driver.tap(notesInputNewForm);
      await driver.enterText("Notes Example");
      final newFormSaveButton = find.byValueKey("new-form-save-button");
      await driver.tap(newFormSaveButton);
      final viewRecordButtonText = find.byValueKey("view-record-button-text0");
      expect(await driver.getText(viewRecordButtonText), "Title1");
    });

    test('Be able to create a generated password in a new record', () async {
      final newRecordIconButton = find.byValueKey('new-record-icon-button');
      await driver.tap(newRecordIconButton);

      final titleInputNewForm = find.byValueKey('title-input-new-form');
      await driver.tap(titleInputNewForm);
      await driver.enterText("Test");

      final usernameInputNewForm = find.byValueKey('username-input-new-form');
      await driver.tap(usernameInputNewForm);
      await driver.enterText("Username Example");

      final notesInputNewForm = find.byValueKey('notes-input-new-form');
      await driver.tap(notesInputNewForm);
      await driver.enterText("Notes Example");

      //test the password generation
      final generatePasswordButton =
          find.byValueKey("generate-password-button");
      await driver.tap(generatePasswordButton);
      final passwordGeneratorEyeButton =
          find.byValueKey("password-generator-eye-button");
      await driver.tap(passwordGeneratorEyeButton);
      final generatedPasswordText = find.byValueKey("generated-password-text");
      generatedPasswordTextString = await driver.getText(generatedPasswordText);
      final passwordGeneratorDoneButton =
          find.byValueKey("password-generator-done-button");
      driver.tap(passwordGeneratorDoneButton);
      final newFormSaveButton = find.byValueKey("new-form-save-button");
      await driver.tap(newFormSaveButton);
      final viewRecordButtonText = find.byValueKey("view-record-button-text1");
      expect(await driver.getText(viewRecordButtonText), "Test");
    });

    test('Be able to open a created record form inside a database', () async {
      //open the form

      final viewRecordButton = find.byValueKey("view-record-button0");
      await driver.tap(viewRecordButton);

      //press eye icon to view password
      final eyeIconViewForm = find.byValueKey("eye-icon-button-view-form");
      await driver.tap(eyeIconViewForm);

      //check that title matches
      final viewFormTitle = find.byValueKey("view-form-title");
      expect(await driver.getText(viewFormTitle), "Title1");

      // //check that username matches
      final viewFormUsername = find.byValueKey("view-form-username");
      expect(await driver.getText(viewFormUsername), "Username Example");

      // //check that password matches
      final viewFormPassword = find.byValueKey("view-form-password");
      expect(await driver.getText(viewFormPassword), "myPASSWORD1");

      // //check that notes matches
      final viewFormNotes = find.byValueKey("view-form-notes");
      expect(await driver.getText(viewFormNotes), "Notes Example");

      final viewRecordBackButton = find.byValueKey("view-record-back-button");
      await driver.tap(viewRecordBackButton);
    });

    test('Be able to open a created record form with generated password',
        () async {
      //open the form

      final viewRecordButton = find.byValueKey("view-record-button1");
      await driver.tap(viewRecordButton);

      //press eye icon to view password
      final eyeIconViewForm = find.byValueKey("eye-icon-button-view-form");
      await driver.tap(eyeIconViewForm);

      //check that title matches
      final viewFormTitle = find.byValueKey("view-form-title");
      expect(await driver.getText(viewFormTitle), "Test");

      // //check that username matches
      final viewFormUsername = find.byValueKey("view-form-username");
      expect(await driver.getText(viewFormUsername), "Username Example");

      // //check that password matches
      final viewFormPassword = find.byValueKey("view-form-password");
      expect(
          await driver.getText(viewFormPassword), generatedPasswordTextString);

      // //check that notes matches
      final viewFormNotes = find.byValueKey("view-form-notes");
      expect(await driver.getText(viewFormNotes), "Notes Example");
    });

    test('Be able to edit a created record', () async {
      //form is already opened

      //press edit button
      final editFormButton = find.byValueKey("edit-form");
      await driver.tap(editFormButton);
      // final eye = find.byValueKey("eye-icon-button-view-form");
      // await driver.tap(eye);

      //press title input box and add "Edited"
      final editTitleField = find.byValueKey("edit-title-text-field");
      await driver.tap(editTitleField);
      await driver.enterText("Edited");

      //press username input box and add "Edited"
      final editUsernameField = find.byValueKey("edit-username-text-field");
      await driver.tap(editUsernameField);
      await driver.enterText("Edited Username");

      //press password, delete input box and add "EditedPass"
      final editPasswordField = find.byValueKey("edit-password-text-field");
      await driver.tap(editPasswordField);
      await driver.enterText("Edited Password");
      //press notes input box and add "Edited"
      final editNotesField = find.byValueKey("edit-notes-text-field");
      await driver.tap(editNotesField);
      await driver.enterText("Edited Notes");

      //Press save button
      final saveEditsButton = find.byValueKey("save-edits-button");
      await driver.tap(saveEditsButton);

      //Expect changed title, username, password, and notes when returned to view_record_screen

      final editedTitle = find.byValueKey("view-form-title");
      final editedUsername = find.byValueKey("view-form-username");
      final editedPassword = find.byValueKey("view-form-password");
      final editedNotes = find.byValueKey("view-form-notes");

      expect(await driver.getText(editedTitle), "Edited");
      expect(await driver.getText(editedUsername), "Edited Username");
      expect(await driver.getText(editedPassword), "Edited Password");
      expect(await driver.getText(editedNotes), "Edited Notes");
    });
  });
}
