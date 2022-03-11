import 'package:brew_crew/screens/authenticate_page/authenticate_page.dart';
import 'package:brew_crew/screens/home_page/home_page.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //return either Home or Authenticate widget
    return AuthenticatePage();
  }
}
