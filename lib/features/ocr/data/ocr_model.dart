import '../domain/ocr_entity.dart';

class UserModel extends User {
  const UserModel({
    required super.name,
    required super.dob,
    required super.gender,
    required super.aadhaarNumber,
    required super.phoneNumber,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      dob: json['dob'],
      gender: json['gender'],
      aadhaarNumber: json['aadhaarNumber'],
      phoneNumber: json['phoneNumber'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'dob': dob,
      'gender': gender,
      'aadhaarNumber': aadhaarNumber,
      'phoneNumber': phoneNumber,
    };
  }
}
