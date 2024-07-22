import 'package:sipatex_mobile_challenge/data/network.dart';
import 'package:sipatex_mobile_challenge/data/respository/repository.dart';
import 'package:sipatex_mobile_challenge/data/storage.dart';
import 'package:get/get.dart';

abstract class BaseController extends GetxController {
  final network = Get.find<NetworkCore>();
  final storage = Get.find<StorageCore>();
  final repository = Get.find<Repository>();
}
