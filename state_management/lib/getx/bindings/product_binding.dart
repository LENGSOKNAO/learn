import 'package:get/get.dart';
import 'package:state_management/getx/controllers/product_controller.dart';
import 'package:state_management/getx/data/api_client.dart';
import 'package:state_management/getx/data/product_repository.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApiClient>(() => ApiClient());
    Get.lazyPut<ProductRepository>(() => ProductRepository(Get.find()));
    Get.lazyPut<ProductController>(() => ProductController(Get.find()));
  }
}
