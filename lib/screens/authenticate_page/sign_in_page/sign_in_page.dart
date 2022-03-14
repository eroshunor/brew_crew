import 'package:brew_crew/services/authentication_service%20.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  final VoidCallback toggleView;
  const SignInPage({required this.toggleView, Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  final AuthenticationService _authService = AuthenticationService();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        title: const Text('Sign in to Brew Crew'),
        actions: [
          TextButton.icon(
            onPressed: () => widget.toggleView(),
            icon: const Icon(Icons.person),
            label: const Text('Register'),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Form(
            child: Column(
              children: [
                const SizedBox(height: 20),
                TextFormField(
                  onChanged: (value) {
                    setState(() => email = value);
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  onChanged: (value) {
                    setState(() => password = value);
                  },
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () async {
                      print(email);
                      print(password);

                    },
                    child: const Text('Sign in', style: TextStyle(color: Colors.white)),
                )
              ],
            )
        ),
      ),
    );
  }
}
