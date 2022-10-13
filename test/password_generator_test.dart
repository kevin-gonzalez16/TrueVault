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
}
