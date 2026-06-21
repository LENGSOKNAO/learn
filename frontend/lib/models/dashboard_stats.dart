class DashboardStats {
  final int totalListings;
  final int activeListings;
  final int totalOrders;
  final int pendingOrders;
  final double totalRevenue;
  final int totalInquiries;
  final int unreadInquiries;
  final int totalOffers;
  final int pendingOffers;
  final int totalUsers;
  final int totalSellers;
  final int totalBuyers;
  final int totalPreOrders;

  DashboardStats({
    this.totalListings = 0,
    this.activeListings = 0,
    this.totalOrders = 0,
    this.pendingOrders = 0,
    this.totalRevenue = 0,
    this.totalInquiries = 0,
    this.unreadInquiries = 0,
    this.totalOffers = 0,
    this.pendingOffers = 0,
    this.totalUsers = 0,
    this.totalSellers = 0,
    this.totalBuyers = 0,
    this.totalPreOrders = 0,
  });

  factory DashboardStats.fromJson(Map<String, dynamic> json) {
    return DashboardStats(
      totalListings: json['total_listings'] ?? 0,
      activeListings: json['active_listings'] ?? 0,
      totalOrders: json['total_orders'] ?? 0,
      pendingOrders: json['pending_orders'] ?? 0,
      totalRevenue: (json['total_revenue'] ?? 0).toDouble(),
      totalInquiries: json['total_inquiries'] ?? 0,
      unreadInquiries: json['unread_inquiries'] ?? 0,
      totalOffers: json['total_offers'] ?? 0,
      pendingOffers: json['pending_offers'] ?? 0,
      totalUsers: json['total_users'] ?? 0,
      totalSellers: json['total_sellers'] ?? 0,
      totalBuyers: json['total_buyers'] ?? 0,
      totalPreOrders: json['total_pre_orders'] ?? 0,
    );
  }
}
