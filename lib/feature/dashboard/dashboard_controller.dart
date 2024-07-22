import 'package:flutter/foundation.dart';
import 'package:sipatex_mobile_challenge/feature/products/products_screen.dart';
import 'package:sipatex_mobile_challenge/feature/profile/profile_screen.dart';
import 'package:sipatex_mobile_challenge/feature/users/users_screen.dart';
import 'package:get/get.dart';
import 'package:sipatex_mobile_challenge/core/core/base/base_controller.dart';
import 'package:sipatex_mobile_challenge/feature/dashboard/dashboard_argument.dart';

class DashboardController extends BaseController {

  DashboardArgument? dashboardArgument;
  RxInt selectedPage = 0.obs;
  final RxList<dynamic> _pageOptions = [
    ProductsScreen(),
    UsersScreen(),
    ProfileScreen(),
  ].obs;

  List<dynamic> get pageOptions => _pageOptions.value;

  @override
  void onInit() async {

    dashboardArgument = Get.arguments;
    debugPrint("dashboard argumen - page: ${dashboardArgument!.page.toString() ?? "0"}");

    if(dashboardArgument?.page != null){
      selectedPage.value = dashboardArgument!.page!;
    } else {
      selectedPage.value = 0;
    }

    super.onInit();
  }
}