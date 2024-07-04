class BaseModel {
  int? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? createdBy;
  int? updatedBy;
  int? deletedBy;

  BaseModel({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
    this.updatedBy,
    this.deletedBy,
  });

  factory BaseModel.fromJson(Map<String, dynamic> json) {
    return BaseModel(
      id: json['ID'],
      createdAt: DateTime.parse(json['CreatedAt']),
      updatedAt: DateTime.parse(json['UpdatedAt']),
      createdBy: json['CreatedBy'],
      updatedBy: json['UpdatedBy'],
      deletedBy: json['DeletedBy'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ID': id,
      'CreatedAt': createdAt,
      'UpdatedAt': updatedAt,
      'CreatedBy': createdBy,
      'UpdatedBy': updatedBy,
      'DeletedBy': deletedBy,
    };
  }
}
