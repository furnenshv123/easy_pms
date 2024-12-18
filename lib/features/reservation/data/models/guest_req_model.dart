// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:intl/intl.dart';
class GuestReqModel {
  String? name;
  String? lastname;
  String? surname;
  String? reservationStart;
  String? reservationEnd;
  String? phoneNumber;
  String? tariff;
  String? service;
  int? roomNumber;
  GuestReqModel({
    this.name,
    this.lastname,
    this.surname,
    this.reservationStart,
    this.reservationEnd,
    this.phoneNumber,
    this.tariff,
    this.service,
    this.roomNumber,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'lastname': lastname,
      'surname': surname,
      'reservationStart': reservationStart,
      'reservationEnd': reservationEnd,
      'tariff': tariff,
      'service': service,
      'roomNumber': roomNumber,
    };
  }

  factory GuestReqModel.fromMap(Map<String, dynamic> map) {
    return GuestReqModel(
      name: map['name'] != null ? map['name'] as String : null,
      lastname: map['lastname'] != null ? map['lastname'] as String : null,
      surname: map['surname'] != null ? map['surname'] as String : null,
      reservationStart: map['reservationStart'] != null ? map['reservationStart'] as String : null,
      reservationEnd: map['reservationEnd'] != null ? map['reservationEnd'] as String : null,
      tariff: map['tariff'] != null ? map['tariff'] as String : null,
      service: map['service'] != null ? map['service'] as String : null,
      roomNumber: map['roomNumber'] != null ? map['roomNumber'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GuestReqModel.fromJson(String source) => GuestReqModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
