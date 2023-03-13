import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled/Model/order.dart';
import 'package:untitled/Model/orderItem.dart';
import 'package:untitled/Model/plat.dart';
import 'package:untitled/pages/menu_page.dart';
import 'package:untitled/pages/order_page.dart';
import 'package:untitled/pages/restaurant_page.dart';
import 'package:untitled/pages/cart_page.dart';
import 'package:path/path.dart';


import 'Dao/oderItemDao.dart';
import 'Dao/orderDao.dart';
import 'Dao/platDao.dart';
import 'Dao/restaurantDao.dart';
import 'Data/database.dart';
import 'Model/restaurant.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  RestaurantDAO restaurantDAO = RestaurantDAO();
  PlatDAO platDAO = PlatDAO();
  OrderDAO orderDAO = OrderDAO();
  OrderDAOItem orderDAOItem = OrderDAOItem();

  void insertUser() async {
    //Restaurant newRestaurant =Restaurant(id: 4, name: "KonoHa", address: "Avenue HASSAN ||",imagePath: "https://konoha.com.tr/subeler/acibadem.jpeg");
    //await restaurantDAO.insert(newRestaurant);
    //List<Restaurant> allUsers = await restaurantDAO.getAllRestaurant();
    //print("All Restaurant: $allUsers");
    //await DatabaseHelper.instance.DeleteDatabase();
    //Plat newPlat =Plat(id:4 ,name: "Quebec Burger", description: " Cheese curds, bacon, grilled onions topped with French fries and house gravy", price:105, imagePath:"https://bigseventravel.com/wp-content/uploads/2019/09/La-Belle-et-La-Boeuf.jpg", restaurantId:1);
    //await platDAO.insert(newPlat);
    /*List<Plat> allPlat = await platDAO.getPlatsByRestaurant(4);
    print("All Plat: $allPlat");*/
   /* await platDAO.delete(1);
    await platDAO.delete(2);
    print("SUCCED");*/

    //List<Order> allUsers = await orderDAO.getAllOrder();
    //print("All Order: $allUsers");
  }



  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    super.initState();
    insertUser();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/" : (context) => RestaurantListPage(),
        "OrderListPage": (context) => OrderListPage(),
        "CartPage": (context) => CartPage(),
      },
    );
  }
}
