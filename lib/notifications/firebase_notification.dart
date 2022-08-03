/*
 * @author Noor Bhatia
 * Created on 01-08-2022
 */
import 'package:bigspoon_foods/notifications/local_notification.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';

class FirebaseNotificationManager {
  Future<void> setupInteractedMessage() async {
    final fcmToken = await FirebaseMessaging.instance.getToken();
    debugPrint('Token is-> $fcmToken');

    // Get any messages which caused the application to open from
    // a terminated state.
    final initialMessage = await FirebaseMessaging.instance.getInitialMessage();

    // If the message also contains a data property with a "type" of "chat",
    // navigate to a chat screen
    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }

    // Also handle any interaction when the app is in the background via a
    // Stream listener
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) {
        debugPrint('Got a message whilst in the foreground!');
        debugPrint('Message data: ${message.notification}');
        if (message.notification != null) {
          debugPrint(
            'Message also contained a notification: ${message.notification}',
          );
          LocalNotificationService.createLocalNotification(message);
        }
      },
    );
  }

  void _handleMessage(RemoteMessage message) {
    debugPrint('FirebaseMessage -> $message');
  }
}
