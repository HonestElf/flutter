// import 'package:http/http.dart' as http;

import 'package:flutter_application_forms/user.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class DioHomePage extends StatefulWidget {
  const DioHomePage({super.key, required this.title});

  final String title;

  @override
  State<DioHomePage> createState() => _DioHomePageState();
}

class _DioHomePageState extends State<DioHomePage> {
  bool isLoading = false;
  bool hasError = false;
  String? errorMessage;

  List<User> _users = [];

  final Dio _dio = Dio();

  @override
  void initState() {
    super.initState();
    getDataDio();
  }

  getDataDio() async {
    setState(() {
      isLoading = true;
    });

    try {
      // all users
      // final response = await _dio
      //     .get('https://run.mocky.io/v3/be7136ff-e208-4e79-876d-7ff2e1dbee32');

      // _users = response.data.map<User>((user) => User.fromJson(user)).toList();

      //user_name
      // final response = await _dio
      //     .get('https://run.mocky.io/v3/ad7372cb-6aa7-4dfe-be34-690d94150c47');

      // _users = response.data.map<User>((user) => User.fromJson(user)).toList();

      //without name
      final response = await _dio
          .get('https://run.mocky.io/v3/d7064112-a2a3-4c90-b495-60a3ea3f1d00');

      _users = response.data.map<User>((user) => User.fromJson(user)).toList();

      //500
      // final response = await _dio
      //     .get('https://run.mocky.io/v3/f1eb2edc-b866-4135-97bb-4a2992e9f359');
    } on DioError catch (error) {
      setState(() {
        errorMessage = error.response?.data['message'];
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
                ? Center(child: Text(errorMessage ?? 'Error'))
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
