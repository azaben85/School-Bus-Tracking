import 'package:bustracker/models/student_model.dart';

List<Map<String, dynamic>> students = [
  {
    'name': 'Ahmad Zaben',
    'address': 'Nablus, Rafedia',
  },
  {
    'name': 'Omar Zaben',
    'address': 'Nablus, Nablus AlJadeeda',
  },
  {
    'name': 'Osama Saleh',
    'address': 'Nablus, Balata',
  },
  {
    'name': 'Khaled Salamah',
    'address': 'Nablus, Nablus AlJadeeda',
  },
];

List<Student> students_model = students.map((e) => Student.fromMap(e)).toList();
