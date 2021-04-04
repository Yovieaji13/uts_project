import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'item.dart';
import 'login.dart';

class DbHelper {
  static DbHelper _dbHelper;
  static Database _database;
  DbHelper._createObject();
  Future<Database> initDb() async {
    //untuk menentukan nama database dan lokasi yg dibuat
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'item.db';

    //create, read databases
    var itemDatabase = openDatabase(path, version: 5, onCreate: _createDb);
    //mengembalikan nilai object sebagai hasil dari fungsinya
    return itemDatabase;
  }

  //buat tabel baru dengan nama item
  void _createDb(Database db, int version) async {
    var batch = db.batch();
    batch.execute('DROP TABLE IF EXISTS item');
    batch.execute('DROP TABLE IF EXISTS login');
    batch.execute('''
 CREATE TABLE item (
 id INTEGER PRIMARY KEY AUTOINCREMENT,
 name TEXT,
 price INTEGER,
 code TEXT,
 color TEXT
 )
 ''');
    //table login
    batch.execute('''
  CREATE TABLE login(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  username TEXT,
  password TEXT)
 ''');
 await batch.commit();
  }

//select databases item
  Future<List<Map<String, dynamic>>> select() async {
    Database db = await this.initDb();
    var mapList = await db.query('item', orderBy: 'name');
    return mapList;
  }

//select databases login
  Future<List<Map<String, dynamic>>> selectLogin() async {
    Database db = await this.initDb();
    var mapList = await db.query('login', orderBy: 'username');
    return mapList;
  }

//create databases item
  Future<int> insert(Item object) async {
    Database db = await this.initDb();
    int count = await db.insert('item', object.toMap());
    return count;
  }

  //create databases login
  Future<int> insertLogin(Login object) async {
    Database db = await this.initDb();
    int count = await db.insert('login', object.toMap());
    return count;
  }

//update databases item
  Future<int> update(Item object) async {
    Database db = await this.initDb();
    int count = await db
        .update('item', object.toMap(), where: 'id=?', whereArgs: [object.id]);
    return count;
  } 
  
  //update databases login
  Future<int> updateLogin(Item object) async {
    Database db = await this.initDb();
    int count = await db
        .update('login', object.toMap(), where: 'id=?', whereArgs: [object.id]);
    return count;
  } 
  
  //delete databases item
  Future<int> delete(int id) async {
    Database db = await this.initDb();
    int count = await db.delete('item', where: 'id=?', whereArgs: [id]);
    return count;
  }

  //delete databases login
  Future<int> deleteLogin(int id) async {
    Database db = await this.initDb();
    int count = await db.delete('login', where: 'id=?', whereArgs: [id]);
    return count;
  }

  Future<List<Item>> getItemList() async {
    var itemMapList = await select();
    int count = itemMapList.length;
    List<Item> itemList = List<Item>();
    for (int i = 0; i < count; i++) {
      itemList.add(Item.fromMap(itemMapList[i]));
    }
    return itemList;
  }

  factory DbHelper() {
    if (_dbHelper == null) {
      _dbHelper = DbHelper._createObject();
    }
    return _dbHelper;
  }
  Future<Database> get database async {
    if (_database == null) {
      _database = await initDb();
    }
    return _database;
  }
}
