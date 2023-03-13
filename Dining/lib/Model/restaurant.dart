

class Restaurant {
  int? id;
  String name;
  String address;
  String imagePath;

  Restaurant({
    this.id,
    required this.name,
    required this.address,
    required this.imagePath,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'imagePath' : imagePath,
    };
  }

  static Restaurant fromMap(Map<String, dynamic> map) {
    return Restaurant(
      id: map['id'],
      name: map['name'],
      address: map['address'],
      imagePath: map['imagePath'],
    );
  }

  @override
  String toString() {
    return 'Restaurant{id: $id, name: $name, address: $address, imagePath: $imagePath}';
  }
}