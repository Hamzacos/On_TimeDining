import 'package:flutter/material.dart';

import '../Dao/platDao.dart';
import '../Dao/restaurantDao.dart';
import '../Model/plat.dart';
import '../Model/restaurant.dart';
import '../Widget/home_nav_bar.dart';
import 'menu_page.dart';

class RestaurantListPage extends StatefulWidget {
  @override
  _RestaurantListPageState createState() => _RestaurantListPageState();
}

class _RestaurantListPageState extends State<RestaurantListPage> {
  List<Restaurant> _restaurants = [];
  PlatDAO platDAO = PlatDAO();

  @override
  void initState() {
    super.initState();
    _loadRestaurants();
  }

  Future<void> _loadRestaurants() async {
    final restaurantService = RestaurantDAO();
    final restaurants = await restaurantService.getAllRestaurant();
    setState(() {
      _restaurants = restaurants;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
        leading: Icon(Icons.menu),
        title: Text('Restaurants'),
        actions: [
          Icon(Icons.favorite),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.search),
          ),
          Icon(Icons.more_vert),
        ],
        backgroundColor:  Color(0xFFFF724C),
      ),
      body: ListView.builder(
        itemCount: _restaurants.length,
        itemBuilder: (context, index) {
          final restaurant = _restaurants[index];
          return Container(
            margin: EdgeInsets.all(8.0),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              child: InkWell(
                onTap: () async {
                  List<Plat> plats =
                  await platDAO.getPlatsByRestaurant(restaurant.id!);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MenuPage(
                          plats: plats,
                          restaurantName: restaurant.name,
                      ),
                    ),
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0),
                      ),
                      child: Image.network(
                        restaurant.imagePath,
                        height: 150,
                        fit: BoxFit.fill,
                      ),
                    ),
                    ListTile(
                      title: Text(restaurant.name),
                      subtitle: Text(restaurant.address),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: HomeNavBar(),
    );
  }
}
