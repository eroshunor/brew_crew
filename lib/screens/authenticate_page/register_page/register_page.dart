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
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String error = '';

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
          key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 20),
                TextFormField(
                  validator: (value) => value!.isEmpty ? 'Enter an email' : null,
                  onChanged: (value) {
                    setState(() => email = value);
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  validator: (value) => value!.length < 6 ? 'Enter a password 6+ character long' : null,
                  onChanged: (value) {
                    setState(() => password = value);
                  },
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    if(_formKey.currentState!.validate()){
                      dynamic result = await _authService.registerWithEmailAndPassword(email, password);
                      if (result == null) {
                        setState(() => error = 'Please supply a valid email');
                      }
                    }
                  },
                  child: const Text('Register', style: TextStyle(color: Colors.white)),
                ),
                const SizedBox(height: 10),
                Text(error, style: TextStyle(color: Colors.red, fontSize: 14))
              ],
            )
        ),
      ),
    );
  }
}
