// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bustracker/models/status_history_model.dart';
import 'package:bustracker/models/student_model.dart';
import 'package:bustracker/models/status_model.dart';

class StudentTracking {
  Student? student;
  Status? status;
  DateTime? statusTime;
  DateTime? startTime;
  DateTime? endTime;
  List<StatusTracking>? studentTrackingList = [];
  StudentTracking({this.student, this.status}) {
    setTrackingStatus(status!);
    startTime ??= statusTime;
  }
  setTrackingStatus(Status status) {
    studentTrackingList!.add(StatusTracking(status: status));
    this.status = status;
    statusTime = studentTrackingList!.last.time;
  }
}
