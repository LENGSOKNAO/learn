import 'user.dart';
import 'car_listing.dart';
import 'car_make.dart';
import 'car_model.dart';

class PreOrderPayment {
  final String id;
  final String preOrderId;
  final double amount;
  final String paymentType;
  final String? paymentMethod;
  final String? reference;
  final String? paymentDate;
  final String status;
  final String? notes;

  PreOrderPayment({
    required this.id,
    required this.preOrderId,
    required this.amount,
    required this.paymentType,
    this.paymentMethod,
    this.reference,
    this.paymentDate,
    this.status = 'completed',
    this.notes,
  });

  factory PreOrderPayment.fromJson(Map<String, dynamic> json) {
    return PreOrderPayment(
      id: json['id'] ?? '',
      preOrderId: json['pre_order_id'] ?? '',
      amount: (json['amount'] ?? 0).toDouble(),
      paymentType: json['payment_type'] ?? '',
      paymentMethod: json['payment_method'],
      reference: json['reference'],
      paymentDate: json['payment_date'],
      status: json['status'] ?? 'completed',
      notes: json['notes'],
    );
  }
}

class PreOrder {
  final String id;
  final String? listingId;
  final String? makeId;
  final String? modelId;
  final String? customerId;
  final String? customerName;
  final String? customerEmail;
  final String? customerPhone;
  final int? quantity;
  final String? color;
  final String? interiorColor;
  final String? trimLevel;
  final String? enginePreference;
  final String? transmissionPreference;
  final String? drivetrainPreference;
  final String? fuelType;
  final int? yearMin;
  final int? yearMax;
  final int? mileageMax;
  final double? totalPrice;
  final double? budgetMin;
  final double? budgetMax;
  final String? source;
  final String? preferredContact;
  final String status;
  final String? notes;
  final String? internalNotes;
  final String? specialRequests;
  final String? createdBy;
  final User? customer;
  final CarListing? listing;
  final CarMake? make;
  final CarModel? model;
  final List<PreOrderPayment> payments;

  PreOrder({
    required this.id,
    this.listingId,
    this.makeId,
    this.modelId,
    this.customerId,
    this.customerName,
    this.customerEmail,
    this.customerPhone,
    this.quantity,
    this.color,
    this.interiorColor,
    this.trimLevel,
    this.enginePreference,
    this.transmissionPreference,
    this.drivetrainPreference,
    this.fuelType,
    this.yearMin,
    this.yearMax,
    this.mileageMax,
    this.totalPrice,
    this.budgetMin,
    this.budgetMax,
    this.source,
    this.preferredContact,
    this.status = 'pending',
    this.notes,
    this.internalNotes,
    this.specialRequests,
    this.createdBy,
    this.customer,
    this.listing,
    this.make,
    this.model,
    this.payments = const [],
  });

  factory PreOrder.fromJson(Map<String, dynamic> json) {
    return PreOrder(
      id: json['id'] ?? '',
      listingId: json['listing_id'],
      makeId: json['make_id'],
      modelId: json['model_id'],
      customerId: json['customer_id'],
      customerName: json['customer_name'],
      customerEmail: json['customer_email'],
      customerPhone: json['customer_phone'],
      quantity: json['quantity'],
      color: json['color'],
      interiorColor: json['interior_color'],
      trimLevel: json['trim_level'],
      enginePreference: json['engine_preference'],
      transmissionPreference: json['transmission_preference'],
      drivetrainPreference: json['drivetrain_preference'],
      fuelType: json['fuel_type'],
      yearMin: json['year_min'],
      yearMax: json['year_max'],
      mileageMax: json['mileage_max'],
      totalPrice: json['total_price']?.toDouble(),
      budgetMin: json['budget_min']?.toDouble(),
      budgetMax: json['budget_max']?.toDouble(),
      source: json['source'],
      preferredContact: json['preferred_contact'],
      status: json['status'] ?? 'pending',
      notes: json['notes'],
      internalNotes: json['internal_notes'],
      specialRequests: json['special_requests'],
      createdBy: json['created_by'],
      customer: json['customer'] != null ? User.fromJson(json['customer']) : null,
      listing: json['listing'] != null
          ? CarListing.fromJson(json['listing'])
          : null,
      make: json['make'] != null ? CarMake.fromJson(json['make']) : null,
      model: json['model'] != null ? CarModel.fromJson(json['model']) : null,
      payments: json['payments'] != null
          ? (json['payments'] as List).map((p) => PreOrderPayment.fromJson(p)).toList()
          : [],
    );
  }

  Map<String, dynamic> toJson() => {
    'listing_id': listingId,
    'make_id': makeId,
    'model_id': modelId,
    'customer_name': customerName,
    'customer_email': customerEmail,
    'customer_phone': customerPhone,
    'quantity': quantity,
    'color': color,
    'interior_color': interiorColor,
    'trim_level': trimLevel,
    'engine_preference': enginePreference,
    'transmission_preference': transmissionPreference,
    'drivetrain_preference': drivetrainPreference,
    'fuel_type': fuelType,
    'year_min': yearMin,
    'year_max': yearMax,
    'mileage_max': mileageMax,
    'budget_min': budgetMin,
    'budget_max': budgetMax,
    'preferred_contact': preferredContact,
    'notes': notes,
    'special_requests': specialRequests,
  };
}
