import 'package:flutter/material.dart';
import '../models/car_listing.dart';
import '../models/car_make.dart';
import '../services/listing_service.dart';

class ListingProvider extends ChangeNotifier {
  final ListingService _service = ListingService();

  List<CarListing> _listings = [];
  CarListing? _selectedListing;
  List<CarMake> _makes = [];
  bool _loading = false;
  String? _error;

  List<CarListing> get listings => _listings;
  CarListing? get selectedListing => _selectedListing;
  List<CarMake> get makes => _makes;
  bool get loading => _loading;
  String? get error => _error;

  Future<void> loadListings({Map<String, String>? filters}) async {
    _loading = true;
    notifyListeners();
    try {
      _listings = await _service.getListings(filters: filters);
      _error = null;
    } catch (e) {
      _error = e.toString();
    }
    _loading = false;
    notifyListeners();
  }

  Future<void> loadListing(String id) async {
    _loading = true;
    notifyListeners();
    try {
      _selectedListing = await _service.getListing(id);
      _error = null;
    } catch (e) {
      _error = e.toString();
    }
    _loading = false;
    notifyListeners();
  }

  Future<void> loadMakes() async {
    try {
      _makes = await _service.getMakes();
      notifyListeners();
    } catch (_) {}
  }

  Future<bool> createListing(Map<String, dynamic> data) async {
    _loading = true;
    notifyListeners();
    try {
      await _service.createListing(data);
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

  Future<bool> updateListing(String id, Map<String, dynamic> data) async {
    _loading = true;
    notifyListeners();
    try {
      await _service.updateListing(id, data);
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

  Future<bool> deleteListing(String id) async {
    try {
      await _service.deleteListing(id);
      _listings.removeWhere((l) => l.id == id);
      notifyListeners();
      return true;
    } catch (e) {
      _error = e.toString();
      notifyListeners();
      return false;
    }
  }
}
