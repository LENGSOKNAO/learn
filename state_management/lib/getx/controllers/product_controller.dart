import 'package:get/get.dart';
import 'package:state_management/getx/data/product_repository.dart';
import 'package:state_management/getx/models/product.dart';

class ProductController extends GetxController {
  final products = <Product>[].obs;
  final isLoading = false.obs;
  final error = ''.obs;

  final ProductRepository _repository;

  ProductController(this._repository);

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    isLoading.value = true;
    error.value = '';
    try {
      products.value = await _repository.getProducts();
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
