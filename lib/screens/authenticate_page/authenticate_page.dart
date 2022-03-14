import 'package:brew_crew/screens/authenticate_page/register_page/register_page.dart';
import 'package:brew_crew/screens/authenticate_page/sign_in_page/sign_in_page.dart';
import 'package:flutter/material.dart';

class AuthenticatePage extends StatefulWidget {
  const AuthenticatePage({Key? key}) : super(key: key);

  @override
  State<AuthenticatePage> createState() => _AuthenticatePageState();
}

class _AuthenticatePageState extends State<AuthenticatePage> {

  bool showSignInPage = true;
  void toggleView () {
    setState(() => showSignInPage = !showSignInPage);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignInPage) {
      return SignInPage(toggleView: toggleView);
    } else {
      return RegisterPage(toggleView: toggleView);
    }
  }
}

