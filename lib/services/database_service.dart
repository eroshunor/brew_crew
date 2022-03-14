
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});

  //collection reference
  final CollectionReference brewCollection = FirebaseFirestore.instance.collection('brews');

  Future<void> updateUserData(String name, String sugar, int strength,) async {
    return await brewCollection.doc(uid).set({
      'name': name,
      'sugar': sugar,
      'strength': strength,
    });
  }

  //get brews stream
  Stream<QuerySnapshot?> get brews {
    return brewCollection.snapshots();
}
}