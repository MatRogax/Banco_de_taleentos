import '../../domain/entities/sector.dart';

class SectorModel extends Sector {
  const SectorModel({required super.id, required super.name});

  factory SectorModel.fromJson(Map<String, dynamic> json) {
    return SectorModel(
      id: json['id'] as int,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
