import 'api_client.dart';
import '../models/saved_listing.dart';

class SavedListingService {
  final ApiClient _api = ApiClient();

  Future<List<SavedListing>> getSavedListings() async {
    final res = await _api.get('/saved');
    final data = res['data'] ?? res['saved'] ?? [];
    return (data as List).map((j) => SavedListing.fromJson(j)).toList();
  }

  Future<void> saveListing(String listingId) async {
    await _api.post('/saved', body: {'listing_id': listingId});
  }

  Future<void> unsaveListing(String id) async {
    await _api.delete('/saved/$id');
  }
}
