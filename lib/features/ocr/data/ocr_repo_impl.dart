import 'dart:io';

import 'package:dartz/dartz.dart';

import '../domain/ocr_entity.dart';
import '../domain/ocr_repo.dart';
import 'ocr_datasource.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<String, User>> getUserDataFromImage(File imageFile) async {
    return await remoteDataSource.getUserDataFromImage(imageFile);
  }
}