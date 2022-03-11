import 'package:flutter/material.dart';
import '../../services/authentication_service .dart';

class HomePage extends StatelessWidget {

  final AuthenticationService _auth = AuthenticationService();

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        title: const Text('Brew Crew'),
        actions: <Widget>[
          TextButton.icon(
            onPressed: () async {
              await _auth.signOut();
            },
            icon: const Icon(Icons.person),
            label: const Text('Log out'),
          )
        ],
      ),
      body: const Text('Home Page'),
    );
  }
}
