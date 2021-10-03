import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../../view/authentication/entry/model/user_model.dart';
import '../../base/model/base_model.dart';
import 'base_database_manager.dart';

class DbManager extends IDbManager {
  DbManager();
  static DbManager _instance;

  static DbManager get instance {
    _instance ??= DbManager();
    return _instance;
  }

  Database _db;

  Future<Database> get db async {
    _db ??= await _initializeDb();
    return _db;
  }

  Future<Database> _initializeDb() async {
    var dbPath = join(await getDatabasesPath(), 'user.db');
    return await openDatabase(dbPath, version: 1, onCreate: _onCreate);
  }

  Future<FutureOr<void>> _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE user(_id TEXT, name TEXT, surname Text, email TEXT,'
        ' password TEXT, address TEXT, phone TEXT, isEmailActive INTEGER)');
  }

  @override
  Future<int> deleteUser(String id) async {
    final db = await this.db;
    return await db.rawDelete('DELETE FROM user WHERE _id=?', [id]);
  }

  @override
  Future<BaseModel> fetchUser<T extends BaseModel>(T model) async {
    final db = await this.db;
    final result = await db.query('user');
    if (result[0] != null) {
      return model.fromObject(result[0]);
    }
    return null;
  }

  @override
  Future<int> insertUser(UserModel model) async {
    final db = await this.db;
    return await db.rawInsert(
        'INSERT INTO user(_id, name, surname, email, password) '
        'VALUES(?, ?, ?, ?, ?)',
        [
          model.id,
          model.name,
          model.surname,
          model.email,
          model.password,
        ]);
  }

  @override
  Future<int> updateUser(UserModel model) async {
    final db = await this.db;
    return await db.rawUpdate(
        'UPDATE user SET name = ?, surname = ?, email = ?, '
        'password = ? WHERE _id = ?',
        [model.name, model.surname, model.email, model.password, model.id]);
  }
}
