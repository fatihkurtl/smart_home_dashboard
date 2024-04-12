import 'package:get/get.dart';
import 'package:smart_home_dashboard/view/devices_view.dart';
import 'package:smart_home_dashboard/view/home.view.dart';
import 'package:smart_home_dashboard/view/room_detail_view.dart';
import 'package:smart_home_dashboard/view/rooms_view.dart';
import 'package:smart_home_dashboard/view/settings_view.dart';
import 'routes.dart';

abstract class AppViews {
  static final views = [
    GetPage(
      name: Routes.HOME,
      page: () => const HomeView(),
    ),
    GetPage(
      name: Routes.ROOMS,
      page: () => const RoomsView(),
    ),
    GetPage(
      name: Routes.ROOM_DETAIL,
      page: () => RoomDetailView(
        roomName: (Get.arguments as Map)['roomName'],
        iconPath: (Get.arguments as Map)['iconPath'],
        temperature: (Get.arguments as Map)['temperature'],
        context: (Get.arguments as Map) as String,
      ),
    ),
    GetPage(
      name: Routes.DEVICES,
      page: () => const DevicesView(),
    ),
    GetPage(
      name: Routes.SETTINGS,
      page: () => const SettingsView(),
    ),
  ];
}
