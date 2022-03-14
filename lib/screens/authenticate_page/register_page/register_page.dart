import 'package:flutter/material.dart';
import '../../../services/authentication_service .dart';
import '../../../shared/constants.dart';
import '../../../shared/loading.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback toggleView;
  const RegisterPage({required this.toggleView, Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final AuthenticationService _authService = AuthenticationService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
    ? Loading()
    : Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        title: const Text('Register to Brew Crew'),
        actions: [
          TextButton.icon(
            onPressed: () => widget.toggleView(),
            icon: Icon(Icons.person, color: Colors.brown[800]),
            label: Text('Sign In', style: TextStyle(color: Colors.brown[800])),
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
                  decoration: textInputDecoration.copyWith(hintText: 'Email'),
                  validator: (value) => value!.isEmpty ? 'Enter an email' : null,
                  onChanged: (value) {
                    setState(() => email = value);
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Password'),
                  validator: (value) => value!.length < 6 ? 'Enter a password 6+ character long' : null,
                  onChanged: (value) {
                    setState(() => password = value);
                  },
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.pink),
                  ),
                  onPressed: () async {
                    if(_formKey.currentState!.validate()){
                      setState(() => loading = true);
                      dynamic result = await _authService.registerWithEmailAndPassword(email, password);
                      if (result == null) {
                        setState(() {
                          error = 'Please supply a valid email';
                          loading = false;
                        });
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
