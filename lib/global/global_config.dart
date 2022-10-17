import 'package:flutter/material.dart';

String formatDate(DateTime dateTime) {
  String formattedDate =
      '${dateTime.year.toString()}/${dateTime.month.toString().padLeft(2, '0')}/${dateTime.day.toString().padLeft(2, '0')} ${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}:${dateTime.second.toString().padLeft(2, '0')}';

  return formattedDate;
}

Color globalBackgroundColor = Color.fromARGB(255, 228, 203, 165);
