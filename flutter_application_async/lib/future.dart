import 'package:flutter/services.dart';

Future<List<String>> getData([int delay = 1]) {
  return Future.delayed(Duration(seconds: delay), () {
    if (delay > 2) {
      return Future.error('Слишком долгий запрос к серверу');
    }
    return ['Superman, Batman, Thor'];
  });
}

// void futureApi() {
//   print('Before call');
//   getData(2)
//       .then((value) => print(value))
//       .catchError((error) => print(error))
//       .whenComplete(() => print('Completed'));
//   print('After call');
// }

// void asyncApi() async {
//   print('Before call');
//   try {
//     var data = await getData(2);

//     print(data);
//   } catch (error) {
//     print(error);
//   } finally {
//     print('Finally');
//   }
//   print('After call');
// }

Future<String> fetchFileFromAssets(String assetsPath) {
  return rootBundle.loadString(assetsPath).then((file) => file.toString());
}
