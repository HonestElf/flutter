import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

Future<dynamic> downloadImage(String url) async {
  final response = await http.get(Uri.parse(url));
}

Future<File> downloadFile(String url, String filename) async {
  http.Client client = http.Client();
  var req = await client.get(Uri.parse(url));
  var bytes = req.bodyBytes;
  Directory appDocDir = await getApplicationDocumentsDirectory();

  String prunedName = '${filename.replaceAll(' ', '')}.jpg';
  Directory targetDir = Directory('${appDocDir.path}/downloads');

  await checkIfDirExist(targetDir);
  File file = File('${targetDir.path}/$prunedName');
  await file.writeAsBytes(bytes);

  print('SAVED');
  return file;
}

Future<void> checkIfDirExist(Directory targetDir) async {
  if (!(await targetDir.exists())) {
    await targetDir.create();
  }
}
