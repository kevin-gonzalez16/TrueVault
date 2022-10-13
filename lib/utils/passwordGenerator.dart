import 'dart:math';

int randomCode(int min, int max,Random rand) => min + rand.nextInt((max+1) - min);

List<String> specialChar = ['~','`','!','@','#','\$','%','^','&','*',
  '(',')','-','_','+','=','{','}','[',']',
  '|','\\',':',';','"','\'','<',',','>','.',
  '?','/'];

String generatePassword(int passwordLength, List<String>ignoreChars, List<String>includeChars, List<String>composedChars){

  String passwordString = "";
  int currentChar = 0;
  int charToAdd = 0;

  for(int x = 0; x<passwordLength; x++){

    Random random = Random();
    charToAdd = randomCode(0,composedChars.length-1,random);

    if(composedChars[charToAdd] == "upper"){
      //Random capital
      random = Random();
      currentChar = randomCode(65,90,random);
      passwordString += String.fromCharCode(currentChar);
    }

    else if(composedChars[charToAdd] == "lower"){
      //Random lower
      random = Random();
      currentChar = randomCode(97,122,random);
      passwordString += String.fromCharCode(currentChar);
    }

    else if(composedChars[charToAdd] == "digit"){
      //Random digit
      random = Random();
      currentChar = randomCode(48,57,random);
      passwordString += String.fromCharCode(currentChar);
    }
    else if(composedChars[charToAdd] == "special"){
      //Random special
      random = Random();
      currentChar = randomCode(0,specialChar.length-1,random);
      passwordString += specialChar[currentChar];
    }
    else if(composedChars[charToAdd] == "space"){
      //Random Space
      random = Random();
      currentChar = randomCode(0,1,random);
      if(currentChar == 1){
        passwordString += " ";
      }
      else{
        passwordLength += 1;
      }
    }
  }
  return passwordString;
}