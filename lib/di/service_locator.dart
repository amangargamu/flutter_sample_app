import 'package:bigspoon_foods/data/network/api/user/user_api.dart';
import 'package:bigspoon_foods/data/network/dio_client.dart';
import 'package:bigspoon_foods/data/repository/user_repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  getIt
    ..registerSingleton(Dio())
    ..registerSingleton(DioClient(getIt<Dio>()))
    ..registerSingleton(UserApi(dioClient: getIt<DioClient>()))
    ..registerSingleton(UserRepository(getIt.get<UserApi>()));
}
