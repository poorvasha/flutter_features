import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationApi {
  static final _notifications = FlutterLocalNotificationsPlugin();

  static Future _notificationDetails() async {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'channel id',
        'change name',
        channelDescription: 'Channel Description',
        importance: Importance.max,
      ),
      iOS: DarwinNotificationDetails(),
    );
  }

  static Future ShowNotification(
          {int id = 0, String? title, String? body, String? payload}) async =>
      _notifications.show(id, title, body, await _notificationDetails(),
          payload: payload);
}
