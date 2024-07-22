import 'package:flutter/material.dart';
import 'package:sipatex_mobile_challenge/feature/edit_user/edit_user_argument.dart';
import 'package:sipatex_mobile_challenge/feature/edit_user/edit_user_screen.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import 'profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ProfileController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: const Text("Profile"),
          leading: SizedBox(),
        ),
        body: Obx(() => SafeArea(
            child: Center(
              child: Column(
                children: [
                  Center(
                      child: Column(
                        children: [
                          Icon(Icons.person_outline_outlined,
                            size: 112,
                          ),
                          Text(
                            controller.username.value,
                          ),
                        ],
                      )
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton.extended(
                        onPressed: () {
                          Get.to(EditUserScreen(), arguments: EditUserArgument(id: controller.loginStorage.read('login')['id']));
                        },
                        heroTag: 'edit',
                        elevation: 0,
                        label: const Text("Edit"),
                        icon: const Icon(Icons.edit),
                      ),
                      const SizedBox(width: 16.0),
                      FloatingActionButton.extended(
                        onPressed: () {
                          controller.signOut();
                        },
                        heroTag: 'signout',
                        elevation: 0,
                        backgroundColor: Colors.red,
                        label: const Text("Sign Out"),
                        icon: const Icon(Icons.logout),
                      ),
                    ],
                  ),
                ],
              ),
            )
          )
        ),
      ),
    );
  }
}
