import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SingleItemNavBar extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
      height: 80,
      padding:EdgeInsets.symmetric(horizontal: 15),
      /*decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            spreadRadius: 1,
            blurRadius: 8,
          ),
        ],
      ),*/
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(children: [
            Text("Total Price",style: TextStyle(
              color: Colors.black54,
              fontSize: 23,
              fontWeight: FontWeight.w500,
            ),
            ),
            SizedBox(height: 10),
            Text("30DH",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
          ),
          InkWell(
            onTap: (){},
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 15,horizontal: 20),
              decoration: BoxDecoration(
                color: Color(0xFFFF724C),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),

              ),
              child: Row(
                children: [
                  Text("Buy Now",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 10),
                  InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, "CheckoutPage");
                    },
                    child: Icon(
                      CupertinoIcons.cart_fill,
                      color: Colors.white,
                        size: 30
                    ),
                  ),
                 // Icon(CupertinoIcons.cart_fill,color: Colors.white,size: 30,),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
