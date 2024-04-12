// import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_home_dashboard/view/room_detail_view.dart';

class RoomListBox extends StatelessWidget {
  final String roomName;
  final String iconPath;
  final int temperature;
  final bool light;
  final bool camera;

  const RoomListBox({
    super.key,
    required this.roomName,
    required this.iconPath,
    required this.temperature,
    required this.light,
    required this.camera,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(24),
      onTap: () {
        Get.to(
          RoomDetailView(
            roomName: roomName,
            iconPath: iconPath,
            temperature: temperature,
            context: '',
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(24),
          ),
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                iconPath,
                height: 65,
                color: Colors.black,
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        roomName,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // Divider(
              //   color: Colors.grey[400],
              //   thickness: 1,
              // ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Expanded(
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(5.0),
                  //     child: Text(
                  //       '$temperature°C',
                  //       textAlign: TextAlign.center,
                  //       style: const TextStyle(
                  //         fontWeight: FontWeight.bold,
                  //         fontSize: 20,
                  //         color: Colors.black,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Expanded(
                    child: Image.asset(
                      light ? 'lib/assets/icons/rooms/status/lightbulb-on.png' : 'lib/assets/icons/rooms/status/lightbulb-slash.png',
                      height: 25,
                      color: light ? Colors.yellow[800] : Colors.grey[700],
                    ),
                  ),
                  Expanded(
                    child: Image.asset(
                      camera ? 'lib/assets/icons/rooms/status/camera-cctv.png' : 'lib/assets/icons/rooms/status/camera-cctv.png',
                      height: 25,
                      color: camera ? Colors.green[800] : Colors.red[800],
                    ),
                  ),
                  Expanded(
                    child: Image.asset(
                      temperature > 20 ? 'lib/assets/icons/rooms/status/temperature-up.png' : 'lib/assets/icons/rooms/status/temperature-down.png',
                      height: 25,
                      color: temperature > 20 ? Colors.red[800] : Colors.blue[700],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
