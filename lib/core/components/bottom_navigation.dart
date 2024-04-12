import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:smart_home_dashboard/view/devices_view.dart';
import 'package:smart_home_dashboard/view/home.view.dart';
import 'package:smart_home_dashboard/view/rooms_view.dart';
import 'package:smart_home_dashboard/view/settings_view.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

int selectedIndex = 0;

class _BottomNavigationState extends State<BottomNavigation> {
  static const List<Widget> _widgetOptions = <Widget>[
    HomeView(),
    RoomsView(),
    DevicesView(),
    SettingsView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: Container(
        color: Colors.grey[900],
        child: Padding(
          padding: const EdgeInsets.all(10),
          // padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: GNav(
            backgroundColor: Colors.grey[900] ?? Colors.grey,
            color: Colors.white,
            activeColor: Colors.black,
            tabBackgroundColor: Colors.grey[200] ?? Colors.grey,
            padding: const EdgeInsets.all(16),
            gap: 8,
            onTabChange: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            tabs: const [
              GButton(icon: Icons.home, text: 'Home'),
              GButton(icon: Icons.door_back_door, text: 'Rooms'),
              GButton(icon: Icons.devices_other, text: 'Devices'),
              GButton(icon: Icons.settings, text: 'Settings'),
            ],
          ),
        ),
      ),
    );
  }
}




// class BottomNavigation extends StatelessWidget {
//   const BottomNavigation({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//       color: Colors.grey[300],
//       child: GNav(
//         gap: 8,
//         activeColor: Colors.white,
//         iconSize: 24,
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//         duration: const Duration(milliseconds: 800),
//         tabBackgroundColor: Colors.grey,
//         tabs: const [
//           GButton(
//             icon: Icons.home,
//             text: 'Home',
//           ),
//           GButton(
//             icon: Icons.favorite,
//             text: 'Favorites',
//           ),
//           GButton(
//             icon: Icons.search,
//             text: 'Search',
//           ),
//           GButton(
//             icon: Icons.person,
//             text: 'Profile',
//           ),
//         ],
//       ),
//     );
//   }
// }
