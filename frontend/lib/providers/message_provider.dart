import 'package:flutter/material.dart';
import '../models/conversation.dart';
import '../models/message.dart';
import '../services/message_service.dart';

class MessageProvider extends ChangeNotifier {
  final MessageService _service = MessageService();

  List<Conversation> _conversations = [];
  List<Message> _messages = [];
  bool _loading = false;
  String? _error;

  List<Conversation> get conversations => _conversations;
  List<Message> get messages => _messages;
  bool get loading => _loading;
  String? get error => _error;

  Future<void> loadConversations() async {
    _loading = true;
    notifyListeners();
    try {
      _conversations = await _service.getConversations();
      _error = null;
    } catch (e) {
      _error = e.toString();
    }
    _loading = false;
    notifyListeners();
  }

  Future<void> loadMessages(String conversationId) async {
    _loading = true;
    notifyListeners();
    try {
      _messages = await _service.getMessages(conversationId);
      await _service.markConversationRead(conversationId);
      _error = null;
    } catch (e) {
      _error = e.toString();
    }
    _loading = false;
    notifyListeners();
  }

  Future<bool> sendMessage(Map<String, dynamic> data) async {
    try {
      final msg = await _service.sendMessage(data);
      _messages.add(msg);
      notifyListeners();
      return true;
    } catch (e) {
      _error = e.toString();
      notifyListeners();
      return false;
    }
  }

  Future<bool> replyToConversation(String conversationId, String content) async {
    try {
      final msg = await _service.replyToConversation(conversationId, content);
      _messages.add(msg);
      notifyListeners();
      return true;
    } catch (e) {
      _error = e.toString();
      notifyListeners();
      return false;
    }
  }
}
