import 'api_client.dart';
import '../models/pre_order.dart';

class PreOrderService {
  final ApiClient _api = ApiClient();

  Future<List<PreOrder>> getPreOrders() async {
    final res = await _api.get('/pre-orders');
    final data = res['data'] ?? res['pre_orders'] ?? [];
    return (data as List).map((j) => PreOrder.fromJson(j)).toList();
  }

  Future<PreOrder> getPreOrder(String id) async {
    final res = await _api.get('/pre-orders/$id');
    return PreOrder.fromJson(res['data'] ?? res['pre_order'] ?? res);
  }

  Future<PreOrder> createPreOrder(Map<String, dynamic> data) async {
    final res = await _api.post('/pre-orders', body: data);
    return PreOrder.fromJson(res['data'] ?? res['pre_order'] ?? res);
  }
}
