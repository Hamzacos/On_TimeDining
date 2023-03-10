import '../Data/database.dart';
import '../Model/restaurant.dart';


class RestaurantDAO {

  //static final RestaurantDAO instance = RestaurantDAO._privateConstructor();
  //RestaurantDAO._privateConstructor();

  Future<int> insert(Restaurant restaurant) async {
    final db = await DatabaseHelper.instance.database;
    return await db.insert(DatabaseHelper.tableRestaurant, restaurant.toMap());
  }

  Future<int> update(Restaurant restaurant) async {
    final db = await DatabaseHelper.instance.database;
    return await db.update(DatabaseHelper.tableRestaurant, restaurant.toMap(), where: '${DatabaseHelper.columnRestaurantId} = ?', whereArgs: [restaurant.id]);
  }

  Future<int> delete(int id) async {
    final db = await DatabaseHelper.instance.database;
    return await db.delete(DatabaseHelper.tableRestaurant, where: '${DatabaseHelper.columnRestaurantId} = ?', whereArgs: [id]);
  }

  Future<List<Restaurant>> getAllRestaurant() async {
    final db = await DatabaseHelper.instance.database;
    final results = await db.query(DatabaseHelper.tableRestaurant);
    return results.map((map) => Restaurant.fromMap(map)).toList();
  }

  Future<Restaurant?> query(int id) async {
    final db = await DatabaseHelper.instance.database;
    final result = await db.query(DatabaseHelper.tableRestaurant, where: '${DatabaseHelper.columnRestaurantId} = ?', whereArgs: [id]);
    if (result.isNotEmpty) {
      return Restaurant.fromMap(result.first);
    }
    return null;
  }
}
