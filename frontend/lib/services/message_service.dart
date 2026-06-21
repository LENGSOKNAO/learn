import 'api_client.dart';
import '../models/conversation.dart';
import '../models/message.dart';

class MessageService {
  final ApiClient _api = ApiClient();

  Future<List<Conversation>> getConversations() async {
    final res = await _api.get('/conversations');
    final data = res['data'] ?? res['conversations'] ?? [];
    return (data as List).map((j) => Conversation.fromJson(j)).toList();
  }

  Future<List<Message>> getMessages(String conversationId) async {
    final res = await _api.get('/conversations/$conversationId/messages');
    final data = res['data'] ?? res['messages'] ?? [];
    return (data as List).map((j) => Message.fromJson(j)).toList();
  }

  Future<Message> sendMessage(Map<String, dynamic> data) async {
    final res = await _api.post('/messages/send', body: data);
    return Message.fromJson(res['data'] ?? res['message'] ?? res);
  }

  Future<Message> replyToConversation(String conversationId, String content) async {
    final res = await _api.post('/conversations/$conversationId/reply', body: {
      'content': content,
    });
    return Message.fromJson(res['data'] ?? res['message'] ?? res);
  }

  Future<void> markConversationRead(String conversationId) async {
    await _api.post('/conversations/$conversationId/read');
  }
}
