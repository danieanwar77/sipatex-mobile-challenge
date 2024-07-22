import 'package:flutter/material.dart';
import 'package:sipatex_mobile_challenge/feature/add_user/add_user_controller.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class AddUserScreen extends StatelessWidget {
  const AddUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: AddUserController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: (){
              Get.back();
            },
            child: Icon(Icons.arrow_back_rounded),
          ),
          title: const Text("Add User"),
        ),
        body: Obx(() => Container(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: controller.username,
                onChanged: (value){
                  controller.username.text = value;
                },
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  prefixIcon: Icon(Icons.email_outlined),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16,),
              TextFormField(
                controller: controller.password,
                onChanged: (value){
                  controller.password.text = value;
                },
                obscureText: controller.obsecurePass.value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }

                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    prefixIcon: const Icon(Icons.lock_outline_rounded),
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: controller.obsecurePass.value == true ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
                      onPressed: () {
                        controller.obsecurePass.value = !controller.obsecurePass.value;
                      },
                    )
                ),
              ),
              SizedBox(height: 16,),
              Container(
                width: double.infinity,
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(4.0)),
                  child: DropdownButton<String>(
                      isExpanded: true,
                      value: controller.selectedRole.value,
                      underline: Container(),
                      onChanged: (String? newValue) {
                        controller.selectedRole.value = newValue ?? "";
                      },
                      hint: Text("Select a role"),
                      items: const [
                        DropdownMenuItem(child: Text("Select a role"), value: "", enabled: false,),
                        DropdownMenuItem(child: Text("Admin"), value: "Admin",),
                        DropdownMenuItem(child: Text("Guest"), value: "Guest")
                      ]
                  ),
              ),
              SizedBox(height: 16,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Insert',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  onPressed: () {
                    controller.insertUser();
                  },
                ),
              ),
            ],
          ),
        )
        ),
    )
    );
  }
}
