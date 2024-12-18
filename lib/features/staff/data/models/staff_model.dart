import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class StaffModel {
  String? name;
  String? lastname;
  String? type;
  String? task;
  StaffModel({
    this.name,
    this.lastname,
    this.type,
    this.task,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'lastname': lastname,
      'type': type,
      'task': task,
    };
  }

  factory StaffModel.fromMap(Map<String, dynamic> map) {
    return StaffModel(
      name: map['name'] != null ? map['name'] as String : null,
      lastname: map['lastname'] != null ? map['lastname'] as String : null,
      type: map['type'] != null ? map['type'] as String : null,
      task: map['task'] != null ? map['task'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory StaffModel.fromJson(String source) => StaffModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
