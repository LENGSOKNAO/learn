import 'listing_image.dart';
import 'listing_feature.dart';
import 'car_make.dart';
import 'car_model.dart';
import 'user.dart';

class CarListing {
  final String id;
  final String? sellerId;
  final String? makeId;
  final String? modelId;
  final String? categoryId;
  final int? year;
  final double price;
  final double? originalPrice;
  final int? mileage;
  final String? fuelType;
  final String? transmission;
  final String? engineSize;
  final String? color;
  final String? interiorColor;
  final String? condition;
  final int? numberOfOwners;
  final String? vin;
  final String? licensePlate;
  final String? description;
  final String? location;
  final int viewsCount;
  final String status;
  final int? total;
  final String? expiresAt;
  final String? orderDate;
  final String? expectedArrival;
  final String? actualArrival;
  final User? seller;
  final CarMake? make;
  final CarModel? model;
  final List<ListingImage> images;
  final ListingImage? primaryImage;
  final List<ListingFeature> features;

  CarListing({
    required this.id,
    this.sellerId,
    this.makeId,
    this.modelId,
    this.categoryId,
    this.year,
    required this.price,
    this.originalPrice,
    this.mileage,
    this.fuelType,
    this.transmission,
    this.engineSize,
    this.color,
    this.interiorColor,
    this.condition,
    this.numberOfOwners,
    this.vin,
    this.licensePlate,
    this.description,
    this.location,
    this.viewsCount = 0,
    this.status = 'in_stock',
    this.total,
    this.expiresAt,
    this.orderDate,
    this.expectedArrival,
    this.actualArrival,
    this.seller,
    this.make,
    this.model,
    this.images = const [],
    this.primaryImage,
    this.features = const [],
  });

  factory CarListing.fromJson(Map<String, dynamic> json) {
    return CarListing(
      id: json['id'] ?? '',
      sellerId: json['seller_id'],
      makeId: json['make_id'],
      modelId: json['model_id'],
      categoryId: json['category_id'],
      year: json['year'],
      price: (json['price'] ?? 0).toDouble(),
      originalPrice: json['original_price']?.toDouble(),
      mileage: json['mileage'],
      fuelType: json['fuel_type'],
      transmission: json['transmission'],
      engineSize: json['engine_size'],
      color: json['color'],
      interiorColor: json['interior_color'],
      condition: json['condition'],
      numberOfOwners: json['number_of_owners'],
      vin: json['vin'],
      licensePlate: json['license_plate'],
      description: json['description'],
      location: json['location'],
      viewsCount: json['views_count'] ?? 0,
      status: json['status'] ?? 'in_stock',
      total: json['total'],
      expiresAt: json['expires_at'],
      orderDate: json['order_date'],
      expectedArrival: json['expected_arrival'],
      actualArrival: json['actual_arrival'],
      seller: json['seller'] != null ? User.fromJson(json['seller']) : null,
      make: json['make'] != null ? CarMake.fromJson(json['make']) : null,
      model: json['model'] != null ? CarModel.fromJson(json['model']) : null,
      images: json['images'] != null
          ? (json['images'] as List).map((i) => ListingImage.fromJson(i)).toList()
          : [],
      primaryImage: json['primary_image'] != null
          ? ListingImage.fromJson(json['primary_image'])
          : null,
      features: json['features'] != null
          ? (json['features'] as List).map((f) => ListingFeature.fromJson(f)).toList()
          : [],
    );
  }

  Map<String, dynamic> toJson() => {
    'make_id': makeId,
    'model_id': modelId,
    'category_id': categoryId,
    'year': year,
    'price': price,
    'mileage': mileage,
    'fuel_type': fuelType,
    'transmission': transmission,
    'engine_size': engineSize,
    'color': color,
    'interior_color': interiorColor,
    'condition': condition,
    'number_of_owners': numberOfOwners,
    'vin': vin,
    'license_plate': licensePlate,
    'description': description,
    'location': location,
    'status': status,
    'total': total,
    'expected_arrival': expectedArrival,
  };
}
