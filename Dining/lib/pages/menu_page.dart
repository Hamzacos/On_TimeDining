import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Model/plat.dart';
import '../Widget/home_nav_bar.dart';
import '../Widget/items_widget.dart';


class MenuPage extends StatelessWidget{
  final List<Plat> plats;
  final String restaurantName;

  const MenuPage({required this.plats, required this.restaurantName});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length:4,
        child:Scaffold(
          backgroundColor: Color(0xFFF4F4F8),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top:25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.black,
                        size: 32,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context,"CartPage");
                      },
                      child: Icon(
                        CupertinoIcons.cart_badge_plus,
                        color: Colors.black,
                        size: 35,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(restaurantName , style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text("Taste Of Heaven" , style: TextStyle(
                  color: Colors.black54,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                ),
              ),
              SizedBox(height: 30),
              TabBar(
                isScrollable: true,
                labelStyle: TextStyle(fontSize: 20),
                labelPadding: EdgeInsets.symmetric(horizontal: 20),
                labelColor: Color(0xFFFF724C),
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(text: "Burger"),
                  Tab(text: "Pizza"),
                  Tab(text: "Cheese"),
                  Tab(text: "Passta"),
                ],
              ),
              Flexible(
                flex: 1,
                child: TabBarView(
                  children: [
                    ItemsWidget(plats: plats),
                    ItemsWidget(plats: plats),
                    ItemsWidget(plats: plats),
                    ItemsWidget(plats: plats),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
         bottomNavigationBar: HomeNavBar(),
     ),
    );
  }


}
