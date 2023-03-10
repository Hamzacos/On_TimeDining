

class Restaurant {
  int? id;
  String name;
  String address;

  Restaurant({
    this.id,
    required this.name,
    required this.address,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'address': address,
    };
  }

  static Restaurant fromMap(Map<String, dynamic> map) {
    return Restaurant(
      id: map['id'],
      name: map['name'],
      address: map['address'],
    );
  }

  @override
  String toString() {
    return 'Restaurant{id: $id, name: $name, address: $address}';
  }
}