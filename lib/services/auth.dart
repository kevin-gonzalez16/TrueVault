import 'package:firebase_auth/firebase_auth.dart';
import 'package:true_vault/services/database.dart';
import 'package:true_vault/utils/database.dart';
import 'package:true_vault/utils/user.dart';

class AuthService {

  //make a firebase authentication instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Create a custom-user instance from firebase user
  Future<TrueVaultUser> trueVaultUserFromFirebaseUser(User user) async{

    //Fetch the databases from the user unique ID
    DatabaseService databaseService = DatabaseService(user.uid);
    List<Database> databases = await databaseService.returnRecords();

    //return a true vault user from a firebase user
    //passing the firebase user unique id and its databases
    return TrueVaultUser(user.uid, databases);
  }

  //sign in with email and password
  /*When using in app screen:
      await Firebase.initializeApp();
      AuthService test = AuthService();
      dynamic result = await test.signInWithEmailAndPassword(email, password);

      if the result is null it means something went wrong.
      In order to use in a screen these imports are needed:
        import 'package:firebase_core/firebase_core.dart';
        import 'package:true_vault/services/auth.dart';
   */
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      //try to login with the given email and password
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      //extract user from sign in result
      dynamic userAttempt = result.user;

      //return the user casted as a true vault user
      return trueVaultUserFromFirebaseUser(userAttempt);
    } catch (authError) {
      return null;
    }
  }

  //register with email and password
  /*When using in app screen:
      await Firebase.initializeApp();
      AuthService test = AuthService();
      dynamic result = await test.registerWithEmailAndPassword(email, password);

      if the result is null it means something went wrong.
      In order to use in a screen these imports are needed:
        import 'package:firebase_core/firebase_core.dart';
        import 'package:true_vault/services/auth.dart';
   */
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      //try to register with the given email and password
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      //extract user from sign up result
      dynamic userAttempt = result.user;

      //return the user casted as a true vault user
      return trueVaultUserFromFirebaseUser(userAttempt);
    } catch (authError) {
      return null;
    }
  }

  //sign in with phone and password

  //register with phone and password

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      return null;
    }
  }
}
