import 'package:brew_crew/model/my_user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //create user object based on UserCredential
  MyUser? _myUserFromUserCredentials(User user) {
    return user != null ? MyUser(uid: user.uid): null;
  }

  //sign in anonymously
  Future signInAnon() async {
    try {
      UserCredential result = await _firebaseAuth.signInAnonymously();
      User? user = result.user;
      return _myUserFromUserCredentials(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in with email & password

  //register with email & password

  //sign out
}