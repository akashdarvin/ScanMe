import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import '../features/ocr/bloc/ocr_bloc.dart';
import '../features/ocr/data/ocr_datasource.dart';
import '../features/ocr/data/ocr_repo_impl.dart';
import '../features/ocr/domain/ocr.dart';
import '../features/ocr/domain/ocr_repo.dart';

// Set up GetIt
final getIt = GetIt.instance;

Future<void> init() async {
  // Registering external dependencies
  getIt.registerLazySingleton<http.Client>(() => http.Client());

  // Registering data layer dependencies
  getIt.registerLazySingleton<UserRemoteDataSource>(
      () => UserRemoteDataSourceImpl(client: getIt()));
  getIt.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(remoteDataSource: getIt()));

  // Registering domain layer dependencies
  getIt.registerLazySingleton<GetUserDataFromImage>(
      () => GetUserDataFromImage(repository: getIt()));

  // Registering presentation layer dependencies
  getIt.registerFactory<OcrBloc>(() => OcrBloc(getIt()));
}
