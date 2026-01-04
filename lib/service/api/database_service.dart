import 'dart:io';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:started_project/service/api/path.dart';

class DatabaseService {
  Database? database;
  Future<Database> databaseMain() async {
    if (database != null) return database!;
    database = await initDatabase();
    return database!;
  }

  Future initDatabase() async {
    Directory documensDirectory = await getApplicationDocumentsDirectory();
    String path = join(documensDirectory.path, databaseName);
    return openDatabase(
      path,
      version: databaseVersion,
      onConfigure: (db) async {
        await db.execute('PRAGMA foreign_keys = ON');
      },
      onCreate: create,
    );
  }

  Future create(Database db, int version) async {
    // TABLE USER
    await db.execute('''
    CREATE TABLE users (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      username TEXT NULL,
      email TEXT NULL,
      password TEXT NULL,
      auth_token TEXT NULL,
      avatar TEXT NULL
    )
  ''');
  }
}
