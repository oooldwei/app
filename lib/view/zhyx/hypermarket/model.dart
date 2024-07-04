import 'package:app/api/model/base_model.dart';

class Hypermarket extends BaseModel {
  String? lat;
  String? lng;
  String? location;
  String? name;
  String? image;
  String? description;

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
    this.image,
    this.description,
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
      image: json['image'],
      description: json['description'],
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
      'image': image,
      'description': description,
    });
    return json;
  }
}
