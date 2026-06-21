import 'car_listing.dart';
import 'user.dart';

class Inquiry {
  final String id;
  final String listingId;
  final String? buyerId;
  final String? sellerId;
  final String message;
  final String? phoneNumber;
  final String? preferredContact;
  final String status;
  final String? sentAt;
  final User? buyer;
  final User? seller;
  final CarListing? listing;

  Inquiry({
    required this.id,
    required this.listingId,
    this.buyerId,
    this.sellerId,
    required this.message,
    this.phoneNumber,
    this.preferredContact,
    this.status = 'new',
    this.sentAt,
    this.buyer,
    this.seller,
    this.listing,
  });

  factory Inquiry.fromJson(Map<String, dynamic> json) {
    return Inquiry(
      id: json['id'] ?? '',
      listingId: json['listing_id'] ?? '',
      buyerId: json['buyer_id'],
      sellerId: json['seller_id'],
      message: json['message'] ?? '',
      phoneNumber: json['phone_number'],
      preferredContact: json['preferred_contact'],
      status: json['status'] ?? 'new',
      sentAt: json['sent_at'],
      buyer: json['buyer'] != null ? User.fromJson(json['buyer']) : null,
      seller: json['seller'] != null ? User.fromJson(json['seller']) : null,
      listing: json['listing'] != null
          ? CarListing.fromJson(json['listing'])
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'listing_id': listingId,
    'message': message,
    'phone_number': phoneNumber,
    'preferred_contact': preferredContact,
  };
}
