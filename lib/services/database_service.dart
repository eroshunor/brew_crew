
import 'package:brew_crew/model/brew.dart';
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
  //brew list from snapshot
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Brew(
        name: (doc.data() as dynamic)['name'] ?? '',
        strength: (doc.data() as dynamic)['strength'] ?? 0,
        sugar: (doc.data() as dynamic)['sugars'] ?? '0',
      );
    }).toList();
  }

  //get brews stream
  Stream<List<Brew>> get brews {
    return brewCollection.snapshots()
        .map(_brewListFromSnapshot);
  }
}