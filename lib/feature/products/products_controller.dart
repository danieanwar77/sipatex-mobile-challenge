import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:sipatex_mobile_challenge/core/core/base/base_controller.dart';
import 'package:sipatex_mobile_challenge/data/model/product_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class ProductsController extends BaseController {

  final loginStorage = GetStorage();

  RxList<ProductModel> products = RxList();

  @override
  void onInit() async {
    getProducts();
    super.onInit();
  }

  void getProducts() async{
    try{
      var data = await http.get(Uri.parse('https://dummyapi.online/api/products'));
      products.value = (json.decode(data.body) as List)
          .map((data) => ProductModel.fromJson(data))
          .toList();
      debugPrint("data : ${products.value.first.name}");
    } catch (e){
      debugPrint("error get products : $e");
    }

  }
}