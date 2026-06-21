import 'api_client.dart';
import '../models/user.dart';

class AuthService {
  final ApiClient _api = ApiClient();

  Future<Map<String, dynamic>> login(String email, String password) async {
    final res = await _api.post('/auth/login', body: {
      'email': email,
      'password': password,
    });
    final token = res['token'] ?? res['access_token'];
    if (token != null) {
      await _api.setToken(token.toString());
    }
    return res;
  }

  Future<Map<String, dynamic>> register(Map<String, dynamic> data) async {
    final res = await _api.post('/auth/register', body: data);
    final token = res['token'] ?? res['access_token'];
    if (token != null) {
      await _api.setToken(token.toString());
    }
    return res;
  }

  Future<User> getMe() async {
    final res = await _api.get('/auth/me');
    return User.fromJson(res['user'] ?? res['data'] ?? res);
  }

  Future<void> logout() async {
    try {
      await _api.post('/auth/logout');
    } catch (_) {}
    await _api.setToken(null);
  }

  Future<void> refresh() async {
    final res = await _api.post('/auth/refresh');
    final token = res['token'] ?? res['access_token'];
    if (token != null) {
      await _api.setToken(token.toString());
    }
  }

  Future<bool> isLoggedIn() async {
    final token = await _api.getToken();
    return token != null && token.isNotEmpty;
  }
}
