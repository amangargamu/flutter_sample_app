import 'dart:convert';
import 'dart:io';

import 'package:bigspoon_foods/notifications/notification_constants.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> initializeLocalNotificationService() async {
    const initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const initializationSettingsIOS = IOSInitializationSettings(
      onDidReceiveLocalNotification: onDidReceiveLocalNotification,
    );
    const initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );
    const channel = AndroidNotificationChannel(
      KNotifications.notificationChannelId, // id
      KNotifications.notificationChannelName, // title
      description: KNotifications.notificationChannelDescription, // description
      importance: Importance.max,
    );
    await _notificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    await _notificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: (String? payload) async {
        /*  Handles notification tap when app is in foreground,
      if payload is null then nothing happens on notification tap
      as the app is already in foreground  */
        if (payload != null) {}
      },
    );

    await requestNotificationPermission();

    /// Update the iOS foreground notification presentation options to allow
    /// heads up notifications.
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  /*
   * The permission step is required for IOS devices.
   * */
  static Future<void> requestNotificationPermission() async {
    if (Platform.isIOS) {
      await FirebaseMessaging.instance
          .requestPermission(
        announcement: true,
        carPlay: true,
        criticalAlert: true,
      )
          .then((value) {
        debugPrint('Settings registered: ${value.toString()}');
      });
    }
  }

  //ignore:avoid_void_async
  static void createLocalNotification(RemoteMessage message) async {
    const androidPlatformChannelSpecifics = AndroidNotificationDetails(
      KNotifications.notificationChannelId, // id
      KNotifications.notificationChannelName, // title
      channelDescription: KNotifications.notificationChannelDescription,
      importance: Importance.max,
      priority: Priority.high,
      icon: '@mipmap/ic_launcher',
    );

    await _notificationsPlugin.show(
      message.notification.hashCode,
      message.notification!.title,
      message.notification!.body,
      const NotificationDetails(android: androidPlatformChannelSpecifics),
      payload: json.encode(message.data),
    );
  }

  static Future<void> onDidReceiveLocalNotification(
    int? id,
    String? title,
    String? body,
    String? payload,
  ) async {}
}
