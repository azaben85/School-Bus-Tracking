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
  Status pending = Status(
      code: '00', desc: 'Pending', color: Color.fromARGB(255, 200, 255, 99));

  Status start = Status(
      code: '10',
      desc: 'In the way',
      color: const Color.fromRGBO(251, 244, 228, 1));
  Status near = Status(
      code: '15',
      desc: 'Close to the home',
      color: const Color.fromRGBO(178, 197, 196, 1));
  Status completed = Status(
      code: '20', desc: 'Arrived', color: Color.fromRGBO(214, 241, 212, 1));
  Status confirmedByParent = Status(
      code: '25',
      desc: 'Confirmed by Parents',
      color: const Color.fromARGB(255, 5, 85, 8));

  Status changedDirection = Status(
      code: '05',
      desc: 'Pending, The track was changed',
      color: Color.fromRGBO(255, 81, 81, 0.658));
}
