import 'package:flutter/material.dart';
import '../models/dashboard_stats.dart';
import '../models/user.dart';
import '../models/car_listing.dart';
import '../models/order.dart';
import '../services/admin_service.dart';

class AdminProvider extends ChangeNotifier {
  final AdminService _service = AdminService();

  DashboardStats? _stats;
  List<User> _users = [];
  List<CarListing> _listings = [];
  List<Order> _orders = [];
  bool _loading = false;
  String? _error;

  DashboardStats? get stats => _stats;
  List<User> get users => _users;
  List<CarListing> get listings => _listings;
  List<Order> get orders => _orders;
  bool get loading => _loading;
  String? get error => _error;

  Future<void> loadStats() async {
    _loading = true;
    notifyListeners();
    try {
      _stats = await _service.getDashboardStats();
      _error = null;
    } catch (e) {
      _error = e.toString();
    }
    _loading = false;
    notifyListeners();
  }

  Future<void> loadUsers() async {
    _loading = true;
    notifyListeners();
    try {
      _users = await _service.getUsers();
      _error = null;
    } catch (e) {
      _error = e.toString();
    }
    _loading = false;
    notifyListeners();
  }

  Future<void> loadListings() async {
    _loading = true;
    notifyListeners();
    try {
      _listings = await _service.getListings();
      _error = null;
    } catch (e) {
      _error = e.toString();
    }
    _loading = false;
    notifyListeners();
  }

  Future<void> loadOrders() async {
    _loading = true;
    notifyListeners();
    try {
      _orders = await _service.getOrders();
      _error = null;
    } catch (e) {
      _error = e.toString();
    }
    _loading = false;
    notifyListeners();
  }
}
