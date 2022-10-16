import 'package:bustracker/models/status_model.dart';
import 'package:flutter/material.dart';

class StatusWidget extends StatelessWidget {
  Status? status;
  StatusWidget({super.key, this.status});

  @override
  Widget build(BuildContext context) {
    return Text('${status!.desc}', style: TextStyle(color: status!.color!));
  }
}
