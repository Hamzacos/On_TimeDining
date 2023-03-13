import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/Model/orderItem.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

import '../Dao/oderItemDao.dart';
import '../Dao/orderDao.dart';
import '../Model/order.dart';

class CartPage extends StatefulWidget {

  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<Map<String, dynamic>> items = [];
  OrderDAO orderDAO = OrderDAO();
  OrderDAOItem orderDAOItem = OrderDAOItem();

  @override
  void initState() {
    super.initState();
    _getItemsFromStorage();
  }

  Future<void> _getItemsFromStorage() async {
    final prefs = await SharedPreferences.getInstance();
    final itemsJson = prefs.getStringList('cartItems') ?? [];
    final items = List<Map<String, dynamic>>.from(itemsJson.map((item) => json.decode(item)));
    setState(() {
      this.items = items;
    });
    print(items);
  }

  Future<void> _updateQuantity(int index, int quantity) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? itemsJson = prefs.getStringList('cartItems');
    if (itemsJson != null) {
      Map<String, dynamic> item = json.decode(itemsJson[index]);
      item['quantity'] = quantity;
      itemsJson[index] = json.encode(item);
      await prefs.setStringList('cartItems', itemsJson);
      setState(() {
        items[index]['quantity'] = quantity;
      });
    }
  }

  void _removeItemFromStorage(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? itemsJson = prefs.getStringList('cartItems');
    if (itemsJson != null) {
      itemsJson.removeAt(index);
      await prefs.setStringList('cartItems', itemsJson);
      setState(() {
        items.removeAt(index);
      });
    }
  }

  double getTotalPrice() {
    double total = 0;
    for (var item in items) {
      total += item['price'] * item['quantity'];
    }
    return total;
  }

  Future<void> saveOrder(List<Map<String, dynamic>> items) async {
    final now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
    final String formattedDate = formatter.format(now);

    final Order orderObject = Order(
      date: formattedDate,
      totalPrice: getTotalPrice(),
      userId: 1,
      restaurantId: 1,
    );
    final orderId = await orderDAO.insert(orderObject);
    print(orderObject);
    for (var item in items) {
      final OrderItem orderItem =OrderItem(
          name: item['name'],
          quantity: item['quantity'],
          price: item['price' ],
          orderId: orderId,
          platId: item['platId'],
          imagePath: item['imagePath']
      );
      await orderDAOItem.insert(orderItem);
      print(orderItem);
    }
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('cartItems');
    Navigator.pushNamed(context,"OrderListPage");

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2A2C41),
        title: Text('Mon Panier'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = items[index];
                  if(item['imagePath'] != null){
                    print("hello");
                  }else{
                    print("faill");
                  }
                  return Card(
                    child: ListTile(
                      title: Text(item['name'] ?? ''),
                      leading: item['imagePath'] != null
                          ? Image.network(
                        item['imagePath'],
                        width: 50,
                        height: 50,
                      )
                          : Container(),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${item['price'] ?? 0}DH'),
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.remove),
                                onPressed: () {
                                  if (item['quantity'] > 1) {
                                    _updateQuantity(
                                        index, item['quantity'] - 1);
                                  }
                                },
                              ),
                              Text('${item['quantity'] ?? 0}'),
                              IconButton(
                                icon: Icon(Icons.add),
                                onPressed: () {
                                  _updateQuantity(index, item['quantity'] + 1);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => _removeItemFromStorage(index),
                      ),
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Prix Total : ${getTotalPrice()}DH'),
                ElevatedButton(
                  onPressed: () async {
                    await saveOrder(items);
                  },
                  child: Text('Valider la commande'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFDBD50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ], // Add this closing bracket
        ), // Add this closing bracket
      ),
    );
  }
}
