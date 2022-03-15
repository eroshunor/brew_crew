import 'package:brew_crew/shared/constants.dart';
import 'package:flutter/material.dart';

class SettingsForm extends StatefulWidget {
  const SettingsForm({Key? key}) : super(key: key);

  @override
  State<SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {

  final _formKey = GlobalKey<FormState>();
  final List<String> sugar = ['0', '1', '2', '3', '4'];

  late String? _currentName;
  String? _currentSugar = '0';
  int? _currentStrength = 100;


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const Text('Update your brew settings', style: TextStyle(fontSize: 18)),
          const SizedBox(height: 20),
          TextFormField(
            decoration: textInputDecoration,
            validator: (value) => value!.isEmpty ? 'Please enter a name' : null,
            onChanged: (value) => setState(() => _currentName = value),
          ),
          const SizedBox(height: 20),

          //dropdown
          DropdownButtonFormField(
            decoration: textInputDecoration,
            value: _currentSugar ?? '0',
            items: sugar.map((sugar) {
              return DropdownMenuItem(
                value: sugar,
                child: Text('$sugar sugars'),
              );
            }).toList(),
            onChanged: (value) => setState(() => _currentSugar = value.toString()),
          ),

          //slider
          Slider(
            activeColor: Colors.brown[_currentStrength ?? 100],
            inactiveColor: Colors.brown[_currentStrength ?? 100],
            min: 100,
            max: 900,
            divisions: 8,
            value: (_currentStrength ?? 100).toDouble(),
            onChanged: (value) => setState(() => _currentStrength = value.round()),
          ),

          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.pink),
            ),
            onPressed: () async {
              print(_currentName);
              print(_currentSugar);
              print(_currentStrength);
            },
            child: const Text('Update', style: TextStyle(color: Colors.white)),
          )
        ],
      ),
    );
  }
}
