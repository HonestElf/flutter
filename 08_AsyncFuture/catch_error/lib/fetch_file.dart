import 'package:flutter/services.dart';

Future<String>? fetchFileFromAssets(String assetsPath) async {
  try {
    final data =
        await rootBundle.loadString(assetsPath).then((file) => file.toString());

    return data;
  } catch (error) {
    return Future.error(error.toString());
  }
}
