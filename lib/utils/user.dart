import 'package:true_vault/utils/database.dart';

class TrueVaultUser {
  String uID;
  String email;

  List<Database> databases;

  TrueVaultUser(
    this.uID,
    this.email,
    this.databases,
  );
}


/*
Class User
    Name = Encrypted String
    email = Encrypted string
    phone = Encrypted String
    username = Encrypted String
    master-password = Encrypted string
    passwords = List<Credentials> = []
 */