import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Widget/single_item_nav_bar.dart';

class SingleItemPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: Color(0xFFF4F4F8),
     body: SafeArea(
       child: Padding(
         padding: EdgeInsets.only(top: 25,left: 15,right: 15),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Row(
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
                   onTap: (){
                     Navigator.pop(context);
                   },
                   child: Icon(
                     CupertinoIcons.cart_fill,
                     color: Colors.black,
                     size: 32,
                   ),
                 ),
               ],
             ),
             Padding(
               padding: EdgeInsets.symmetric(vertical: 10),
               child: Image.asset(
                 "images/1.png",
                 height: MediaQuery.of(context).size.height/1.7,
                 fit : BoxFit.cover,
               ),
             ),
             SizedBox(height: 10),
             Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Padding(
                     padding: EdgeInsets.only(right: 5),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text(
                         "Hot & Fresh Maakouda",
                         style: TextStyle(
                           color: Colors.black,
                           fontSize: 28,
                           fontWeight: FontWeight.bold,
                         ),
                       ),
                       Row(
                         children: [
                           InkWell(
                             onTap: (){},
                             child: Container(
                               alignment: Alignment.center,
                               width: 30,
                               height: 30,
                               decoration: BoxDecoration(
                                 color: Colors.white,
                                 borderRadius: BorderRadius.circular(5),
                               ),
                               child: Icon(
                                 CupertinoIcons.minus,
                                 size: 20,
                               ),
                             ),
                           ),

                           SizedBox(width: 8),
                           Text(
                             "3",
                             style: TextStyle(
                               color: Colors.black,
                               fontSize: 20,
                               fontWeight: FontWeight.bold,
                             ),
                           ),
                           SizedBox(width: 8),
                           InkWell(
                             onTap: () {},
                             child: Container(
                               alignment: Alignment.center,
                               width: 30,
                               height: 30,
                               decoration: BoxDecoration(
                                 color: Colors.white,
                                 borderRadius: BorderRadius.circular(5),
                               ),
                               child: Icon(
                                 CupertinoIcons.plus,
                                 size: 20,
                               ),
                             ),
                           ),
                         ],
                       ),
                     ],
                   ),
                 ),
                 SizedBox(height: 15),
                 Text(
                     "Maakouda ce sont des galettes ou croquettes de pommes de terre.",
                     style: TextStyle(
                       color: Colors.black54,
                       fontSize: 18,
                     ),
                 ),
               ],
             ),
           ],
         ),
       ),
     ),
     bottomNavigationBar: SingleItemNavBar(),
   );
  }

}
