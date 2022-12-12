class Journey {
  String? id;
  String? status;
  String? startTime;
  String? endTime;
  Journey({
    this.id,
    this.status,
    this.startTime,
    this.endTime,
  });

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'startTime': startTime,
      'endTime': endTime,
    };
  }

  factory Journey.fromMap(Map<String, dynamic> map) {
    return Journey(
      status: map['status'],
      startTime: map['startTime'],
      endTime: map['endTime'],
    );
  }
}
