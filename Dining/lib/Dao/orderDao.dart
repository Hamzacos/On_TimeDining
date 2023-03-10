
import '../Data/database.dart';
import '../Model/order.dart';

class OrderDAO {

  static final OrderDAO instance = OrderDAO._privateConstructor();

  OrderDAO._privateConstructor();

  Future<int> insert(Order order) async {
    final db = await DatabaseHelper.instance.database;
    return await db.insert(DatabaseHelper.tableOrder, order.toMap());
  }

  Future<int> update(Order order) async {
    final db = await DatabaseHelper.instance.database;
    return await db.update(DatabaseHelper.tableOrder, order.toMap(),
        where: '${DatabaseHelper.columnOrderId} = ?', whereArgs: [order.id]);
  }

  Future<int> delete(int id) async {
    final db = await DatabaseHelper.instance.database;
    return await db.delete(DatabaseHelper.tableRestaurant,
        where: '${DatabaseHelper.columnRestaurantId} = ?', whereArgs: [id]);
  }
}
