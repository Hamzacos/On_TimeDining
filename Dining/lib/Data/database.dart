import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final _databaseName = 'dining.db';
  static final _databaseVersion = 1;

  static final tableUser = 'user';
  static final columnUserId = 'id';
  static final columnUserEmail = 'email';
  static final columnUserPhone = 'phone';
  static final columnUserName = 'username';

  static final tableRestaurant = 'restaurant';
  static final columnRestaurantId = 'id';
  static final columnRestaurantName = 'name';
  static final columnRestaurantAddress = 'address';
  static final columnRestaurantImagePath = 'imagePath';

  static final tableOrder = 'orders';
  static final columnOrderId = 'id';
  static final columnOrderDate = 'date';
  static final columnOrderTotalPrice = 'total_price';
  static final columnOrderUserId = 'user_id';
  static final columnOrderRestaurantId = 'restaurant_id';

  static final tableOrderItem = 'order_item';
  static final columnOrderItemId = 'id';
  static final columnOrderItemName = 'name';
  static final columnOrderItemQuantity = 'quantity';
  static final columnOrderItemPrice = 'price';
  static final columnOrderItemImagePath = 'imagePath';
  static final columnOrderItemOrderId = 'order_id';
  static final columnOrderItemPlatId = 'plat_id';

  static final tablePlat = 'plat';
  static final columnPlatId = 'id';
  static final columnPlatName = 'name';
  static final columnPlatDescription = 'description';
  static final columnPlatPrice = 'price';
  static final columnPlatRestaurantId = 'restaurant_id';
  static final columnPlatImagePath = 'imagePath';

  // make this a singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final documentsDirectory = await getDatabasesPath();
    final path = join(documentsDirectory, _databaseName);
    return await openDatabase(path, version: _databaseVersion, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableUser (
        $columnUserId INTEGER PRIMARY KEY AUTOINCREMENT,
        $columnUserEmail TEXT NOT NULL,
        $columnUserPhone TEXT NOT NULL,
        $columnUserName TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE $tableRestaurant (
  $columnRestaurantId INTEGER PRIMARY KEY AUTOINCREMENT,
  $columnRestaurantName TEXT NOT NULL,
  $columnRestaurantAddress TEXT NOT NULL,
  $columnRestaurantImagePath TEXT NOT NULL
)
''');

    await db.execute('''
      CREATE TABLE $tableOrder (
        $columnOrderId INTEGER PRIMARY KEY AUTOINCREMENT,
        $columnOrderDate TEXT NOT NULL,
        $columnOrderTotalPrice REAL NOT NULL,
        $columnOrderUserId INTEGER NOT NULL,
        $columnOrderRestaurantId INTEGER NOT NULL,
        FOREIGN KEY ($columnOrderUserId) REFERENCES $tableUser ($columnUserId),
        FOREIGN KEY ($columnOrderRestaurantId) REFERENCES $tableRestaurant ($columnRestaurantId)
      )
    ''');

    await db.execute('''
      CREATE TABLE $tableOrderItem (
        $columnOrderItemId INTEGER PRIMARY KEY AUTOINCREMENT,
        $columnOrderItemName TEXT NOT NULL,
        $columnOrderItemQuantity INTEGER NOT NULL,
        $columnOrderItemPrice REAL NOT NULL,
        $columnOrderItemOrderId INTEGER NOT NULL,
        $columnOrderItemPlatId INTEGER NOT NULL,
        $columnOrderItemImagePath TEXT NOT NULL,
        FOREIGN KEY ($columnOrderItemOrderId) REFERENCES $tableOrder ($columnOrderId),
        FOREIGN KEY ($columnOrderItemPlatId) REFERENCES $tablePlat ($columnPlatId)
      )
    ''');

    await db.execute('''
      CREATE TABLE $tablePlat (
        $columnPlatId INTEGER PRIMARY KEY AUTOINCREMENT,
        $columnPlatName TEXT NOT NULL,
        $columnPlatDescription TEXT NOT NULL,
        $columnPlatPrice REAL NOT NULL,
        $columnPlatRestaurantId INTEGER NOT NULL,
        $columnRestaurantImagePath TEXT NOT NULL,
        FOREIGN KEY ($columnPlatRestaurantId) REFERENCES $tableRestaurant ($columnRestaurantId)
      )
    ''');
  }

  Future<int> insert(String table, Map<String, dynamic> row) async {
    final db = await instance.database;
    return await db.insert(table, row);
  }

  Future<int> update(String table, Map<String, dynamic> row) async {
    final db = await instance.database;
    final id = row['id'];
    return await db.update(table, row, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> delete(String table, String whereClause, List<dynamic> whereArgs) async {
    final db = await instance.database;
    return await db.delete(table, where: whereClause, whereArgs: whereArgs);
  }

  Future<List<Map<String, dynamic>>> queryAll(String table) async {
    final db = await instance.database;
    return await db.query(table);
  }

  Future<List<Map<String, dynamic>>> query(String table, String whereClause, List<dynamic> whereArgs) async {
    final db = await instance.database;
    return await db.query(table, where: whereClause, whereArgs: whereArgs);
  }

  Future<void> DeleteDatabase() async {
    final documentsDirectory = await getDatabasesPath();
    final path = join(documentsDirectory, _databaseName);
    await deleteDatabase(path);
    _database = null;
  }

}
