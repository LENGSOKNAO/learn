import 'api_client.dart';
import '../models/order.dart';

class OrderService {
  final ApiClient _api = ApiClient();

  Future<List<Order>> getOrders() async {
    final res = await _api.get('/orders');
    final data = res['data'] ?? res['orders'] ?? [];
    return (data as List).map((j) => Order.fromJson(j)).toList();
  }

  Future<Order> getOrder(String id) async {
    final res = await _api.get('/orders/$id');
    return Order.fromJson(res['data'] ?? res['order'] ?? res);
  }
}
