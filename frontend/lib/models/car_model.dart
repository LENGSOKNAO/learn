class CarModel {
  final String id;
  final String makeId;
  final String name;
  final int? startYear;
  final int? endYear;

  CarModel({
    required this.id,
    required this.makeId,
    required this.name,
    this.startYear,
    this.endYear,
  });

  factory CarModel.fromJson(Map<String, dynamic> json) {
    return CarModel(
      id: json['id'] ?? '',
      makeId: json['make_id'] ?? '',
      name: json['name'] ?? '',
      startYear: json['start_year'],
      endYear: json['end_year'],
    );
  }
}
