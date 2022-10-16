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

class StatusButtonWidget extends StatelessWidget {
  Status? status;
  StatusButtonWidget({super.key, this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(1),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: status!.color!)),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child:
              Text('${status!.desc}', style: TextStyle(color: status!.color!)),
        ));
  }
}
