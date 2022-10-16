import 'package:flutter/material.dart';

class Status {
  String? code;
  String? desc;
  Color? color;
  Status({this.code, this.desc, this.color});
}

class HeaderStatus {
  Status pending = Status(code: '00', desc: 'Pending', color: Colors.black);
  Status start = Status(code: '10', desc: 'Start', color: Colors.red);
  Status completed = Status(code: '20', desc: 'Completed', color: Colors.green);
}

class StudentStatus {
  Status pending = Status(code: '00', desc: 'Pending', color: Colors.black);
  Status start = Status(code: '10', desc: 'Start', color: Colors.red);
  Status completed = Status(code: '20', desc: 'Completed', color: Colors.green);
}
