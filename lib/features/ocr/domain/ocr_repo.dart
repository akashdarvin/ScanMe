import 'dart:io';

import 'package:dartz/dartz.dart';

import 'ocr_entity.dart';

abstract class UserRepository {
  Future<Either<String, User>> getUserDataFromImage(File imageFile);
}