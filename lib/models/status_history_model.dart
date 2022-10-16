// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bustracker/models/status_model.dart';

class StatusTracking {
  Status? status;
  DateTime? time;
  StatusTracking({
    this.status,
  }) {
    this.time = DateTime.now();
  }
}
