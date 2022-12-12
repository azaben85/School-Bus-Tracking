// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bustracker/components/custom_appbar_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomScaffold extends StatelessWidget {
  Widget? floatingActionButton;
  Widget? body;
  Widget? bottom;
  String? title;
  List<Widget>? actions;
  CustomScaffold({
    this.floatingActionButton,
    this.body,
    this.title,
    this.bottom,
    this.actions,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: AppBar(
          elevation: 1,
          title: title != null && bottom == null
              ? Text(
                  title ?? '',
                  style: TextStyle(color: Colors.black),
                )
              : null,
          centerTitle: true,
          backgroundColor: Colors.white,
          //   bottom: CustomBottomAppBar(title: bottom ?? Text(title ?? '')),
          actions: actions,
        ),
        body: body);
  }
}
