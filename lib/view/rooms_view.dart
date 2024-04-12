import 'package:flutter/material.dart';
import 'package:smart_home_dashboard/core/components/room_list_box.dart';

class RoomsView extends StatefulWidget {
  const RoomsView({Key? key}) : super(key: key);

  @override
  State<RoomsView> createState() => _RoomsViewState();
}

class _RoomsViewState extends State<RoomsView> {
  final double horizontalPadding = 40;
  final double verticalPadding = 25;

  List rooms = [
    ['Living Room', 'lib/assets/icons/rooms/living-room.png', 27, true, true],
    ['Bedroom', 'lib/assets/icons/rooms/bedroom.png', 22, false, true],
    ['Kitchen', 'lib/assets/icons/rooms/kitchen.png', 30, true, true],
    ['Bathroom', 'lib/assets/icons/rooms/bathroom.png', 15, false, false],
    ['Sink', 'lib/assets/icons/rooms/sink.png', 13, false, false],
    ['Child Room', 'lib/assets/icons/rooms/child-room.png', 28, true, true],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: verticalPadding,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'lib/assets/icons/menu.png',
                    height: 45,
                    color: Colors.grey[800],
                  ),
                  Icon(
                    Icons.person,
                    size: 45,
                    color: Colors.grey[800],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Text(
                'Rooms',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                  itemCount: rooms.length,
                  padding: const EdgeInsets.all(25),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.3,
                  ),
                  itemBuilder: (context, index) {
                    return RoomListBox(
                      roomName: rooms[index][0],
                      iconPath: rooms[index][1],
                      temperature: rooms[index][2],
                      light: rooms[index][3],
                      camera: rooms[index][4],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
