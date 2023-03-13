import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/orderItem.dart';
import '../Model/plat.dart';


class ItemsWidget extends StatelessWidget {
  final List<Plat> plats;


  Future<void> _addToCart(BuildContext context, Plat plat) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> cartItems = prefs.getStringList('cartItems') ?? [];
    OrderItem item = OrderItem(
      name: plat.name,
      quantity: 1,
      price: plat.price,
      platId: plat.id!,
      orderId: null,
      imagePath: plat.imagePath,
    );
    cartItems.add(jsonEncode(item.toJson()));
    await prefs.setStringList('cartItems', cartItems);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(
          "${plat.name} a été ajouté au panier",
      ),
        backgroundColor: Colors.green,
      ),
    );
  }
  const ItemsWidget({
    Key? key,
    required this.plats,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: plats.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.78,
      ),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        Plat plat = plats[index];
        return InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 13),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xFFF4F4F8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  spreadRadius: 1,
                  blurRadius: 8,
                ),
              ],
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: Image.network(
                    plat.imagePath,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      plat.name,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    child: Text(
                      plat.description,
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${plat.price.toStringAsFixed(2)} DH',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _addToCart(context,plat);
                        },
                        child: Icon(
                          CupertinoIcons.cart_badge_plus,
                          size: 25,
                          color: Color(0xFFFFDBF50),
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
