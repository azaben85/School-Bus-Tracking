// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bustracker/global/global_config.dart';
import 'package:bustracker/views/widgets/label_widget.dart';
import 'package:bustracker/views/widgets/status_widget.dart';
import 'package:flutter/material.dart';

import 'package:bustracker/models/travel_tracking_header_model.dart';
import 'package:bustracker/data_repositories/travel_header_list.dart';
import 'package:bustracker/views/BusTrackingScreen/bus_tracking.dart';

class HistoryScreen extends StatelessWidget {
  HistoryScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: globalBackgroundColor,
      child: ListView.builder(
        itemCount: travelHeaderList.length,
        itemBuilder: (context, index) {
          return HistoryTrackCard(
            travelHeader: travelHeaderList[index],
          );
        },
      ),
    );
  }
}

class HistoryTrackCard extends StatelessWidget {
  TravelHeader travelHeader;
  HistoryTrackCard({
    Key? key,
    required this.travelHeader,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 255, 205, 129),
      child: InkWell(
          onTap: (() {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) {
                return BusTrackingScreen(
                  travelHeader: travelHeader,
                );
              },
            ));
          }),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LabelValue(
                  label: 'Tracking Date:',
                  value: formatDate(travelHeader.startTime!)),
              StatusWidget(status: travelHeader.headerStatus!)
            ],
          )),
    );
  }
}
