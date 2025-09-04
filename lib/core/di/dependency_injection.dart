import 'package:get_it/get_it.dart';
import 'package:task_app/core/networking/dio_factory.dart';
import 'package:task_app/features/home/data/datasources/photo_api_service.dart';
import 'package:task_app/features/home/data/repositories/photo_repository_impl.dart';
import 'package:task_app/features/home/domain/repositories/photo_repository.dart';
import 'package:task_app/features/home/domain/usecases/get_photos_usecase.dart';
import 'package:task_app/features/home/presentation/cubit/photo_cubit.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  // Core
  getIt.registerLazySingleton(() => DioFactory.init());

  // Data sources
  getIt.registerLazySingleton(() => PhotoApiService(getIt()));

  // Repositories
  getIt.registerLazySingleton<PhotoRepository>(
    () => PhotoRepositoryImpl(getIt()),
  );

  // Use cases
  getIt.registerLazySingleton(() => GetPhotosUseCase(getIt()));

  // Cubits
  getIt.registerFactory(() => PhotoCubit(getIt()));
}
