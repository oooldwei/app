import 'package:app/api/model/base_model.dart';

class Hypermarket extends BaseModel {
  String? lat;
  String? lng;
  String? location;
  String? name;

  Hypermarket({
    super.id,
    super.createdAt,
    super.updatedAt,
    super.createdBy,
    super.updatedBy,
    super.deletedBy,
    this.lat,
    this.lng,
    this.location,
    this.name,
  });

  factory Hypermarket.fromJson(Map<String, dynamic> json) {
    return Hypermarket(
      id: json['ID'],
      createdAt: DateTime.parse(json['CreatedAt']),
      updatedAt: DateTime.parse(json['UpdatedAt']),
      createdBy: json['CreatedBy'],
      updatedBy: json['UpdatedBy'],
      deletedBy: json['DeletedBy'],
      lat: json['lat'],
      lng: json['lng'],
      location: json['location'],
      name: json['name'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final json = super.toJson();
    json.addAll({
      'name': name,
      'location': location,
      'lng': lng,
      'lat': lat,
    });
    return json;
  }
}
