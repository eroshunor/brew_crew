import 'package:flutter/material.dart';

import '../../model/brew.dart';

class BrewTile extends StatelessWidget {
  final Brew brew;
  const BrewTile({required this.brew, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8),
      child: Card(
        margin: EdgeInsets.only(left: 20, top: 6, right: 20, bottom: 0),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: const AssetImage('lib/assets/coffee_icon.png'),
            radius: 25,
            backgroundColor: Colors.brown[brew.strength],
          ),
          title: Text(brew.name),
          subtitle: Text('Takes ${brew.sugar} sugar(s)'),
        ),
      ),
    );
  }
}
