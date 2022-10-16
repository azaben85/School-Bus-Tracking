import 'package:bustracker/models/status_model.dart';
import 'package:bustracker/models/student_tracking_model.dart';

class TravelHeader {
  Status? headerStatus;
  DateTime? startTime;
  DateTime? endTime;
  List<StudentTracking>? studentTracking;
  TravelHeader({
    this.headerStatus,
    this.startTime,
    this.endTime,
    this.studentTracking,
  });
}
