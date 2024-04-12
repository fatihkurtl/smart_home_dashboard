import 'package:flutter/material.dart';
// import 'package:smart_home_dashboard/core/components/charts/sleek-slider2.dart';
import 'package:smart_home_dashboard/core/components/charts/sleek-slider3.dart';
// import 'package:smart_home_dashboard/core/components/charts/sleek-slider.dart';
// import 'package:smart_home_dashboard/core/components/charts/radial-gauge.dart';
// import 'package:get/get_connect/http/src/utils/utils.dart';
// import 'package:smart_home_dashboard/core/components/charts/home-status-2.dart';
// import 'package:smart_home_dashboard/core/components/charts/home-status.dart';
// import 'package:smart_home_dashboard/core/components/charts/thermometer.dart';

class RoomDetailView extends StatelessWidget {
  final String roomName;
  final String iconPath;
  final int temperature;

  const RoomDetailView({
    Key? key,
    required this.roomName,
    required this.iconPath,
    required this.temperature,
    required String context,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(roomName),
      ),
      backgroundColor: Colors.grey[300],
      body: const SafeArea(
        child: SliderWidget(),
        // Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        // children: [
        //   Center(
        //     child: ThermometerIcon(
        //       degrees: [0, 10, 20, 30, 40],
        //     ),
        //   )
        // Padding(
        //   padding: EdgeInsets.all(8.0),
        //   child: Card(
        //     child: LineChartSample1(),
        //   ),
        // ),
        // Padding(
        //   padding: EdgeInsets.all(8.0),
        //   child: Card(
        //     child: LineChartSample5(),
        //   ),
        // ),
        // ],
        // ),
      ),
    );
  }
}

void getRoomDetail(String roomName, String iconPath, int temperature) {
  print('Room Name: $roomName');
  print('Icon Path: $iconPath');
  print('Temperature: $temperature');
  RoomDetailView(
    roomName: roomName,
    iconPath: iconPath,
    temperature: temperature,
    context: '',
  );
}
