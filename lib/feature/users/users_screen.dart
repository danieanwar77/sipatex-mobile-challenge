import 'package:flutter/material.dart';
import 'package:sipatex_mobile_challenge/feature/add_user/add_user_screen.dart';
import 'package:sipatex_mobile_challenge/feature/edit_user/edit_user_argument.dart';
import 'package:sipatex_mobile_challenge/feature/edit_user/edit_user_screen.dart';
import 'package:sipatex_mobile_challenge/feature/users/users_controller.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: UsersController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: const Text("Test"),
          leading: controller.loginStorage.read('login')['role'] == "Admin" ? InkWell(
            onTap: (){
              controller.deleteTable();
            },
            child: Icon(Icons.delete_outline_rounded),
          ) : SizedBox(),
        ),
        body: Obx(() => Center(
          child: Container(
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height - MediaQuery.of(context).padding.bottom,
            child: ListView.builder(
              padding: EdgeInsets.all(16),
              shrinkWrap: true,
              itemCount: controller.users.value.length,
              itemBuilder: (context, index) {
                var user = controller.users.value[index];
                return Row(children: [
                  Expanded(child: Text(user['username'])),
                  controller.loginStorage.read('login')['role'] == "Admin" ?
                      Row(
                        children: [
                          ElevatedButton(
                              onPressed: (){
                                Get.to(EditUserScreen(), arguments: EditUserArgument(id: user['id']));
                              },
                              child: Icon(Icons.edit)
                          ),
                          ElevatedButton(
                              onPressed: (){
                                controller.deleteUser(user['id']);
                              },
                              child: Icon(Icons.delete)
                          )
                        ],
                      ) :
                      SizedBox()
                ],);
              },
            )
          ),
        )
        ),
        floatingActionButton: controller.loginStorage.read('login')['role'] == "Admin" ? FloatingActionButton(
          onPressed: () {
            Get.to(AddUserScreen());
          },
          child: const Icon(Icons.add),
        ) : SizedBox(),
      ),
    );
  }
}
