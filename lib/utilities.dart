import 'dart:io';
import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class User{
  String username;
  String password;
  String emailID;

  User({required this.username, required this.password, required this.emailID});
}

void addToDatabase() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = openDatabase(
    join(await getDatabasesPath(), 'userDatabase.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE dogs(name TEXT, age INTEGER)',
      );
    },
    version: 1,
  );
}


void fillJson (Map<String, dynamic> save) async {
  Directory docDir = await getApplicationDocumentsDirectory(); 
  final filePathDir = Directory('${docDir.path}');
  print(filePathDir);
  final filePath = '${filePathDir.path}/user.json';
  final file = File(filePath);

  final jsonEncodeRes = jsonEncode(save);
  await file.writeAsString(jsonEncodeRes, mode: FileMode.append);
}

void readFile() async {
  Directory docDir = await getApplicationDocumentsDirectory();
  final filePathDir = Directory('${docDir.path}');

  final mainFile = '${filePathDir.path}/user.json';
  final file = File(mainFile);

  String res = await file.readAsString();
  print(res);
}
