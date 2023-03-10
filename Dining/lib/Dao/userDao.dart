import '../Data/database.dart';
import '../Model/user.dart';


class UserDAO {
  static final _tableName = DatabaseHelper.tableUser;

  Future<int> addUser(User user) async {
    final db = await DatabaseHelper.instance.database;
    return db.insert(_tableName, user.toMap());
  }

  Future<int> updateUser(User user) async {
    final db = await DatabaseHelper.instance.database;
    return db.update(_tableName, user.toMap(), where: '${DatabaseHelper.columnUserId} = ?', whereArgs: [user.id]);
  }

  Future<int> deleteUser(int id) async {
    final db = await DatabaseHelper.instance.database;
    return db.delete(_tableName, where: '${DatabaseHelper.columnUserId} = ?', whereArgs: [id]);
  }

  Future<List<User>> getAllUsers() async {
    final db = await DatabaseHelper.instance.database;
    final results = await db.query(_tableName);
    return results.map((map) => User.fromMap(map)).toList();
  }

  Future<User?> getUserById(int id) async {
    final db = await  DatabaseHelper.instance.database;
    final result = await db.query('users', where: 'id = ?', whereArgs: [id]);

    if (result.isNotEmpty) {
      return User.fromMap(result.first);
    }
    return null;
  }
}
