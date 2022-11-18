import 'package:http/http.dart' as http;

import 'package:flutter_application_forms/user.dart';
import 'dart:convert';
import 'package:flutter/material.dart';

class HttpHomePage extends StatefulWidget {
  const HttpHomePage({super.key, required this.title});

  final String title;

  @override
  State<HttpHomePage> createState() => _HttpHomePageState();
}

class _HttpHomePageState extends State<HttpHomePage> {
  bool isLoading = false;

  bool hasError = false;
  List<User> _users = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    setState(() {
      isLoading = true;
    });

    try {
      // all users
      final response = await http.get(Uri.parse(
          'https://run.mocky.io/v3/be7136ff-e208-4e79-876d-7ff2e1dbee32'));

      //500
      // final response = await http.get(Uri.parse(
      //     'https://run.mocky.io/v3/f1eb2edc-b866-4135-97bb-4a2992e9f359'));

      var data = json.decode(response.body);

      _users = data.map<User>((user) => User.fromJson(user)).toList();
    } catch (error) {
      print(error);

      setState(() {
        hasError = true;
        isLoading = false;
      });
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : hasError
                ? const Center(child: Text('Error'))
                : ListView(
                    children: <Widget>[
                      ..._users.map((user) {
                        return ListTile(
                          title: Text(user.email),
                          subtitle: Text(user.name),
                        );
                      }).toList()
                    ],
                  ));
  }
}
