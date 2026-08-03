import 'package:state_management/getx/data/api_client.dart';
import 'package:state_management/getx/models/product.dart';

class ProductRepository {
  final ApiClient _client;

  ProductRepository(this._client);

  Future<List<Product>> getProducts() async {
    final res = await _client.get('/products');
    return (res.data as List)
        .map((json) => Product.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<Product> getProductById(int id) async {
    final res = await _client.get('/products/$id');
    return Product.fromJson(res.data as Map<String, dynamic>);
  }
}
