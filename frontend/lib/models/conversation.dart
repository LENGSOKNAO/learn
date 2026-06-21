import 'user.dart';
import 'message.dart';

class Conversation {
  final String id;
  final String senderId;
  final String receiverId;
  final String? listingId;
  final String? subject;
  final String? lastMessageAt;
  final User? sender;
  final User? receiver;
  final Message? lastMessage;
  final int unreadCount;

  Conversation({
    required this.id,
    required this.senderId,
    required this.receiverId,
    this.listingId,
    this.subject,
    this.lastMessageAt,
    this.sender,
    this.receiver,
    this.lastMessage,
    this.unreadCount = 0,
  });

  factory Conversation.fromJson(Map<String, dynamic> json) {
    return Conversation(
      id: json['id'] ?? '',
      senderId: json['sender_id'] ?? '',
      receiverId: json['receiver_id'] ?? '',
      listingId: json['listing_id'],
      subject: json['subject'],
      lastMessageAt: json['last_message_at'],
      sender: json['sender'] != null ? User.fromJson(json['sender']) : null,
      receiver: json['receiver'] != null ? User.fromJson(json['receiver']) : null,
      lastMessage: json['last_message'] != null
          ? Message.fromJson(json['last_message'])
          : null,
      unreadCount: json['unread_count'] ?? 0,
    );
  }
}
