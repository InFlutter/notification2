import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotification{
  static final _localNotification = FlutterLocalNotificationsPlugin();
  static bool istrue = false;


  static Future<void> requestPermission() async {
    if(Platform.isAndroid){
      final android = _localNotification.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
      istrue = await android?.requestNotificationsPermission() ?? false;
      istrue = await android?.requestExactAlarmsPermission() ?? false;
    }
    else if (Platform.isIOS){
      final ios = _localNotification.resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>();
      istrue = await ios?.requestPermissions(
        sound: true,
        alert: true,
        badge: true,
      )?? false;
    }
  }

  static Future<void> init() async {
    const androidSettings = AndroidInitializationSettings("salom");
    const iOSSettings = DarwinInitializationSettings();

    const initSettings = InitializationSettings(android: androidSettings, iOS: iOSSettings);


    await _localNotification.initialize(initSettings);

  }


  static Future<void> showNotification() async {
    const androidNotificarion = AndroidNotificationDetails(
        "qwerty Id",
        "qwerty Kanali",
      priority: Priority.max,
      importance: Importance.max,
      playSound: true,
      sound: RawResourceAndroidNotificationSound("nomi"),


    );
    const iOSNotificaiton = DarwinNotificationDetails();

    final initSettings = NotificationDetails(
      android: androidNotificarion,
      iOS: iOSNotificaiton,
    );

    _localNotification.show(
        0,
        "Birinchi Xabarnoma",
        "siz 1000 yutib oldingiz",
        initSettings);
  }


}