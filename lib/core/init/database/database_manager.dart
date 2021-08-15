import 'dart:async';

import 'package:food_delivery/core/base/model/base_model.dart';
import 'package:food_delivery/view/authentication/entry/model/user_model.dart';
import 'package:path/path.dart';
import 'package:food_delivery/core/init/database/base_database_manager.dart';
import 'package:sqflite/sqflite.dart';

class DbManager extends IDbManager {
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
  Future<int> delete(String id) async {
    final db = await this.db;
    return await db.rawDelete('DELETE FROM user WHERE _id=?', [id]);
  }

  @override
  Future<UserModel> fetch<T extends BaseModel>(T model) async {
    final db = await this.db;
    final result = await db.query('user');
    return model.fromObject(result[0]);
  }

  @override
  Future<int> insert(UserModel model) async {
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
  Future<int> update(UserModel model) async {
    final db = await this.db;
    return await db.rawUpdate(
        'UPDATE user SET name = ?, surname = ?, email = ?, '
        'password = ? WHERE _id = ?',
        [model.name, model.surname, model.email, model.password, model.id]);
  }
}
