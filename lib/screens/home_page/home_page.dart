import 'package:brew_crew/screens/home_page/settings_form.dart';
import 'package:brew_crew/services/database_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/brew.dart';
import '../../services/authentication_service .dart';
import 'brew_list.dart';

class HomePage extends StatelessWidget {

  final AuthenticationService _auth = AuthenticationService();

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    void _showSettingsPanel() {
      showModalBottomSheet(context: context, builder: (context){
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
          child: SettingsForm(),
        );
      });
    }

    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().brews,
      initialData: [],
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
            TextButton.icon(
              onPressed: () => _showSettingsPanel(),
              icon: Icon(Icons.settings, color: Colors.brown[800]),
              label: Text('Settings', style: TextStyle(color: Colors.brown[800])),
            ),
          ],
        ),
        body: const BrewList(),
      ),
    );
  }
}
