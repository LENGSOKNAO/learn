import 'api_client.dart';
import '../models/offer.dart';

class OfferService {
  final ApiClient _api = ApiClient();

  Future<List<Offer>> getOffers() async {
    final res = await _api.get('/offers');
    final data = res['data'] ?? res['offers'] ?? [];
    return (data as List).map((j) => Offer.fromJson(j)).toList();
  }

  Future<Offer> getOffer(String id) async {
    final res = await _api.get('/offers/$id');
    return Offer.fromJson(res['data'] ?? res['offer'] ?? res);
  }

  Future<Offer> createOffer(Map<String, dynamic> data) async {
    final res = await _api.post('/offers', body: data);
    return Offer.fromJson(res['data'] ?? res['offer'] ?? res);
  }

  Future<Offer> acceptOffer(String id) async {
    final res = await _api.post('/offers/$id/accept');
    return Offer.fromJson(res['data'] ?? res['offer'] ?? res);
  }

  Future<Offer> rejectOffer(String id) async {
    final res = await _api.post('/offers/$id/reject');
    return Offer.fromJson(res['data'] ?? res['offer'] ?? res);
  }

  Future<Offer> counterOffer(String id, double price) async {
    final res = await _api.post('/offers/$id/counter', body: {'offered_price': price});
    return Offer.fromJson(res['data'] ?? res['offer'] ?? res);
  }
}
