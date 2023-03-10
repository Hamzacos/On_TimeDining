
import '../Data/database.dart';
import '../Model/plat.dart';

class PlatDAO{

  static final PlatDAO instance = PlatDAO._privateConstructor();

  PlatDAO._privateConstructor();

  Future<int> insert(Plat plat) async {
    final db = await DatabaseHelper.instance.database;
    return await db.insert(DatabaseHelper.tablePlat, plat.toMap());
  }

  Future<int> update(Plat plat) async {
    final db = await DatabaseHelper.instance.database;
    return await db.update(DatabaseHelper.tablePlat, plat.toMap(),
        where: '${DatabaseHelper.columnPlatId} = ?', whereArgs: [plat.id]);
  }

  Future<int> delete(int id) async {
    final db = await DatabaseHelper.instance.database;
    return await db.delete(DatabaseHelper.tablePlat,
        where: '${DatabaseHelper.columnPlatId} = ?', whereArgs: [id]);
  }
}