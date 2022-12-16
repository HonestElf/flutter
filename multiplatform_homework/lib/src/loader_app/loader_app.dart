import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:multiplatform_homework/src/loader_app/loader_widget.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _src = '';
  String _htmlText = '';
  String _pageTitle = '';
  Map<String, dynamic> _headers = {};

  bool _isLoading = false;
  bool _hasError = false;
  String _errorText = '';

  void handleInputChange(String value) {
    setState(() {
      _src = value;
    });
  }

  Future<void> loadContent() async {
    setState(() {
      _isLoading = true;
      _hasError = false;
    });
    try {
      // final response = await http.get(Uri.parse(_src));
      final response = await http.get(Uri.parse('https://flutter.dev'));
      String? title = RegExp(
              r"<[t|T]{1}[i|I]{1}[t|T]{1}[l|L]{1}[e|E]{1}(\s.*)?>([^<]*)</[t|T]{1}[i|I]{1}[t|T]{1}[l|L]{1}[e|E]{1}>")
          .stringMatch(response.body);

      setState(() {
        _htmlText = response.body;
        _headers = response.headers;
        if (title != null) {
          _pageTitle = title
              .substring(title.indexOf('>') + 1, title.lastIndexOf("<"))
              .trim();
        } else {
          _pageTitle = 'No title';
        }
      });
    } catch (error) {
      setState(() {
        _hasError = true;
        _errorText = error.toString();
      });
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            LoaderWidget(
                changeHanler: handleInputChange, loadTapHandler: loadContent),
            _isLoading
                ? const CircularProgressIndicator()
                : _hasError
                    ? Text(
                        _errorText,
                        style: const TextStyle(
                            color: Colors.red, fontStyle: FontStyle.italic),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _pageTitle,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'CORS Header: ${_headers['access-control-allow-origin'] ?? 'none'} ',
                            style: const TextStyle(
                                color: Colors.red, fontSize: 18),
                          ),
                          Text(_htmlText),
                        ],
                      ),
          ],
        ),
      ),
    );
  }
}
