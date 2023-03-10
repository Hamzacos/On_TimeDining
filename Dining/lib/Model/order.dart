class Order {
  int? id;
  String date;
  double totalPrice;
  int userId;
  int restaurantId;

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
      id: map['id'],
      date: map['date'],
      totalPrice: map['total_price'],
      userId: map['user_id'],
      restaurantId: map['restaurant_id'],
    );
  }
}