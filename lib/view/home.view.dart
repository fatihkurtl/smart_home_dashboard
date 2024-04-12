import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_home_dashboard/core/components/smart_device_box.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final double horizontalPadding = 40;
  final double verticalPadding = 25;

  List smartDevices = [
    ['Smart Light', 'lib/assets/icons/light-bulb.png', true],
    ['Smart AC', 'lib/assets/icons/air-conditioner.png', false],
    ['Smart TV', 'lib/assets/icons/smart-tv.png', false],
    ['Smart Fan', 'lib/assets/icons/fan.png', false],
  ];

  void powerSwitchChanged(bool value, int index) {
    setState(() {
      smartDevices[index][2] = value;
    });
  }

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
            // const SizedBox(height: 20),
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome Home,',
                    style: TextStyle(fontSize: 20, color: Colors.grey[700]),
                  ),
                  Text(
                    'Fatih Kurt',
                    style: GoogleFonts.bebasNeue(
                      fontSize: 72,
                    ),
                  ),
                ],
              ),
            ),
            // const SizedBox(height: 25),
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Divider(
                color: Colors.grey[400],
                thickness: 1,
              ),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Text(
                'Smart Devices',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.grey[800],
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                  itemCount: smartDevices.length,
                  // physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(25),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.3,
                  ),
                  itemBuilder: (context, index) {
                    return SmartDeviceBox(
                      smartDeviceName: smartDevices[index][0],
                      iconPath: smartDevices[index][1],
                      powerOn: smartDevices[index][2],
                      onChanged: (value) => powerSwitchChanged(value, index),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
