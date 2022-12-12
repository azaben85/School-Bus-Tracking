import 'dart:convert';

class Student {
  String? id;
  late String name;
  late String address;
  late String imageUrl;
  Student({
    this.id,
    required this.name,
    required this.address,
    required this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'address': address,
      'imageUrl': imageUrl,
    };
  }

  Student.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'] ?? '';
    address = map['address'];
    imageUrl = map['imageUrl'] ?? '';
  }
}
