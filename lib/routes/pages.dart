import 'package:get/get.dart';
import 'package:pemain_app/pages/player_edit_page.dart';
import 'package:pemain_app/pages/player_list_page.dart';
import 'package:pemain_app/pages/CalculatorPage.dart';
import 'routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.calculator,
      page: () => CalculatorPage(),
    ),
    GetPage(
      name: AppRoutes.playerList,
      page: () => PlayerListPage(),
    ),
    GetPage(
      name: AppRoutes.playerEdit,
      page: () => const PlayerEditPage(), // ✅ Versi tanpa parameter langsung
    ),
  ];
}
