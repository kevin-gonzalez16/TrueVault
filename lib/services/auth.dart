import 'package:firebase_auth/firebase_auth.dart';
import 'package:true_vault/services/database.dart';
import 'package:true_vault/utils/user.dart' as custom_user;

class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Create a custom-user instance from firebase user
  custom_user.User _userFromFirebaseUser(User user) {
    return custom_user.User(user.uid);
  }

  //auth change user stream

  //sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async{
    try{
      dynamic result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      dynamic user = result.user;
      return _userFromFirebaseUser(user);
    }catch(error){
      return null;
    }
  }

  //register with email and password
  Future registerWithEmailAndPassword(String email, String password)async{
    try{
      dynamic result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      dynamic user = result.user;
      //create a new document for the user with the uid
      await DatabaseService(user.uid).updateUserData();
      return _userFromFirebaseUser(user);
    }catch(e){
      return null;
    }
  }

  //sign in with phone and password

  //register with phone and password

  //sign out
  Future signOut()async{
    try{
      return await _auth.signOut();
    }catch(e){
      return null;
    }
  }
}