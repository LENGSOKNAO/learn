import 'package:flutter/material.dart';
import '../models/saved_listing.dart';
import '../services/saved_listing_service.dart';

class SavedListingProvider extends ChangeNotifier {
  final SavedListingService _service = SavedListingService();

  List<SavedListing> _savedListings = [];
  bool _loading = false;
  String? _error;

  List<SavedListing> get savedListings => _savedListings;
  bool get loading => _loading;
  String? get error => _error;

  Future<void> loadSavedListings() async {
    _loading = true;
    notifyListeners();
    try {
      _savedListings = await _service.getSavedListings();
      _error = null;
    } catch (e) {
      _error = e.toString();
    }
    _loading = false;
    notifyListeners();
  }

  bool isSaved(String listingId) {
    return _savedListings.any((s) => s.listingId == listingId);
  }

  String? getSavedId(String listingId) {
    final found = _savedListings.where((s) => s.listingId == listingId);
    return found.isNotEmpty ? found.first.id : null;
  }

  Future<void> toggleSave(String listingId) async {
    if (isSaved(listingId)) {
      final id = getSavedId(listingId);
      if (id != null) {
        await _service.unsaveListing(id);
        _savedListings.removeWhere((s) => s.id == id);
      }
    } else {
      await _service.saveListing(listingId);
      await loadSavedListings();
    }
    notifyListeners();
  }
}
