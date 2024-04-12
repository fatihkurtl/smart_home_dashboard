import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_home_dashboard/core/components/bottom_navigation.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Smart Home App",
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    defaultTransition: Transition.native,
    home: const BottomNavigation(),
  ));
}
