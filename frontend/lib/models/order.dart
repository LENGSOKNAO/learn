import 'user.dart';
import 'car_listing.dart';

class OrderItem {
  final String id;
  final String orderId;
  final String listingId;
  final String? offerId;
  final double price;
  final String? condition;
  final CarListing? listing;

  OrderItem({
    required this.id,
    required this.orderId,
    required this.listingId,
    this.offerId,
    required this.price,
    this.condition,
    this.listing,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      id: json['id'] ?? '',
      orderId: json['order_id'] ?? '',
      listingId: json['listing_id'] ?? '',
      offerId: json['offer_id'],
      price: (json['price'] ?? 0).toDouble(),
      condition: json['condition'],
      listing: json['listing'] != null ? CarListing.fromJson(json['listing']) : null,
    );
  }
}

class Transaction {
  final String id;
  final String orderId;
  final String type;
  final String? method;
  final String? reference;
  final double amount;
  final String status;
  final String? notes;
  final String? processedAt;

  Transaction({
    required this.id,
    required this.orderId,
    required this.type,
    this.method,
    this.reference,
    required this.amount,
    this.status = 'pending',
    this.notes,
    this.processedAt,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'] ?? '',
      orderId: json['order_id'] ?? '',
      type: json['type'] ?? '',
      method: json['method'],
      reference: json['reference'],
      amount: (json['amount'] ?? 0).toDouble(),
      status: json['status'] ?? 'pending',
      notes: json['notes'],
      processedAt: json['processed_at'],
    );
  }
}

class Order {
  final String id;
  final String buyerId;
  final String sellerId;
  final String? orderNumber;
  final String status;
  final double subtotal;
  final double? tax;
  final double? fees;
  final double total;
  final String? notes;
  final String? placedAt;
  final String? completedAt;
  final User? buyer;
  final User? seller;
  final List<OrderItem> items;
  final List<Transaction> transactions;

  Order({
    required this.id,
    required this.buyerId,
    required this.sellerId,
    this.orderNumber,
    this.status = 'pending',
    this.subtotal = 0,
    this.tax,
    this.fees,
    this.total = 0,
    this.notes,
    this.placedAt,
    this.completedAt,
    this.buyer,
    this.seller,
    this.items = const [],
    this.transactions = const [],
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'] ?? '',
      buyerId: json['buyer_id'] ?? '',
      sellerId: json['seller_id'] ?? '',
      orderNumber: json['order_number'],
      status: json['status'] ?? 'pending',
      subtotal: (json['subtotal'] ?? 0).toDouble(),
      tax: json['tax']?.toDouble(),
      fees: json['fees']?.toDouble(),
      total: (json['total'] ?? 0).toDouble(),
      notes: json['notes'],
      placedAt: json['placed_at'],
      completedAt: json['completed_at'],
      buyer: json['buyer'] != null ? User.fromJson(json['buyer']) : null,
      seller: json['seller'] != null ? User.fromJson(json['seller']) : null,
      items: json['items'] != null
          ? (json['items'] as List).map((i) => OrderItem.fromJson(i)).toList()
          : [],
      transactions: json['transactions'] != null
          ? (json['transactions'] as List).map((t) => Transaction.fromJson(t)).toList()
          : [],
    );
  }
}
