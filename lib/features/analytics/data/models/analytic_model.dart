import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class AnalyticModel {
  int? priceFromReservation;
  int? priceFromServices;
  AnalyticModel({
    this.priceFromReservation,
    this.priceFromServices,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'priceFromReservation': priceFromReservation,
      'priceFromServices': priceFromServices,
    };
  }

  factory AnalyticModel.fromMap(Map<String, dynamic> map) {
    return AnalyticModel(
      priceFromReservation: map['priceFromReservation'] != null ? map['priceFromReservation'] as int : null,
      priceFromServices: map['priceFromServices'] != null ? map['priceFromServices'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AnalyticModel.fromJson(String source) => AnalyticModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
