class Plat {
  int? id;
  String name;
  String description;
  double price;
  int? restaurantId;
  String imagePath;

  Plat({
    this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.restaurantId,
    required this.imagePath,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'restaurant_id': restaurantId,
      'imagePath' :    imagePath,
    };
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'price': price,
      'imagePath': imagePath,
    };
  }

  static Plat fromMap(Map<String, dynamic> map) {
    return Plat(
      id: map['id'] != null ? int.parse(map['id'].toString()) : null,
      name: map['name'],
      description: map['description'] ?? '',
      price: map['price'] != null ? double.parse(map['price'].toString()) : 0.0,
      restaurantId: map['restaurant_id'] != null ? int.parse(map['restaurant_id'].toString()) : null,
      imagePath: map['imagePath'],
    );
  }

  @override
  String toString() {
    return 'Plat{id: $id, name: $name, description: $description, price: $price, restaurantId: $restaurantId}';
  }
}
