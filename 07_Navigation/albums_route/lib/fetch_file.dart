// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/services.dart';

// Future<String> fetchFileFromAssets(String assetsPath) async {
//   return rootBundle.loadString(assetsPath).then((file) => file);
// }

Future<List> loadData() async {
  final String response = await rootBundle.loadString('assets/artists.json');

  final data = await json.decode(response);

  return data;
}
