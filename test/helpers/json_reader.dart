import 'dart:io';

Future<String> readJson(String path) async {
  final file = File(path);
  return await file.readAsString();
}