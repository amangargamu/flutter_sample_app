import 'package:bigspoon_foods/data/network/api/user/user_api.dart';
import 'package:bigspoon_foods/data/network/dio_client.dart';
import 'package:bigspoon_foods/data/repository/user_repository.dart';
import 'package:bigspoon_foods/notifications/firebase_notification.dart';
import 'package:bigspoon_foods/notifications/local_notification.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupDependencyLocator() async {
  await FirebaseNotificationManager().setupInteractedMessage();
  await LocalNotificationService.initializeLocalNotificationService();
  getIt
    ..registerSingleton(Dio())
    ..registerSingleton(DioClient(getIt<Dio>()))
    ..registerSingleton(UserApi(dioClient: getIt<DioClient>()))
    ..registerSingleton(UserRepository(getIt.get<UserApi>()));
}
