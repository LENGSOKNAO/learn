class Message {
  final String id;
  final String conversationId;
  final String senderId;
  final String content;
  final String? readAt;
  final String? editedAt;
  final String? createdAt;

  Message({
    required this.id,
    required this.conversationId,
    required this.senderId,
    required this.content,
    this.readAt,
    this.editedAt,
    this.createdAt,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['id'] ?? '',
      conversationId: json['conversation_id'] ?? '',
      senderId: json['sender_id'] ?? '',
      content: json['content'] ?? '',
      readAt: json['read_at'],
      editedAt: json['edited_at'],
      createdAt: json['created_at'] ?? json['sent_at'],
    );
  }
}
