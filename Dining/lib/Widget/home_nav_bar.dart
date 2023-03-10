import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HomeNavBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
       padding: EdgeInsets.symmetric(horizontal: 15),
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            spreadRadius: 1,
            blurRadius: 8,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.mail,
            color: Colors.grey,
            size: 35,
          ),
          Icon(
            Icons.favorite_outlined,
            color: Colors.grey,
            size: 35,
          ),
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Color(0xFFFF724C),
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  spreadRadius: 1,
                  blurRadius: 6,
                ),
              ],
            ),
            child: Icon(
              CupertinoIcons.cart_fill,
              color: Colors.white,
              size: 30,
            ),
          ),
          Icon(
            Icons.notifications,
            color: Colors.grey,
            size: 35,
          ),
          Icon(
            Icons.person,
            color: Colors.grey,
            size: 35,
          ),
        ],
      ),
    );
  }

}
