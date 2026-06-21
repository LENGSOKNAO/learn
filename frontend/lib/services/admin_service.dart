import 'api_client.dart';
import '../models/user.dart';
import '../models/car_listing.dart';
import '../models/car_make.dart';
import '../models/category.dart';
import '../models/order.dart';
import '../models/dashboard_stats.dart';

class AdminService {
  final ApiClient _api = ApiClient();

  Future<DashboardStats> getDashboardStats() async {
    final res = await _api.get('/admin/dashboard/stats');
    return DashboardStats.fromJson(res['data'] ?? res['stats'] ?? res);
  }

  Future<List<User>> getUsers() async {
    final res = await _api.get('/admin/users');
    final data = res['data'] ?? res['users'] ?? [];
    return (data as List).map((j) => User.fromJson(j)).toList();
  }

  Future<List<CarListing>> getListings() async {
    final res = await _api.get('/admin/listings');
    final data = res['data'] ?? res['listings'] ?? [];
    return (data as List).map((j) => CarListing.fromJson(j)).toList();
  }

  Future<List<CarMake>> getMakes() async {
    final res = await _api.get('/admin/makes');
    final data = res['data'] ?? res['makes'] ?? [];
    return (data as List).map((j) => CarMake.fromJson(j)).toList();
  }

  Future<List<Category>> getCategories() async {
    final res = await _api.get('/admin/categories');
    final data = res['data'] ?? res['categories'] ?? [];
    return (data as List).map((j) => Category.fromJson(j)).toList();
  }

  Future<List<Order>> getOrders() async {
    final res = await _api.get('/admin/orders');
    final data = res['data'] ?? res['orders'] ?? [];
    return (data as List).map((j) => Order.fromJson(j)).toList();
  }
}
