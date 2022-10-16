import 'package:bustracker/models/status_history_model.dart';
import 'package:bustracker/models/status_model.dart';
import 'package:bustracker/views/widgets/status_widget.dart';
import 'package:flutter/material.dart';

class TackingArea extends StatelessWidget {
  List<StatusTracking>? studentTrackingList;
  TackingArea({super.key, this.studentTrackingList});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(5),
        color: Colors.white,
        child: ListView.builder(
          itemCount: studentTrackingList!.length,
          itemBuilder: (context, index) {
            DateTime? dateTime = studentTrackingList![index].time;
            String time =
                '${dateTime!.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}:${dateTime.second.toString().padLeft(2, '0')}';
            return TrackingRecord(
                time: time, status: studentTrackingList![index].status!);
          },
        ),
      ),
    );
  }
}

class TrackingRecord extends StatelessWidget {
  const TrackingRecord({
    super.key,
    required this.time,
    required this.status,
  });

  final String time;
  final Status status;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: Colors.black,
          height: 30,
          width: 60,
          child: const Icon(
            Icons.arrow_downward,
            color: Colors.white,
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 30,
              width: 60,
              color: Colors.black,
              child: Center(
                child: Text(
                  time,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const Icon(
              Icons.arrow_right,
              size: 30,
            ),
            StatusWidget(
              status: status,
            )
          ],
        ),
      ],
    );
  }
}
