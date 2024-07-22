
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sipatex_mobile_challenge/core/core/base/base_controller.dart';
import 'package:sipatex_mobile_challenge/data/sql_helper.dart';
import 'package:get/get.dart';

class AddUserController extends BaseController {

  List<String> roles = [
    'Admin',
    'Guest',
  ];

  TextEditingController username = TextEditingController(text: "");
  TextEditingController password = TextEditingController(text: "");
  RxString selectedRole = RxString("");
  RxBool obsecurePass = RxBool(true);

  @override
  void onInit() async {
    super.onInit();
  }

  void insertUser() async{
  debugPrint("username : $username Password: $password role : $selectedRole");
    try {
      await SQLHelper.createItem(
          username.text, password.text, selectedRole.value);
      openDialog("Success", "Success insert user");
    } catch(e) {
      debugPrint("error insert : $e");
      openDialog("Failed", "Error insert user");
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