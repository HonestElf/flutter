import 'package:http/http.dart' as http;

Future downloadFiles(String url) async {
  http.Client client = http.Client();
  var req = await client.get(Uri.parse(url));
  var bytes = req.bodyBytes;

  return bytes;
}
