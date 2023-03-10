import 'package:flutter/material.dart';

class CheckoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2A2C41),
        title: Text('Checkout'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Card(
            child: ListTile(
              title: Text('Maakouda'),
              subtitle: Text('Quantity: 3'),
              trailing: Text('30DH'),
            ),
          ),
          SizedBox(height: 16.0),
          Text('Total: 30DH', style: TextStyle(fontSize: 24.0)),
          SizedBox(height: 16.0),
          TextField(
            decoration: InputDecoration(
              labelText: 'Nom Complet',
            ),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Numero de carte',
            ),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Date D\'\expiration',
            ),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'CVV',
            ),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {},
            child: Text('Payer'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFFDBD50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
