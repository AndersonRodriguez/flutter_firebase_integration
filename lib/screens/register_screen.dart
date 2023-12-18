import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.email),
                const SizedBox(width: 20),
                SizedBox(
                  width: 200.0,
                  child: TextField(
                    controller: _email,
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.password),
                const SizedBox(width: 20),
                SizedBox(
                  width: 200.0,
                  child: TextField(
                    controller: _password,
                    keyboardType: TextInputType.text,
                    autocorrect: false,
                    obscureText: true,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                try {
                  final newUser = await _auth.createUserWithEmailAndPassword(
                    email: _email.text.trim(),
                    password: _password.text.trim(),
                  );

                  print(newUser);

                  _email.clear();
                  _password.clear();

                  Navigator.pop(context);
                } catch (e) {
                  print(e);
                }
              },
              child: const Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}
