import 'package:flutter/material.dart';

import '../Widget/home_nav_bar.dart';
import '../Widget/items_widget.dart';


class HomePage extends StatelessWidget{

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
                      onTap: () {},
                      child: Icon(
                        Icons.sort_rounded,
                        color: Colors.black,
                        size: 35,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.search,
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
                  child: Text("Kool & Moot" , style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text("With khanz & Bnin" , style: TextStyle(
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
                  Tab(text: "Maakouda"),
                  Tab(text: "Pizza"),
                  Tab(text: "Cheese"),
                  Tab(text: "Passta"),
                ],
              ),
              Flexible(
                flex: 1,
                child: TabBarView(
                  children: [
                    ItemsWidget(),
                    ItemsWidget(),
                    ItemsWidget(),
                    ItemsWidget(),
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
