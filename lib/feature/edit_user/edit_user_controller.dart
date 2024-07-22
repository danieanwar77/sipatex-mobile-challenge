import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sipatex_mobile_challenge/core/core/base/base_controller.dart';
import 'package:sipatex_mobile_challenge/data/sql_helper.dart';
import 'package:sipatex_mobile_challenge/feature/edit_user/edit_user_argument.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class EditUserController extends BaseController {

  EditUserArgument? editUserArgument;

  Rx<Map<String, dynamic>> dataUser = Rx({});

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
    editUserArgument = Get.arguments;
    debugPrint("edit user argumen : ${editUserArgument?.id}");
    getUser(editUserArgument!.id);
    super.onInit();
  }

  void getUser(int id) async{
    try {
      var data = await SQLHelper.getUser(id);
      dataUser.value = data.first;
      username.text = dataUser.value['username'];
      password.text = dataUser.value['password'];
      selectedRole.value = dataUser.value['role'];
      debugPrint("data user : ${dataUser.value}");
    } catch(e) {
      debugPrint("error get data user : $e");
    }
  }


  void updateUser() async{
    debugPrint("username : ${username.text} Password: ${password.text} role : $selectedRole");
    try {
      await SQLHelper.updateUser(editUserArgument!.id, username.text, password.text, selectedRole.value);
      openDialog("Success", "Success update user");
    } catch(e) {
      debugPrint("error update : $e");
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