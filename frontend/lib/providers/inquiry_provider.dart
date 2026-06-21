import 'package:flutter/material.dart';
import '../models/inquiry.dart';
import '../services/inquiry_service.dart';

class InquiryProvider extends ChangeNotifier {
  final InquiryService _service = InquiryService();

  List<Inquiry> _inquiries = [];
  Inquiry? _selectedInquiry;
  bool _loading = false;
  String? _error;

  List<Inquiry> get inquiries => _inquiries;
  Inquiry? get selectedInquiry => _selectedInquiry;
  bool get loading => _loading;
  String? get error => _error;

  Future<void> loadInquiries() async {
    _loading = true;
    notifyListeners();
    try {
      _inquiries = await _service.getInquiries();
      _error = null;
    } catch (e) {
      _error = e.toString();
    }
    _loading = false;
    notifyListeners();
  }

  Future<void> loadInquiry(String id) async {
    _loading = true;
    notifyListeners();
    try {
      _selectedInquiry = await _service.getInquiry(id);
      _error = null;
    } catch (e) {
      _error = e.toString();
    }
    _loading = false;
    notifyListeners();
  }

  Future<bool> createInquiry(Map<String, dynamic> data) async {
    try {
      await _service.createInquiry(data);
      return true;
    } catch (e) {
      _error = e.toString();
      notifyListeners();
      return false;
    }
  }
}
