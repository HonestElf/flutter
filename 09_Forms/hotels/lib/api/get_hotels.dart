import 'package:http/http.dart' as http;
import 'dart:convert';

Future<dynamic> getData(String url) async {
  final response = await http.get(Uri.parse(url));

  var data = json.decode(response.body);

  return data;
}
