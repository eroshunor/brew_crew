import 'package:flutter/material.dart';
import '../../../services/authentication_service .dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback toggleView;
  const RegisterPage({required this.toggleView, Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final AuthenticationService _authService = AuthenticationService();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        title: const Text('Register to Brew Crew'),
        actions: [
          TextButton.icon(
            onPressed: () => widget.toggleView(),
            icon: const Icon(Icons.person),
            label: const Text('Sign In'),
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
                  child: const Text('Register', style: TextStyle(color: Colors.white)),
                )
              ],
            )
        ),
      ),
    );
  }
}
