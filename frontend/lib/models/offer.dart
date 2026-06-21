import 'car_listing.dart';
import 'user.dart';

class Offer {
  final String id;
  final String listingId;
  final String? buyerId;
  final String? sellerId;
  final double offeredPrice;
  final String? message;
  final String status;
  final String? expiresAt;
  final User? buyer;
  final User? seller;
  final CarListing? listing;

  Offer({
    required this.id,
    required this.listingId,
    this.buyerId,
    this.sellerId,
    required this.offeredPrice,
    this.message,
    this.status = 'pending',
    this.expiresAt,
    this.buyer,
    this.seller,
    this.listing,
  });

  factory Offer.fromJson(Map<String, dynamic> json) {
    return Offer(
      id: json['id'] ?? '',
      listingId: json['listing_id'] ?? '',
      buyerId: json['buyer_id'],
      sellerId: json['seller_id'],
      offeredPrice: (json['offered_price'] ?? 0).toDouble(),
      message: json['message'],
      status: json['status'] ?? 'pending',
      expiresAt: json['expires_at'],
      buyer: json['buyer'] != null ? User.fromJson(json['buyer']) : null,
      seller: json['seller'] != null ? User.fromJson(json['seller']) : null,
      listing: json['listing'] != null
          ? CarListing.fromJson(json['listing'])
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'listing_id': listingId,
    'offered_price': offeredPrice,
    'message': message,
  };
}
