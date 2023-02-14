import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_project/src/user.dart' as custom;

import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.userChanges(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const ElevatedButton(
                  onPressed: signIn, child: const Text('Login'));
            } else {
              return const MyHomePage(title: 'Flutter Demo Home Page');
            }
          },
        ));
  }
}

void signIn() {
  if (kIsWeb) {
    signInWithGoogleWeb();
  } else {
    signInWithGoogle();
  }
}

Future<UserCredential?> signInWithGoogle() async {
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

  final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

  return await FirebaseAuth.instance.signInWithCredential(credential);
}

Future<UserCredential?> signInWithGoogleWeb() async {
  final GoogleAuthProvider googleProvider = GoogleAuthProvider();

  googleProvider.addScope('https://www.googleapis.com/auth/contacts.readonly');
  googleProvider.setCustomParameters({'login_hint': 'user@example.com'});

  return await FirebaseAuth.instance.signInWithPopup(googleProvider);
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // final _users = <User>[];

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  late CollectionReference<custom.User> _users;
  final storage = FirebaseStorage.instance;

  @override
  void initState() {
    super.initState();

    // _users.add(const User(name: 'Sasha', amount: 100));
    // _users.add(const User(name: 'Vasya', amount: 200));

    _users = FirebaseFirestore.instance
        .collection('birthday')
        .withConverter<custom.User>(
          fromFirestore: (snapshot, options) =>
              custom.User.fromJson(snapshot.data()!),
          toFirestore: (value, options) => value.toJson(),
        );
  }

  void _submit() {
    if (_nameController.text != '') {
      // setState(() {
      //   _users.add(User(
      //       name: _nameController.text,
      //       amount: int.parse(
      //           _amountController.text != '' ? _amountController.text : '0')));
      // });

      _users.add(custom.User(
          name: _nameController.text,
          amount: int.parse(_amountController.text)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: SizedBox(
            width: 100,
            height: 50,
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: FutureBuilder(
                // future: storage.ref('logo.png').getDownloadURL(),
                future: storage.ref('flutter_logo.svg').getDownloadURL(),
                builder: (context, snapshot) => snapshot.connectionState ==
                        ConnectionState.done
                    ? SvgPicture.network(snapshot.data!, fit: BoxFit.scaleDown)
                    : const SizedBox(),
              ),
              // child: Image.asset(
              //   '../../assets/logo.png',
              //   fit: BoxFit.scaleDown,
              // ),
            ),
          ),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Expanded(
                  child: StreamBuilder<List<custom.User>>(
                      stream: _users.snapshots().map(
                          (event) => event.docs.map((e) => e.data()).toList()),
                      builder: (context, snapshot) {
                        return ListView(
                            children: snapshot.hasData
                                ? snapshot.data!
                                    .map((user) => ListTile(
                                          leading: Text(user.name),
                                          trailing: Text('${user.amount}\$'),
                                        ))
                                    .toList()
                                : []);
                      })),
              SizedBox(
                height: 100,
                child: Row(
                  children: [
                    Flexible(
                        flex: 3,
                        child: TextField(
                          controller: _nameController,
                          decoration: const InputDecoration(hintText: 'Name'),
                        )),
                    Flexible(
                        flex: 1,
                        child: TextField(
                          controller: _amountController,
                          decoration: const InputDecoration(hintText: 'amount'),
                        )),
                    ElevatedButton(
                        onPressed: _submit, child: const Text('Submit'))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}