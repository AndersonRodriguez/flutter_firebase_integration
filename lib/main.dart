import 'package:flutter/material.dart';
import 'package:flutter_firebase_integration/screens/firestore_screen.dart';
import 'package:flutter_firebase_integration/screens/home_screen.dart';
import 'package:flutter_firebase_integration/screens/login_screen.dart';
import 'package:flutter_firebase_integration/screens/register_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_firebase_integration/screens/service_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'home': (context) => const HomeScreen(),
        'login': (context) => LoginScreen(),
        'register': (context) => RegisterScreen(),
        'service': (context) => const ServiceScreen(),
        'firestore': (context) => const FirestoreScreen(),
      },
      initialRoute: 'service',
    );
  }
}
