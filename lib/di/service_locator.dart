import 'package:grappus_mobile/data/network/api/user/user_api.dart';
import 'package:grappus_mobile/data/network/dio_client.dart';
import 'package:grappus_mobile/data/repository/user_repository.dart';
import 'package:grappus_mobile/navigation/routes.gr.dart';
import 'package:grappus_mobile/notifications/firebase_notification.dart';
import 'package:grappus_mobile/notifications/local_notification.dart';
import 'package:grappus_mobile/utils/prefs.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupDependencyLocator() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await Prefs.init();
  //await Firebase.initializeApp();
 // await FirebaseNotificationManager().setupInteractedMessage();
  //await LocalNotificationService.initializeLocalNotificationService();

  getIt
    ..registerSingleton(Dio())
    ..registerSingleton(DioClient(getIt<Dio>()))
    ..registerSingleton(UserApi(dioClient: getIt<DioClient>()))
    ..registerSingleton(UserRepository(getIt.get<UserApi>()))
    ..registerSingleton<AppRouter>(AppRouter());
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();

  debugPrint('Handling a background message: ${message.messageId}');
}
