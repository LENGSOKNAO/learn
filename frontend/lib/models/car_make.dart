class CarMake {
  final String id;
  final String name;
  final String? logoUrl;
  final String? country;

  CarMake({required this.id, required this.name, this.logoUrl, this.country});

  factory CarMake.fromJson(Map<String, dynamic> json) {
    return CarMake(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      logoUrl: json['logo_url'],
      country: json['country'],
    );
  }
}
