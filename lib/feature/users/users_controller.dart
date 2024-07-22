import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sipatex_mobile_challenge/core/core/base/base_controller.dart';
import 'package:sipatex_mobile_challenge/data/sql_helper.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UsersController extends BaseController {

  final loginStorage = GetStorage();

  RxList<dynamic> users = RxList();

  @override
  void onInit() async {
    getUsers();
    super.onInit();
  }

  void getUsers() async{
    try {
      var data = await SQLHelper.getUsers();
      users.value = data;
      debugPrint("SQL Data : ${jsonEncode(users.value)}");
    } catch(e) {
      debugPrint("error insert : $e");
    }
  }

  void deleteUser(int id) async {
    await SQLHelper.deleteUser(id);
    getUsers();
  }

  void deleteTable() async {
    await SQLHelper.deleteTable();
    getUsers();
  }
}