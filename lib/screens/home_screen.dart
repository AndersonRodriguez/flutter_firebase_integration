import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'register');
              },
              child: const Text('Registro'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'login');
              },
              child: const Text('Login'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'firestore');
              },
              child: const Text('Firestore'),
            ),
          ],
        ),
      ),
    );
  }
}
