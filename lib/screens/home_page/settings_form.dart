import 'package:brew_crew/model/my_user.dart';
import 'package:brew_crew/model/my_user_data.dart';
import 'package:brew_crew/services/database_service.dart';
import 'package:brew_crew/shared/constants.dart';
import 'package:brew_crew/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  const SettingsForm({Key? key}) : super(key: key);

  @override
  State<SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {

  final _formKey = GlobalKey<FormState>();
  final List<String> sugar = ['0', '1', '2', '3', '4'];

  late String? _currentName;
  late String? _currentSugar;
  dynamic _currentStrength;


  @override
  Widget build(BuildContext context) {

    final user = Provider.of<MyUser>(context);

    return StreamBuilder<MyUserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        if(snapshot.hasData) {
          MyUserData? myUserData = snapshot.data;
          return Form(
            key: _formKey,
            child: Column(
              children: [
                const Text(
                    'Update your brew settings', style: TextStyle(fontSize: 18)),
                const SizedBox(height: 20),

                //TextFormField - user name
                TextFormField(
                  initialValue: myUserData?.name,
                  decoration: textInputDecoration,
                  validator: (value) =>
                  value!.isEmpty ? 'Please enter a name' : null,
                  onChanged: (value) => setState(() => _currentName = value),
                ),
                const SizedBox(height: 20),

                //dropdown - sugar
                DropdownButtonFormField(
                  value: myUserData?.sugar,
                  decoration: textInputDecoration,
                  items: sugar.map((sugar) {
                    return DropdownMenuItem(
                      value: sugar,
                      child: Text('$sugar sugars'),
                    );
                  }).toList(),
                  onChanged: (value) => setState(() => _currentSugar = value.toString()),
                ),

                //slider - strength
                Slider(
                  value: (_currentStrength ?? myUserData?.strength)!.toDouble(),
                  activeColor: Colors.brown[_currentStrength ?? myUserData!.strength],
                  inactiveColor: Colors.brown[_currentStrength ?? myUserData!.strength],
                  min: 100,
                  max: 900,
                  divisions: 8,
                  onChanged: (value) => setState(() {
                    print(value);
                    print('fennt value lennt current');
                    print(_currentStrength);
                    _currentStrength = value.toInt().round();
                  }),
                ),

                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.pink),
                  ),
                  onPressed: () async {
                    if(_formKey.currentState!.validate()) {
                      await DatabaseService(uid: myUserData!.uid).updateUserData(
                        _currentName ?? myUserData.name,
                        _currentSugar ?? myUserData.sugar,
                        _currentStrength ?? myUserData.strength,
                      );
                      Navigator.pop(context);
                    }
                  },
                  child: const Text(
                      'Update', style: TextStyle(color: Colors.white)),
                )
              ],
            ),
          );
        } else {
          return const Loading();
        }
    });
  }
}
