import 'package:flutter_test/flutter_test.dart';
import 'package:true_vault/utils/form.dart';
import 'package:true_vault/utils/encryptor.dart';

void main() {
  test("Form should be created correctly", () {

    Form newForm = Form([
      Encryptor.plainTextToCipher("Google", "PASSWORD"),
      Encryptor.plainTextToCipher("my_gmail", "PASSWORD"),
      Encryptor.plainTextToCipher("Secure password", "PASSWORD"),
      Encryptor.plainTextToCipher("this is a new account", "PASSWORD"),
      Encryptor.plainTextToCipher("google.com", "PASSWORD"),
      Encryptor.plainTextToCipher("google.jpeg", "PASSWORD"),
    ]);

    Map matcher = {
      "serviceName": "Google",
      "username": "my_gmail",
      "password": "Secure password",
      "notes": "this is a new account",
      "url": "google.com",
      "icon": "google.jpeg"
    };
    newForm.formDetails.forEach((key, value) {
      expect(Encryptor.cipherToPlainText(newForm.formDetails[key], "PASSWORD"), matcher[key]);
    });
  });

  test("Form can be edited correctly", () {

    Form newForm = Form([
      Encryptor.plainTextToCipher("Google", "PASSWORD"),
      Encryptor.plainTextToCipher("my_gmail", "PASSWORD"),
      Encryptor.plainTextToCipher("Secure password", "PASSWORD"),
      Encryptor.plainTextToCipher("this is a new account", "PASSWORD"),
      Encryptor.plainTextToCipher("google.com", "PASSWORD"),
      Encryptor.plainTextToCipher("google.jpeg", "PASSWORD"),
    ]);

    newForm.editForm("serviceName", Encryptor.plainTextToCipher("Facebook", "PASSWORD"));
    expect(Encryptor.cipherToPlainText(newForm.formDetails["serviceName"], "PASSWORD"), "Facebook");

    newForm.editForm("username", Encryptor.plainTextToCipher("phone number", "PASSWORD"));
    expect(Encryptor.cipherToPlainText(newForm.formDetails["username"], "PASSWORD"), "phone number");

    newForm.editForm("password", Encryptor.plainTextToCipher("FacebookPassword1", "PASSWORD"));
    expect(Encryptor.cipherToPlainText(newForm.formDetails["password"], "PASSWORD"), "FacebookPassword1");

    newForm.editForm("notes", Encryptor.plainTextToCipher("changed to facebook", "PASSWORD"));
    expect(Encryptor.cipherToPlainText(newForm.formDetails["notes"], "PASSWORD"), "changed to facebook");

    newForm.editForm("url", Encryptor.plainTextToCipher("Facebook.com", "PASSWORD"));
    expect(Encryptor.cipherToPlainText(newForm.formDetails["url"], "PASSWORD"), "Facebook.com");

    newForm.editForm("icon", Encryptor.plainTextToCipher("Facebook.png", "PASSWORD"));
    expect(Encryptor.cipherToPlainText(newForm.formDetails["icon"], "PASSWORD"), "Facebook.png");

  });

  test("The correct last edit date is returned in the correct format", () {

    Form newForm = Form([
      Encryptor.plainTextToCipher("Google", "PASSWORD"),
      Encryptor.plainTextToCipher("my_gmail", "PASSWORD"),
      Encryptor.plainTextToCipher("Secure password", "PASSWORD"),
      Encryptor.plainTextToCipher("this is a new account", "PASSWORD"),
      Encryptor.plainTextToCipher("google.com", "PASSWORD"),
      Encryptor.plainTextToCipher("google.jpeg", "PASSWORD"),
    ]);

    DateTime original = newForm.lastEdited;
    String matcher = original.month.toString() + "/" + original.day.toString();
    matcher += "/" + original.year.toString();
    expect(newForm.returnLastEdited(), matcher);
  });
}
