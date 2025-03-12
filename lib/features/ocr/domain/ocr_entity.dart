import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String name;
  final String dob;
  final String gender;
  final String aadhaarNumber;
  final String phoneNumber;

  const User({
    required this.name,
    required this.dob,
    required this.gender,
    required this.aadhaarNumber,
    required this.phoneNumber,
  });

  @override
  List<Object> get props => [name, dob, gender, aadhaarNumber, phoneNumber];
}
