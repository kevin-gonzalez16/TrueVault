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
  Random random = Random();

  for(int x = 0; x<passwordLength; x++){

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
    //check if it has forbidden character
    if(passwordString.isNotEmpty && ignoreChars.contains(passwordString[passwordString.length-1])){
      passwordString = passwordString.substring(0,passwordString.length-1);
      passwordLength += 1;
    }
  }

  //Check for include chars
  if(includeChars.isNotEmpty){
    //iterate the include list
    for (var element in includeChars) {
      //if the string does not contain at least one char from the list
      if(!passwordString.contains(element)){
        //get a random index whose char is not also in the list
        random = Random();
        int randomIndex = randomCode(0, passwordString.length-1, random);
        while(includeChars.contains(passwordString[randomIndex])){
          randomIndex = randomCode(0, passwordString.length-1, random);
        }
        //replace that random char with the include one
        passwordString = passwordString.substring(0,randomIndex) + element + passwordString.substring(randomIndex+1);
      }
    }
  }

  return passwordString;
}