import 'package:brew_crew/model/my_user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //create user object based on UserCredential
  MyUser? _myUserFromUserCredentials(User? user) {
    return user != null ? MyUser(uid: user.uid): null;
  }

  //auth change user stream
  Stream<MyUser?> get user {
    return _firebaseAuth.authStateChanges()
      .map(_myUserFromUserCredentials);
  }

  //sign in anonymously
  Future signInAnon() async {
    try {
      UserCredential result = await _firebaseAuth.signInAnonymously();
      User? user = result.user;
      return _myUserFromUserCredentials(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in with email & password

  //register with email & password

  //sign out
  Future signOut() async {
    try {
      return await _firebaseAuth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}