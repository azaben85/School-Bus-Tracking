import 'package:bustracker/models/travel_tracking_header_model.dart';
import 'package:bustracker/repositories/travel_header_list.dart';
import 'package:bustracker/views/screens/bus_tracking.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  HistoryScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 252, 208, 143),
      child: ListView.builder(
        itemCount: travelHeaderList.length,
        itemBuilder: (context, index) {
          return InkWell(
              child: Text(
                  'Tracking $index @ ${travelHeaderList[index].startTime}'),
              onTap: (() {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return BusTrackingScreen(
                      travelHeader: travelHeaderList[index],
                    );
                  },
                ));
              }));
        },
      ),
    );
  }
}
