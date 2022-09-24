import 'package:flutter_test/flutter_test.dart';
import 'package:true_vault/utils/form.dart';

void main(){

  test("Form should be created correctly", (){

    List <String> details = ["Google","my_gmail","Secure password",
      "this is a new account","google.com","google.jpeg"];
    Form newForm = Form(details);
    Map matcher = {
      "serviceName" : "Google",
      "username" : "my_gmail",
      "password" : "Secure password",
      "notes" : "this is a new account",
      "url" : "google.com",
      "icon" : "google.jpeg"
    };
    expect(newForm.formDetails, matcher);
  });

  test("Form can be edited correctly", (){

    List <String> details = ["Google","my_gmail","Secure password",
      "this is a new account","google.com","google.jpeg"];
    Form newForm = Form(details);

    newForm.editForm("serviceName", "Facebook");
    expect(newForm.formDetails["serviceName"], "Facebook");

    newForm.editForm("username", "phone number");
    expect(newForm.formDetails["username"], "phone number");

    newForm.editForm("password", "FacebookPassword1");
    expect(newForm.formDetails["password"], "FacebookPassword1");

    newForm.editForm("notes", "changed to facebook");
    expect(newForm.formDetails["notes"], "changed to facebook");

    newForm.editForm("url", "Facebook.com");
    expect(newForm.formDetails["url"], "Facebook.com");

    newForm.editForm("icon", "Facebook.png");
    expect(newForm.formDetails["icon"], "Facebook.png");

  });

  test("Last Edited Date changes after an edit", (){

    List <String> details = ["Google","my_gmail","Secure password",
      "this is a new account","google.com","google.jpeg"];
    Form newForm = Form(details);
    DateTime original = newForm.lastEdited;

    newForm.editForm("serviceName", "Facebook");
    expect(original, isNot(newForm.lastEdited));

    original = newForm.lastEdited;
    newForm.editForm("icon", "Facebook.png");
    expect(original, isNot(newForm.lastEdited));

  });

  test("The correct last edit date is returned in the correct format", (){

    List <String> details = ["Google","my_gmail","Secure password",
      "this is a new account","google.com","google.jpeg"];
    Form newForm = Form(details);
    DateTime original = newForm.lastEdited;
    String matcher = original.month.toString()+"/"+original.day.toString();
    matcher += "/"+original.year.toString();
    expect(newForm.returnLastEdited(), matcher);

  });
}