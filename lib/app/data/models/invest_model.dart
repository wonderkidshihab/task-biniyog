// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class InvestModel {
  final int id;
  final String? name;
  final String? image;
  final String? description;
  final String? type;
  final String? risk;
  final String? profitInPercentage;
  final DateTime? dateOfExpiration;

  int get profit => int.parse(profitInPercentage?.replaceAll("%", "") ?? '0');
  int get daysLeft => dateOfExpiration?.difference(DateTime.now()).inDays ?? 0;
  InvestModel({
    required this.id,
    this.name,
    this.image,
    this.description,
    this.type,
    this.risk,
    this.profitInPercentage,
    this.dateOfExpiration,
  });


  InvestModel copyWith({
    int? id,
    String? name,
    String? image,
    String? description,
    String? type,
    String? risk,
    String? profitInPercentage,
    DateTime? dateOfExpiration,
  }) {
    return InvestModel(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      description: description ?? this.description,
      type: type ?? this.type,
      risk: risk ?? this.risk,
      profitInPercentage: profitInPercentage ?? this.profitInPercentage,
      dateOfExpiration: dateOfExpiration ?? this.dateOfExpiration,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
      'description': description,
      'type': type,
      'risk': risk,
      'profitInPercentage': profitInPercentage,
      'dateOfExpiration': dateOfExpiration?.millisecondsSinceEpoch,
    };
  }

  factory InvestModel.fromMap(Map<String, dynamic> map) {
    return InvestModel(
      id: map['id'] as int,
      name: map['name'] != null ? map['name'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
      description: map['description'] != null ? map['description'] as String : null,
      type: map['type'] != null ? map['type'] as String : null,
      risk: map['risk'] != null ? map['risk'] as String : null,
      profitInPercentage: map['profitInPercentage'] != null ? map['profitInPercentage'] as String : null,
      dateOfExpiration: map['dateOfExpiration'] != null ? DateTime.parse(map['dateOfExpiration']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory InvestModel.fromJson(String source) => InvestModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'InvestModel(id: $id, name: $name, image: $image, description: $description, type: $type, risk: $risk, profitInPercentage: $profitInPercentage, dateOfExpiration: $dateOfExpiration)';
  }

  @override
  bool operator ==(covariant InvestModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.image == image &&
      other.description == description &&
      other.type == type &&
      other.risk == risk &&
      other.profitInPercentage == profitInPercentage &&
      other.dateOfExpiration == dateOfExpiration;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      image.hashCode ^
      description.hashCode ^
      type.hashCode ^
      risk.hashCode ^
      profitInPercentage.hashCode ^
      dateOfExpiration.hashCode;
  }
}
