import 'package:flutter/material.dart';
import 'package:sipatex_mobile_challenge/feature/products/products_controller.dart';
import 'package:get/state_manager.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ProductsController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: const Text("Test"),
          leading: SizedBox(),
        ),
        body: Obx(() => Center(
          child: Container(
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height - MediaQuery.of(context).padding.bottom,
              child: ListView.builder(
                padding: EdgeInsets.all(16),
                shrinkWrap: true,
                itemCount: controller.products.value.length,
                itemBuilder: (context, index) {
                  var product = controller.products.value[index];
                  return Row(children: [
                    Expanded(child: Text(product?.name ?? "")),
                    controller.loginStorage.read('login')['role'] == "Admin" ?
                        Row(
                          children: [
                            ElevatedButton(
                                onPressed: (){

                                },
                                child: Icon(Icons.edit)
                            ),
                            ElevatedButton(
                                onPressed: (){

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
        ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {

          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
