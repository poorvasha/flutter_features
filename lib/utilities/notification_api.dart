import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_features/widgets/local_notification_widgets/local_notification_home.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';

import '../main.dart';

class NotificationApi {
  static final _notifications = FlutterLocalNotificationsPlugin();
  static final onNotifications = BehaviorSubject<String?>();

  static Future init({bool initSchedule = false, required BuildContext context}) async {
    final android = AndroidInitializationSettings('@mipmap/ic_launcher');
    final settings = InitializationSettings(android: android);
    await _notifications.initialize(
      settings,
      onDidReceiveNotificationResponse: (NotificationResponse NotificationResponse) => onDidReceiveNotificationResponse(NotificationResponse, context),
    );
  }

static void onDidReceiveNotificationResponse(NotificationResponse notificationResponse, BuildContext context) async {
    onNotifications.add(notificationResponse.payload);

    final String? payload = notificationResponse.payload;
    if (notificationResponse.payload != null) {
      debugPrint('notification payload: $payload');
    }
    
    // await Navigator.push(
    //   context,
    //   MaterialPageRoute<void>(builder: (context) => const LocalNotificationHome()),
    // );
  }
  

  static Future _notificationDetails() async {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'channel id',
        'change name',
        channelDescription: "klaxjsa",
        importance: Importance.max,
      ),
    );
  }

  static Future ShowNotification(
          {int id = 0, String? title, String? body, String? payload}) async =>
      _notifications.show(id, title, body, await _notificationDetails(),
          payload: payload);
}
