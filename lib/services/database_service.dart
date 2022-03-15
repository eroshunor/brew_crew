
import 'package:brew_crew/model/brew.dart';
import 'package:brew_crew/model/my_user_data.dart';
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
  //myUserData from snapshot
  MyUserData _myUserDataFromSnapshot(DocumentSnapshot snapshot) {
    return MyUserData(
      uid: uid!,
      name: snapshot['name'],
      sugar: snapshot['sugar'],
      strength: snapshot['strength'],
    );
  }

  //get brews stream
  Stream<List<Brew>> get brews {
    return brewCollection.snapshots()
        .map(_brewListFromSnapshot);
  }

  //get user doc stream
  Stream<MyUserData> get userData {
    return brewCollection.doc(uid).snapshots()
    .map(_myUserDataFromSnapshot);

  }
}