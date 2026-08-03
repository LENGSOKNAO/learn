import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductNotifier extends Notifier {
  final _dio = Dio();
  @override
  build() {
    fetchProducts();
    return [];
  };
  void fetchProducts()async {
    final res = await _dio.get('https://fakestoreapi.com/products');
    state = res.data as List<dynamic>;
  }

}
