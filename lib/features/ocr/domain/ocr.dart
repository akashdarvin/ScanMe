import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:scanme/features/ocr/domain/ocr_entity.dart';

import 'ocr_repo.dart';

class GetUserDataFromImage {
  final UserRepository repository;

  GetUserDataFromImage({required this.repository});

  Future<Either<String, User>> execute(File imageFile) async {
    return await repository.getUserDataFromImage(imageFile);
  }
}