import 'package:get_it/get_it.dart';
import 'package:task_app/core/networking/dio_factory.dart';

final getIt = GetIt.instance;
void setupGetIt() {
  getIt.registerLazySingleton(() => DioFactory.init());
}
