



class User {
  int? id;
  String email;
  String phone;
  String username;

  User({
    this.id,
    required this.email,
    required this.phone,
    required this.username,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'phone': phone,
      'username': username,
    };
  }

  static User fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      email: map['email'],
      phone: map['phone'].toString(),
      username: map['username'],
    );
  }

  @override
  String toString() {
    return 'User{id: $id, email: $email, phone: $phone, username: $username}';
  }
}

