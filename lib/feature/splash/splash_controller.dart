import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:sipatex_mobile_challenge/core/core/base/base_controller.dart';
import 'package:sipatex_mobile_challenge/feature/dashboard/dashboard_screen.dart';
import 'package:sipatex_mobile_challenge/feature/login/login_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends BaseController {

  final loginStorage = GetStorage();

  @override
  void onInit() async {

    try{
      var login = await loginStorage.read('login');
      debugPrint("login data : ${jsonEncode(login)}");
      if(login != null){
        Get.off(DashboardScreen());
      } else {
        Get.off(LoginScreen());
      }

    } catch (e){
      debugPrint("error catch login data : $e");
      Get.off(LoginScreen());
    }

    super.onInit();
  }
}