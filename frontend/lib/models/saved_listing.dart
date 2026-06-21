import 'car_listing.dart';

class SavedListing {
  final String id;
  final String userId;
  final String listingId;
  final String? savedAt;
  final CarListing? listing;

  SavedListing({
    required this.id,
    required this.userId,
    required this.listingId,
    this.savedAt,
    this.listing,
  });

  factory SavedListing.fromJson(Map<String, dynamic> json) {
    return SavedListing(
      id: json['id'] ?? '',
      userId: json['user_id'] ?? '',
      listingId: json['listing_id'] ?? '',
      savedAt: json['saved_at'],
      listing: json['listing'] != null
          ? CarListing.fromJson(json['listing'])
          : null,
    );
  }
}
