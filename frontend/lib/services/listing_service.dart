import 'api_client.dart';
import '../models/car_listing.dart';
import '../models/car_make.dart';

class ListingService {
  final ApiClient _api = ApiClient();

  Future<List<CarListing>> getListings({Map<String, String>? filters}) async {
    final res = await _api.get('/listings', queryParams: filters);
    final data = res['data'] ?? res['listings'] ?? [];
    return (data as List).map((j) => CarListing.fromJson(j)).toList();
  }

  Future<CarListing> getListing(String id) async {
    final res = await _api.get('/listings/$id');
    return CarListing.fromJson(res['data'] ?? res['listing'] ?? res);
  }

  Future<CarListing> createListing(Map<String, dynamic> data) async {
    final res = await _api.post('/listings', body: data);
    return CarListing.fromJson(res['data'] ?? res['listing'] ?? res);
  }

  Future<CarListing> updateListing(String id, Map<String, dynamic> data) async {
    final res = await _api.put('/listings/$id', body: data);
    return CarListing.fromJson(res['data'] ?? res['listing'] ?? res);
  }

  Future<void> deleteListing(String id) async {
    await _api.delete('/listings/$id');
  }

  Future<List<CarMake>> getMakes() async {
    final res = await _api.get('/makes');
    final data = res['data'] ?? res['makes'] ?? [];
    return (data as List).map((j) => CarMake.fromJson(j)).toList();
  }
}
