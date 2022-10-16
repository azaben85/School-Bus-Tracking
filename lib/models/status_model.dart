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
  Status start = Status(code: '10', desc: 'In the way', color: Colors.red);
  Status near =
      Status(code: '15', desc: 'Close to the target', color: Colors.blue);
  Status completed =
      Status(code: '20', desc: 'In the target', color: Colors.green);
  Status confirmedByParent = Status(
      code: '25',
      desc: 'Confirmed by Parents',
      color: const Color.fromARGB(255, 5, 85, 8));

  Status changedDirection = Status(
      code: '05', desc: 'Pending, The track was changed', color: Colors.black);
}
