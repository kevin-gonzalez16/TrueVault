import 'package:true_vault/utils/database.dart';

class TrueVaultUser {
  String uID;
  List<Database> databases;

  TrueVaultUser(this.uID, this.databases);
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