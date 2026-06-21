class ListingFeature {
  final String id;
  final String name;
  final String? category;

  ListingFeature({required this.id, required this.name, this.category});

  factory ListingFeature.fromJson(Map<String, dynamic> json) {
    return ListingFeature(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      category: json['category'],
    );
  }
}
