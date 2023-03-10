

class Plat {
  int? id;
  String name;
  String description;
  double price;
  int restaurantId;

  Plat({
    this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.restaurantId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'restaurant_id': restaurantId,
    };
  }

  static Plat fromMap(Map<String, dynamic> map) {
    return Plat(
        id: map['id'],
        name: map['name'],
        description: map['description'],
        price: map['price'],
        restaurantId: map['restaurant_id'],
    );
  }
}