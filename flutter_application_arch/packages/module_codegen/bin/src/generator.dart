import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:dart_style/dart_style.dart';

const localizationPath = 'packages/module_codegen';

class Generator {
  static const _kOutput = 'enc_variables.g.dart';

  final _prologue = """
//DO NOT EDIT. This is code generated via code generator

class EnvironmentVariables {

""";

  final _epilogue = ' }';

  String _getProperty(String value, String propertyName) => """
String get $propertyName =>'$value';
""";

  void run({required int varNumber}) {
    print('Generation started');

    final outputFile = path.join(Directory.current.path, 'lib/$_kOutput');

    final output = StringBuffer();

    output.writeln(_prologue);

    // for (final entry in Platform.environment.entries.take(varNumber)) {
    //   output.writeln(_getProperty(entry.value, entry.key.toLowerCase()));
    // }
    for (final entry in Platform.environment.entries.take(varNumber)) {
      output.writeln(_getProperty(entry.value, entry.key.toLowerCase()));
    }

    output.writeln(_epilogue);

    // final formattedCode = DartFormatter().format(output.toString());

    File(outputFile).writeAsStringSync(output.toString().split(r'\').join('/'));

    print('Generation completed');
  }
}
