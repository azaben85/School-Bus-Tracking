class Student {
  String? name;
  String? address;
  Student.fromMap(Map<String, dynamic> student) {
    name = student['name'];
    address = student['address'];
  }
}
