// lib/data/datasources/user_remote_data_source.dart
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import 'package:http_parser/http_parser.dart';
import 'package:scanme/core/api_config.dart';

import 'ocr_model.dart';

abstract class UserRemoteDataSource {
  Future<Either<String, UserModel>> getUserDataFromImage(File imageFile);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final http.Client client;

  UserRemoteDataSourceImpl({required this.client});

  @override
  Future<Either<String, UserModel>> getUserDataFromImage(File imageFile) async {
    final uri = Uri.parse('${ApiConfig.baseUrl}/extract');
    final client = http.Client();

    final request = http.MultipartRequest('POST', uri)
      ..files.add(
        await http.MultipartFile.fromPath(
          'file',
          imageFile.path,
          contentType: MediaType('image', 'jpg'),
        ),
      );

    try {
      final response = await client.send(request);
      debugPrint("Uploading to: ${uri.toString()}");
      debugPrint("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
      if (response.statusCode == 200) {
        final responseData = await http.Response.fromStream(response);
        final json = jsonDecode(responseData.body);
        debugPrint("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
        debugPrint(responseData.body);
        return Right(UserModel.fromJson(json));
      } else {
        debugPrint(response.statusCode.toString());
        return Left('Failed to load user data');
      }
    } catch (e) {
      debugPrint(e.toString());
      return Left('Error: $e');
    }
  }
}
