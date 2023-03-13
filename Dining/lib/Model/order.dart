class Order {
  int? id;
  String date;
  double totalPrice;
  int? userId;
  int? restaurantId;

  Order({
    this.id,
    required this.date,
    required this.totalPrice,
    required this.userId,
    required this.restaurantId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date,
      'total_price': totalPrice,
      'user_id': userId,
      'restaurant_id': restaurantId,
    };
  }

  static Order fromMap(Map<String, dynamic> map) {
    return Order(
      id: map['id']!= null ? int.parse(map['id'].toString()) : null,
      date: map['date'] ?? '',
      totalPrice: map['total_price']!= null ? double.parse(map['total_price'].toString()) : 0.0,
      userId: map['user_id'] != null ? int.parse(map['user_id'].toString()) : null,
      restaurantId: map['restaurant_id'] != null ? int.parse(map['restaurant_id'].toString()) : null,
    );
  }

  @override
  String toString() {
    return 'Order{id: $id, date: $date, totalPrice: $totalPrice, userId: $userId, restaurantId: $restaurantId}';
  }
}