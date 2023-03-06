import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

// Future<File> _downloadFile(String url, String filename) async {
//   var request = await httpClient.getUrl(Uri.parse(url));
//   var response = await request.close();
//   var bytes = await consolidateHttpClientResponseBytes(response);
//   String dir = (await getApplicationDocumentsDirectory()).path;
//   File file = new File('$dir/$filename');
//   await file.writeAsBytes(bytes);
//   return file;
// }

Future<dynamic> downloadImage(String url) async {
  final response = await http.get(Uri.parse(url));
}

Future<File> downloadFile(String url, String filename) async {
  http.Client client = http.Client();
  var req = await client.get(Uri.parse(url));
  var bytes = req.bodyBytes;
  String dir = (await getApplicationDocumentsDirectory()).path;
  String prunedName = '${filename.replaceAll(' ', '')}.jpg';
  File file = File('$dir/downloaded/$prunedName');
  await file.writeAsBytes(bytes);
  return file;
}
