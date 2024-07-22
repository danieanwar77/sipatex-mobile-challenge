import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:sipatex_mobile_challenge/core/core/constant/colors.dart';
import 'package:sipatex_mobile_challenge/feature/dashboard/dashboard_controller.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: DashboardController(),
      builder: (controller) => Obx(() =>
          Scaffold(
          backgroundColor: Colors.white,
          body: controller.pageOptions[controller.selectedPage.toInt()],
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Products', activeIcon: Icon(Icons.list, color: primaryColor,), backgroundColor: Colors.white),
              BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: 'Users', activeIcon: Icon(Icons.list_alt, color: primaryColor,), backgroundColor: Colors.white),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile', activeIcon: Icon(Icons.person, color: primaryColor,), backgroundColor: Colors.white),
            ],
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: true,
            selectedItemColor: primaryColor,
            elevation: 5.0,
            unselectedItemColor: Color(0xff49454f),
            currentIndex: controller.selectedPage.toInt(),
            backgroundColor: Colors.white,
            onTap: (index){
                controller.selectedPage.value = index;
            },
          )
      ),)
    );
  }
}

