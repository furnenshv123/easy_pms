import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ElectronicKeyModel {
  String? type;
  String? name;
  bool? isActive;
  int? roomNumber;
  ElectronicKeyModel({
    this.type,
    this.name,
    this.isActive,
    this.roomNumber,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Type': type,
      'name': name,
      'isActive': isActive,
      'roomNumber': roomNumber,
    };
  }

  factory ElectronicKeyModel.fromMap(Map<String, dynamic> map) {
    return ElectronicKeyModel(
      type: map['Type'] != null ? map['Type'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      isActive: map['isActive'] != null ? map['isActive'] as bool : null,
      roomNumber: map['roomNumber'] != null ? map['roomNumber'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ElectronicKeyModel.fromJson(String source) => ElectronicKeyModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
