import 'package:flutter_test/flutter_test.dart';
import 'package:true_vault/utils/form.dart';
import 'package:true_vault/utils/encryptor.dart';

void main() {
  String uID = "2LrMteAPf2XoLYUFc8RM2xDh8P02";

  test("Form should be created correctly", () {

    Form newForm = Form([
      Encryptor.plainTextToCipher("Google", "PASSWORD", uID),
      Encryptor.plainTextToCipher("my_gmail", "PASSWORD", uID),
      Encryptor.plainTextToCipher("Secure password", "PASSWORD", uID),
      Encryptor.plainTextToCipher("this is a new account", "PASSWORD", uID),
      Encryptor.plainTextToCipher("google.com", "PASSWORD", uID),
      Encryptor.plainTextToCipher("google.jpeg", "PASSWORD", uID),
    ], " ");

    Map matcher = {
      "serviceName": "Google",
      "username": "my_gmail",
      "password": "Secure password",
      "notes": "this is a new account",
      "url": "google.com",
      "icon": "google.jpeg"
    };
    newForm.formDetails.forEach((key, value) {
      expect(Encryptor.cipherToPlainText(newForm.formDetails[key], "PASSWORD", uID), matcher[key]);
    });
  });

  test("Form can be edited correctly", () {

    Form newForm = Form([
      Encryptor.plainTextToCipher("Google", "PASSWORD", uID),
      Encryptor.plainTextToCipher("my_gmail", "PASSWORD", uID),
      Encryptor.plainTextToCipher("Secure password", "PASSWORD", uID),
      Encryptor.plainTextToCipher("this is a new account", "PASSWORD", uID),
      Encryptor.plainTextToCipher("google.com", "PASSWORD", uID),
      Encryptor.plainTextToCipher("google.jpeg", "PASSWORD", uID),
    ], " ");

    newForm.editForm("serviceName", Encryptor.plainTextToCipher("Facebook", "PASSWORD", uID));
    expect(Encryptor.cipherToPlainText(newForm.formDetails["serviceName"], "PASSWORD", uID), "Facebook");

    newForm.editForm("username", Encryptor.plainTextToCipher("phone number", "PASSWORD", uID));
    expect(Encryptor.cipherToPlainText(newForm.formDetails["username"], "PASSWORD", uID), "phone number");

    newForm.editForm("password", Encryptor.plainTextToCipher("FacebookPassword1", "PASSWORD", uID));
    expect(Encryptor.cipherToPlainText(newForm.formDetails["password"], "PASSWORD", uID), "FacebookPassword1");

    newForm.editForm("notes", Encryptor.plainTextToCipher("changed to facebook", "PASSWORD", uID));
    expect(Encryptor.cipherToPlainText(newForm.formDetails["notes"], "PASSWORD", uID), "changed to facebook");

    newForm.editForm("url", Encryptor.plainTextToCipher("Facebook.com", "PASSWORD", uID));
    expect(Encryptor.cipherToPlainText(newForm.formDetails["url"], "PASSWORD", uID), "Facebook.com");

    newForm.editForm("icon", Encryptor.plainTextToCipher("Facebook.png", "PASSWORD", uID));
    expect(Encryptor.cipherToPlainText(newForm.formDetails["icon"], "PASSWORD", uID), "Facebook.png");

  });

  test("The correct last edit date is returned in the correct format", () {

    Form newForm = Form([
      Encryptor.plainTextToCipher("Google", "PASSWORD", uID),
      Encryptor.plainTextToCipher("my_gmail", "PASSWORD", uID),
      Encryptor.plainTextToCipher("Secure password", "PASSWORD", uID),
      Encryptor.plainTextToCipher("this is a new account", "PASSWORD", uID),
      Encryptor.plainTextToCipher("google.com", "PASSWORD", uID),
      Encryptor.plainTextToCipher("google.jpeg", "PASSWORD", uID),
    ], " ");

    DateTime original = newForm.lastEdited;
    String matcher = original.month.toString() + "/" + original.day.toString();
    matcher += "/" + original.year.toString();
    expect(newForm.returnLastEdited(), matcher);
  });
}
