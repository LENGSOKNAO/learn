import 'package:flutter/material.dart';
import '../models/offer.dart';
import '../services/offer_service.dart';

class OfferProvider extends ChangeNotifier {
  final OfferService _service = OfferService();

  List<Offer> _offers = [];
  Offer? _selectedOffer;
  bool _loading = false;
  String? _error;

  List<Offer> get offers => _offers;
  Offer? get selectedOffer => _selectedOffer;
  bool get loading => _loading;
  String? get error => _error;

  Future<void> loadOffers() async {
    _loading = true;
    notifyListeners();
    try {
      _offers = await _service.getOffers();
      _error = null;
    } catch (e) {
      _error = e.toString();
    }
    _loading = false;
    notifyListeners();
  }

  Future<void> loadOffer(String id) async {
    _loading = true;
    notifyListeners();
    try {
      _selectedOffer = await _service.getOffer(id);
      _error = null;
    } catch (e) {
      _error = e.toString();
    }
    _loading = false;
    notifyListeners();
  }

  Future<bool> createOffer(Map<String, dynamic> data) async {
    try {
      await _service.createOffer(data);
      return true;
    } catch (e) {
      _error = e.toString();
      notifyListeners();
      return false;
    }
  }

  Future<bool> acceptOffer(String id) async {
    try {
      _selectedOffer = await _service.acceptOffer(id);
      notifyListeners();
      return true;
    } catch (e) {
      _error = e.toString();
      notifyListeners();
      return false;
    }
  }

  Future<bool> rejectOffer(String id) async {
    try {
      _selectedOffer = await _service.rejectOffer(id);
      notifyListeners();
      return true;
    } catch (e) {
      _error = e.toString();
      notifyListeners();
      return false;
    }
  }

  Future<bool> counterOffer(String id, double price) async {
    try {
      _selectedOffer = await _service.counterOffer(id, price);
      notifyListeners();
      return true;
    } catch (e) {
      _error = e.toString();
      notifyListeners();
      return false;
    }
  }
}
