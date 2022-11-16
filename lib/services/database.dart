import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  String uid;
  DatabaseService(this.uid);
  final CollectionReference recordsCollectionReference =
      FirebaseFirestore.instance.collection("records");

  //this will reserve a document for the new user
  Future<void> createUserDocument() async {
    await recordsCollectionReference
        .doc(uid)
        .collection("credentials")
        .doc(uid)
        .set({
      "title": "test title",
      "username": "test username",
      "password": "test password",
      "notes": "test notes"
    });
  }

  //Function not needed right now but will be implemented in the future
  //used to add new records
  Future<void> add() async {
    await recordsCollectionReference.doc(uid).collection("credentials").add({
      "title": "test title",
      "username": "test username",
      "password": "test password",
      "notes": "test notes"
    });
  }
}
