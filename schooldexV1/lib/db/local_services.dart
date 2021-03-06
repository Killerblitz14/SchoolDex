import 'dart:io';
import '../models/account.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class LocalServices {
  // Singleton Pattern
  LocalServices._privateConstructor();
  static final LocalServices instance = LocalServices._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'accounts.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE account(
        id TEXT PRIMARY KEY,
        benutzername TEXT,
        passwort TEXT,
        status TEXT,
        schulname TEXT
      )
    ''');
  }

  Future<List<Account>> getAccount() async {
    Database db = await instance.database;
    var accounts = await db.query('account', orderBy: 'id');
    List<Account> accountList =
        accounts.map((e) => Account.fromMapLocal(e)).toList();
    return accountList;
  }

  Future<int> add(Account item) async {
    Database db = await instance.database;
    return await db.insert('account', item.toMapLocal());
  }

  Future<int> remove(String id) async {
    Database db = await instance.database;
    return await db.delete('account', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> update(Account item) async {
    Database db = await instance.database;
    return await db.update('account', item.toMapLocal(),
        where: 'id = ?', whereArgs: [item.id]);
  }
}
