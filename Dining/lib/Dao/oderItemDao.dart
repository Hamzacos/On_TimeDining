import '../Data/database.dart';
import '../Model/orderItem.dart';

class OrderDAOItem{

  //static final OrderDAOItem instance = OrderDAOItem._privateConstructor();

  //OrderDAOItem._privateConstructor();

  Future<int> insert(OrderItem orderItem) async {
    final db = await DatabaseHelper.instance.database;
    return await db.insert(DatabaseHelper.tableOrderItem, orderItem.toMap());
  }

  Future<int> update(OrderItem orderItem) async {
    final db = await DatabaseHelper.instance.database;
    return await db.update(DatabaseHelper.tableOrderItem, orderItem.toMap(),
        where: '${DatabaseHelper.columnOrderItemId} = ?', whereArgs: [orderItem.id]);
  }

  Future<int> delete(int id) async {
    final db = await DatabaseHelper.instance.database;
    return await db.delete(DatabaseHelper.tableOrderItem,
        where: '${DatabaseHelper.columnOrderItemId} = ?', whereArgs: [id]);
  }

  Future<List<OrderItem>> getAllItem() async {
    final db = await DatabaseHelper.instance.database;
    final results = await db.query(DatabaseHelper.tableOrderItem);
    return results.map((map) => OrderItem.fromMap(map)).toList();
  }
}