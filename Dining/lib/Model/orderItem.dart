

class OrderItem {
  int? id;
  int quantity;
  double price;
  int orderId;
  int platId;

  OrderItem({
    this.id,
    required this.quantity,
    required this.price,
    required this.orderId,
    required this.platId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'quantity': quantity,
      'price': price,
      'order_id': orderId,
      'plat_id': platId,
    };
  }

  static OrderItem fromMap(Map<String, dynamic> map) {
    return OrderItem(
      id: map['id'],
      quantity: map['quantity'],
      price: map['price'],
      orderId: map['order_id'],
      platId: map['plat_id'],
    );
  }
}