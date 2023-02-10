import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_project/src/app.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
  final db = FirebaseFirestore.instance;

// Create a new user with a first and last name
  final user = <String, dynamic>{
    "first": "Ada",
    "last": "Lovelace",
    "born": 1815
  };

// Add a new document with a generated ID
  db.collection("newusers").add(user).then((DocumentReference doc) =>
      print('DocumentSnapshot added with ID: ${doc.id}'));

  // Create a new user with a first and last name
  final newUser = <String, dynamic>{
    "first": "Alan",
    "middle": "Mathison",
    "last": "Turing",
    "born": 1912
  };

// Add a new document with a generated ID
  db.collection("newusers").add(newUser).then((DocumentReference doc) =>
      print('DocumentSnapshot added with ID: ${doc.id}'));

  print('---------------------------');

  await db.collection("newusers").get().then((event) {
    for (var doc in event.docs) {
      print("${doc.id} => ${doc.data()}");
    }
  });
}
