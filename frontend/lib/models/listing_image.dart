class ListingImage {
  final String id;
  final String listingId;
  final String imageUrl;
  final bool isPrimary;
  final int sortOrder;

  ListingImage({
    required this.id,
    required this.listingId,
    required this.imageUrl,
    this.isPrimary = false,
    this.sortOrder = 0,
  });

  factory ListingImage.fromJson(Map<String, dynamic> json) {
    return ListingImage(
      id: json['id'] ?? '',
      listingId: json['listing_id'] ?? '',
      imageUrl: json['image_url'] ?? '',
      isPrimary: json['is_primary'] ?? false,
      sortOrder: json['sort_order'] ?? 0,
    );
  }
}
