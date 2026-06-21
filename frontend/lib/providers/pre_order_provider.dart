import 'package:flutter/material.dart';
import '../models/pre_order.dart';
import '../services/pre_order_service.dart';

class PreOrderProvider extends ChangeNotifier {
  final PreOrderService _service = PreOrderService();

  List<PreOrder> _preOrders = [];
  PreOrder? _selectedPreOrder;
  bool _loading = false;
  String? _error;

  List<PreOrder> get preOrders => _preOrders;
  PreOrder? get selectedPreOrder => _selectedPreOrder;
  bool get loading => _loading;
  String? get error => _error;

  Future<void> loadPreOrders() async {
    _loading = true;
    notifyListeners();
    try {
      _preOrders = await _service.getPreOrders();
      _error = null;
    } catch (e) {
      _error = e.toString();
    }
    _loading = false;
    notifyListeners();
  }

  Future<void> loadPreOrder(String id) async {
    _loading = true;
    notifyListeners();
    try {
      _selectedPreOrder = await _service.getPreOrder(id);
      _error = null;
    } catch (e) {
      _error = e.toString();
    }
    _loading = false;
    notifyListeners();
  }

  Future<bool> createPreOrder(Map<String, dynamic> data) async {
    _loading = true;
    notifyListeners();
    try {
      await _service.createPreOrder(data);
      _error = null;
      _loading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _error = e.toString();
      _loading = false;
      notifyListeners();
      return false;
    }
  }
}
