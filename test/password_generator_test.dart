import 'package:flutter_test/flutter_test.dart';
import 'package:true_vault/utils/passwordGenerator.dart';

void main() {

  test("Generator makes correct length strings", () {
    List<String>composedChars = ['upper','lower','digit','special','space'];
    expect(generatePassword(10, [], [], composedChars).length, 10);
    expect(generatePassword(15, [], [], composedChars).length, 15);
    expect(generatePassword(100, [], [], composedChars).length, 100);
  });

  test("Generator makes upper case strings", () {

    List<String>composedChars = ['upper'];

    String string = generatePassword(10, [], [], composedChars);
    expect(string, string.toUpperCase());

    string = generatePassword(100, [], [], composedChars);
    expect(string, string.toUpperCase());
  });

  test("Generator makes lower case strings", () {

    List<String>composedChars = ['lower'];

    String string = generatePassword(10, [], [], composedChars);
    expect(string, string.toLowerCase());

    string = generatePassword(100, [], [], composedChars);
    expect(string, string.toLowerCase());
  });

  test("Generator makes digit strings", () {

    List<String>composedChars = ['digit'];

    String string = generatePassword(10, [], [], composedChars);
    expect(string.contains(RegExp(r'[0-9]')), true);

    string = generatePassword(100, [], [], composedChars);
    expect(string.contains(RegExp(r'[0-9]')), true);
  });

  test("Generator makes special strings", () {

    List<String>composedChars = ['special'];

    String string = generatePassword(10, [], [], composedChars);
    bool booleanMatcher = !string.contains(RegExp(r'[0-9]')) &&
        !string.contains(RegExp(r'[a-z]')) && !string.contains(RegExp(r'[A-Z]'))
        && string.trim() == string;
    expect(booleanMatcher, true);


    string = generatePassword(100, [], [], composedChars);
    booleanMatcher = !string.contains(RegExp(r'[0-9]')) &&
        !string.contains(RegExp(r'[a-z]')) && !string.contains(RegExp(r'[A-Z]'))
        && string.trim() == string;
    expect(booleanMatcher, true);

  });

  test("Generator makes space strings", () {

    List<String>composedChars = ['space'];

    String string = generatePassword(10, [], [], composedChars);
    expect(string.trim().isEmpty, true);

    string = generatePassword(100, [], [], composedChars);
    expect(string.trim().isEmpty, true);

  });

  test("Generator does not include ignore characters", (){

    /*
    Generate a really big string and by the pigeon hole it should
    include a forbidden character if its not taken care of
     */

    //Check for individual ignore chars
    List<String>composedChars = ['upper'];
    String generatedPassword = generatePassword(1000, ["A"], [], composedChars);
    expect(generatedPassword.contains("A"),false);

    composedChars = ['lower'];
    generatedPassword = generatePassword(1000,['a'],[],composedChars);
    expect(generatedPassword.contains('a'), false);

    composedChars = ['digit'];
    generatedPassword = generatePassword(1000,['0'],[],composedChars);
    expect(generatedPassword.contains('0'), false);

    composedChars = ['special'];
    generatedPassword = generatePassword(1000,['!'],[],composedChars);
    expect(generatedPassword.contains('!'), false);

    //check for several ignore chars
    composedChars = ['lower'];
    generatedPassword = generatePassword(1000,['a','b','c'],[],composedChars);
    expect(generatedPassword.contains('a'), false);
    expect(generatedPassword.contains('b'), false);
    expect(generatedPassword.contains('c'), false);
  });

  test("Generator includes user input",(){

    //check for individual include chars
    List<String>composedChars = ['upper'];
    String generatedPassword = generatePassword(2, [], ["A"], composedChars);
    expect(generatedPassword.contains("A"), true);

    composedChars = ['lower'];
    generatedPassword = generatePassword(3,[],['a'],composedChars);
    expect(generatedPassword.contains('a'), true);

    composedChars = ['digit'];
    generatedPassword = generatePassword(2,[],['0'],composedChars);
    expect(generatedPassword.contains('0'), true);

    composedChars = ['special'];
    generatedPassword = generatePassword(3,[],['!'],composedChars);
    expect(generatedPassword.contains('!'), true);

    //check for several include chars
    composedChars = ['lower'];
    generatedPassword = generatePassword(4,[],['a','b','c'],composedChars);
    expect(generatedPassword.contains('a'), true);
    expect(generatedPassword.contains('b'), true);
    expect(generatedPassword.contains('c'), true);

  });
}
