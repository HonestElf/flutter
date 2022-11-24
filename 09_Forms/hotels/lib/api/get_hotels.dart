// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:http/http.dart' as http;

Future<dynamic> getData(String url) async {
  final response = await http.get(Uri.parse(url));

  var data = json.decode(response.body);

  return data;
}

Future<dynamic> getHotelDetails(String uuid) async {
  final response = await http.get(Uri.parse('https://run.mocky.io/v3/$uuid'));
  var data = json.decode(response.body);
  if (response.statusCode == 404) {
    throw data;
  }

  return data;
}
