import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirestoreScreen extends StatefulWidget {
  const FirestoreScreen({super.key});

  @override
  State<FirestoreScreen> createState() => _FirestoreScreenState();
}

class _FirestoreScreenState extends State<FirestoreScreen> {
  List<Widget> dataListWidget(AsyncSnapshot snapshot) {
    if (snapshot.data != null) {
      return snapshot.data.docs
          .map<Widget>((document) => ListTile(
                title: Text(document['name']),
                subtitle: Text(document['city']),
              ))
          .toList();
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firestore'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('customers').snapshots(),
        builder: (context, snapshot) => ListView(
          children: dataListWidget(snapshot),
        ),
      ),
    );
  }
}
