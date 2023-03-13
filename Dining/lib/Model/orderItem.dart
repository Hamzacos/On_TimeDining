

class OrderItem {
  int? id;
  String name;
  int quantity;
  double price;
  int? orderId;
  int platId;
  String? imagePath;

  OrderItem({
    this.id,
    required this.name,
    required this.quantity,
    required this.price,
    required this.orderId,
    required this.platId,
    required this.imagePath,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name' : name,
      'quantity': quantity,
      'price': price,
      'order_id': orderId,
      'plat_id': platId,
      'imagePath' : imagePath,
    };
  }


  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'quantity': quantity,
    'price': price,
    'orderId': orderId,
    'platId': platId,
    'imagePath': imagePath,
  };


  static OrderItem fromMap(Map<String, dynamic> map) {
      return OrderItem(
        id: map['id'],
        name: map['name'],
        quantity: map['quantity'],
        price: map['price'],
        orderId: map['order_id'],
        platId: map['plat_id'],
        imagePath : map['imagePath'],
      );
    }

  @override
  String toString() {
    return 'OrderItem{id: $id, name: $name, quantity: $quantity, price: $price, orderId: $orderId, platId: $platId, imagePath: $imagePath}';
  }
}
