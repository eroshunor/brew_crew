import 'package:brew_crew/services/database_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../services/authentication_service .dart';
import 'brew_list.dart';

class HomePage extends StatelessWidget {

  final AuthenticationService _auth = AuthenticationService();

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot?>.value(
      value: DatabaseService().brews,
      initialData: null,
      child: Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          backgroundColor: Colors.brown[400],
          title: const Text('Brew Crew'),
          actions: <Widget>[
            TextButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: Icon(Icons.person, color: Colors.brown[800]),
              label: Text('Log out', style: TextStyle(color: Colors.brown[800])),
            ),
          ],
        ),
        body: const BrewList(),
      ),
    );
  }
}
