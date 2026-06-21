class User {
  final String id;
  final String email;
  final String? phone;
  final String fullName;
  final String? avatarUrl;
  final bool isVerified;
  final bool isDealer;
  final String? dealerName;
  final String? location;
  final String? joinDate;
  final String? lastActive;
  final List<String> roles;

  User({
    required this.id,
    required this.email,
    this.phone,
    required this.fullName,
    this.avatarUrl,
    this.isVerified = false,
    this.isDealer = false,
    this.dealerName,
    this.location,
    this.joinDate,
    this.lastActive,
    this.roles = const [],
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'],
      fullName: json['full_name'] ?? json['name'] ?? '',
      avatarUrl: json['avatar_url'],
      isVerified: json['is_verified'] ?? false,
      isDealer: json['is_dealer'] ?? false,
      dealerName: json['dealer_name'],
      location: json['location'],
      joinDate: json['join_date'],
      lastActive: json['last_active'],
      roles: json['roles'] != null ? List<String>.from(json['roles']) : [],
    );
  }

  Map<String, dynamic> toJson() => {
    'full_name': fullName,
    'phone': phone,
    'location': location,
    'is_dealer': isDealer,
    'dealer_name': dealerName,
  };
}
