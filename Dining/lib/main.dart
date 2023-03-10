import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/pages/checkout_page.dart';
import 'package:untitled/pages/home_page.dart';
import 'package:untitled/pages/restaurant_page.dart';
import 'package:untitled/pages/single_item_page.dart';

import 'Dao/restaurantDao.dart';
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

  void insertUser() async {
    //Restaurant newRestaurant = Restaurant(id: 4, name: "HouseOfStarck", address: "N 54 avenu Hassan.2");
    //await restaurantDAO.insert(newRestaurant);
    //List<Restaurant> allUsers = await restaurantDAO.getAllRestaurant();
    //print("All Restaurant: $allUsers");
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
        //"/": (context) => HomePage(),
        "singleItemPage": (context) => SingleItemPage(),
        "CheckoutPage": (context) => CheckoutPage(),
      },
    );
  }
}
