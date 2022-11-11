import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{

  String uid;
  DatabaseService(this.uid);
  final CollectionReference recordCollectionReference = FirebaseFirestore.instance.collection("records");

  Future updateUserData()async{
    return await recordCollectionReference.doc(uid).set({
      'test':'test'
    });
  }
}