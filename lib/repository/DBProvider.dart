import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {

  //Private constructor
  DBProvider._();
  static final DBProvider instance = DBProvider._();

  static Database? _database;

  Future<Database> get database async {
    if (_database == null)
      _database = await _initDatabase();
      //if database is null, we initialize a new one

    return _database!;
  }

  Future<Database> _initDatabase() async {
    Directory documentsDir = await getApplicationDocumentsDirectory();
    String databasePath = documentsDir.path + "database.db";
    return await openDatabase(databasePath, version: 1, onOpen: (db) => {},
      onCreate: (database, version) async {
        await database.execute("CREATE TABLE TodoList (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT NOT NULL, description TEXT, done BIT)");
      }
    );
  }

  Future<void> close() async {
    return _database?.close();
  }

}