import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({super.key});

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _database = FirebaseDatabase.instance.ref().child('Service');

  String _userId = '';

  @override
  void initState() {
    super.initState();

    getCurrentUser().then((user) {
      if (user != null) {
        // TODO: Mostrar usuario
        setState(() {
          _userId = user.uid;
        });
      } else {
        Navigator.pushReplacementNamed(context, 'home');
      }
    });
  }

  Future<User?> getCurrentUser() async {
    if (_auth.currentUser != null) {
      // TODO: Mas logica  para usuario login
      return _auth.currentUser;
    }

    // TODO: Mas logica  para no login

    return null;
  }

  sendData() {
    _database.child('cities').push().set({
      'name': 'Funza',
      'country': 'Colombia',
      'userId': _userId,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Uid del usuario: $_userId'),
            ElevatedButton(
              onPressed: () {
                sendData();
              },
              child: const Text('Enviar'),
            ),
            ElevatedButton(
              onPressed: () {
                _auth.signOut();
                Navigator.pushReplacementNamed(context, 'home');
              },
              child: const Text('Salir'),
            ),
          ],
        ),
      ),
    );
  }
}
