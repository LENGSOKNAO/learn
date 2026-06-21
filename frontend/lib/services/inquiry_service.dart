import 'api_client.dart';
import '../models/inquiry.dart';

class InquiryService {
  final ApiClient _api = ApiClient();

  Future<List<Inquiry>> getInquiries() async {
    final res = await _api.get('/inquiries');
    final data = res['data'] ?? res['inquiries'] ?? [];
    return (data as List).map((j) => Inquiry.fromJson(j)).toList();
  }

  Future<Inquiry> getInquiry(String id) async {
    final res = await _api.get('/inquiries/$id');
    return Inquiry.fromJson(res['data'] ?? res['inquiry'] ?? res);
  }

  Future<Inquiry> createInquiry(Map<String, dynamic> data) async {
    final res = await _api.post('/inquiries', body: data);
    return Inquiry.fromJson(res['data'] ?? res['inquiry'] ?? res);
  }

  Future<Inquiry> updateInquiry(String id, Map<String, dynamic> data) async {
    final res = await _api.put('/inquiries/$id', body: data);
    return Inquiry.fromJson(res['data'] ?? res['inquiry'] ?? res);
  }
}
