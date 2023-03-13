import 'package:flutter/material.dart';
import 'package:untitled/Dao/orderDao.dart';
import 'package:untitled/Model/order.dart';

class OrderListPage extends StatefulWidget {

  @override
  _OrderListPageState createState() => _OrderListPageState();
}

class _OrderListPageState extends State<OrderListPage> {
  List<Order> _Order = [];

  @override
  void initState() {
    super.initState();
    loadOrder();
  }

  Future<void> loadOrder() async {
    final orderService = OrderDAO();
    final orders = await orderService.getAllOrder();
    setState(() {
      _Order = orders;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2A2C41),
        title: Text('Commandes'),
        actions: [
          IconButton(
            icon: Icon(Icons.link),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: ListView.builder(
      itemCount: _Order.length,
      itemBuilder: (context, index) {
      final orders = _Order[index];
      return ListTile(
        title: Text('Order #${orders.id}'),
        subtitle: Text(
            'Date: ${orders.date} --- Total Price: ${orders.totalPrice} DH'),
      );
        }
      ),
    );
    }
  }

