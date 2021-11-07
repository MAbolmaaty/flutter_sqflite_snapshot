
import 'package:flutter_sqflite/src/models/user.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ProfileDatabase {

  static final ProfileDatabase instance = ProfileDatabase._init();

  static Database _database;

  ProfileDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await _initDB('profile.db');
    return _database;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';

    await db.execute('''
    CREATE TABLE $tableUsers (
    ${UserFields.id} $idType,
    ${UserFields.username} $textType,
    ${UserFields.email} $textType,
    ${UserFields.password} $textType,
    ${UserFields.phoneNumber} $textType)
    ''');
  }

  Future<User> create(User user) async {
    final db = await instance.database;

    final id = await db.insert(tableUsers, user.toJson());

    print('created : ' + id.toString());

    return user.copy(id: id);
  }

  Future<User> fetchUser(int id) async {
    final db = await instance.database;

    final maps = await db.query(tableUsers,
    columns: UserFields.values,
    where: '${UserFields.id} = ?',
    whereArgs: [id]);

    if (maps.isNotEmpty) {
      return User.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<User>> fetchAllUsers() async {
    final db = await instance.database;

    final result = await db.query(tableUsers);

    return result.map((json) => User.fromJson(json)).toList();
  }

  Future<int> update(User user) async {
    final db = await instance.database;

    return db.update(
        tableUsers,
        user.toJson(),
        where: '${UserFields.id} = ?',
        whereArgs: [user.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
        tableUsers,
        where: '${UserFields.id} = ?',
        whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}