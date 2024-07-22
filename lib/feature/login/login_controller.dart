import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sipatex_mobile_challenge/core/core/base/base_controller.dart';
import 'package:sipatex_mobile_challenge/data/sql_helper.dart';
import 'package:sipatex_mobile_challenge/feature/dashboard/dashboard_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends BaseController {

  final loginStorage = GetStorage();

  Rx<Map<String, dynamic>> dataUser = Rx({});

  TextEditingController username = TextEditingController(text: "");
  TextEditingController password = TextEditingController(text: "");
  RxBool obsecurePass = RxBool(true);

  @override
  void onInit() async {
    super.onInit();
  }

  void login() async{
      try {
        var data = await SQLHelper.getUserByEmail(username.text);

          dataUser.value = data.first;
          if(data.first['password'] == password.text){
            debugPrint("data user : ${dataUser.value}");
            loginStorage.write("login", dataUser.value);
            debugPrint("user login username: ${loginStorage.read('login')['username']}, role:${loginStorage.read('login')['role']}");
            Get.to(DashboardScreen());
          } else {
            debugPrint("Password incorrect");
          }



      } catch(e) {
        debugPrint("error get data user : $e");
        openDialog("Failed", "Error Log In : $e");
      }
  }

  void openDialog(String type, String text) {
    Get.dialog(
      AlertDialog(
        title: Text(type),
        content: Text(text),
        actions: [
          TextButton(
            child: const Text("Close"),
            onPressed: () => Get.back(),
          ),
        ],
      ),
    );
  }

}