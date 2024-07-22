import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sipatex_mobile_challenge/core/core/base/base_controller.dart';
import 'package:sipatex_mobile_challenge/data/sql_helper.dart';
import 'package:sipatex_mobile_challenge/feature/login/login_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get_storage/get_storage.dart';

class ProfileController extends BaseController {

  final loginStorage = GetStorage();

  RxString username = RxString("");
  RxString password = RxString("");
  RxString selectedRole = RxString("");

  @override
  void onInit() async {
    getUser(loginStorage.read('login')['id']);
    super.onInit();
  }

  void getUser(int id) async{
    try {
      var data = await SQLHelper.getUser(id);
      username.value = data.first['username'];
      password.value = data.first['password'];
      selectedRole.value = data.first['role'];
      debugPrint("data user : ${data.first}");
    } catch(e) {
      debugPrint("error get data user : $e");
    }
  }

  void signOut(){
    Get.dialog(
      AlertDialog(
        title: Text("Warning"),
        content: Text("Are you sure to sign out?"),
        actions: [
          TextButton(
            child: const Text("Yes"),
            onPressed: () {
                loginStorage.remove('login');
                Get.off(LoginScreen());
              },
          ),
          TextButton(
            child: const Text("Cancel"),
            onPressed: () => Get.back(),
          ),
        ],
      ),
    );
  }
}