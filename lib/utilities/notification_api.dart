import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_features/widgets/local_notification_widgets/local_notification_home.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import '../main.dart';

class NotificationApi {
  static final _notifications = FlutterLocalNotificationsPlugin();
  static final onNotifications = BehaviorSubject<String?>();
  static Future init(
      {bool initSchedule = true, required BuildContext context}) async {
    final android = AndroidInitializationSettings('@mipmap/ic_launcher');
    final settings = InitializationSettings(android: android);
    await _notifications.initialize(
      settings,
      onDidReceiveNotificationResponse:
          (NotificationResponse NotificationResponse) =>
              onDidReceiveNotificationResponse(NotificationResponse, context),
    );

    if (initSchedule) {
      tz.initializeTimeZones();
    }
  }

  static void onDidReceiveNotificationResponse(
      NotificationResponse notificationResponse, BuildContext context) async {
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

  static Future ScheduleNotification(
      {int id = 0,
      String? title,
      String? body,
      String? payload,
      required DateTime scheduledDate}) async {
    _notifications.zonedSchedule(
        id,
        title,
        body,
        tz.TZDateTime.from(scheduledDate, tz.local),
        await _notificationDetails(),
        payload: payload,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  static Future ScheduleDailyNotification(
      {int id = 0,
      String? title,
      String? body,
      String? payload,
      required DateTime scheduledDate}) async {
    _notifications.zonedSchedule(id, title, body, scheduleDaily(const Time(8)),
        await _notificationDetails(),
        payload: payload,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time);
  }

  static tz.TZDateTime scheduleDaily(Time time) {
    final now = tz.TZDateTime.now(tz.local);
    final scheduledDate = tz.TZDateTime(
        tz.local, now.year, now.month, time.hour, time.minute, time.second);

    return scheduledDate.isBefore(now)
        ? scheduledDate.add(Duration(days: 1))
        : scheduledDate;
  }

  static Future ScheduleWeeklyNotification(
      {int id = 0,
      String? title,
      String? body,
      String? payload,
      required DateTime scheduledDate}) async {
    _notifications.zonedSchedule(
        id,
        title,
        body,
        scheduleWeekly(const Time(8),
            days: [DateTime.sunday, DateTime.saturday]),
        await _notificationDetails(),
        payload: payload,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime);
  }

  static tz.TZDateTime scheduleWeekly(Time time, {required List<int> days}) {
    tz.TZDateTime scheduledDate = scheduleDaily(time);

    while (days.contains(scheduledDate.weekday)) {
      return scheduledDate.add(Duration(days: 1));
    }
    return scheduledDate;
  }

  static Future ScheduleMonthlyNotification(
      {int id = 0,
      String? title,
      String? body,
      String? payload,
      required DateTime scheduledDate}) async {
    _notifications.zonedSchedule(id, title, body,
        scheduleMonthly(const Time(8)), await _notificationDetails(),
        payload: payload,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.dayOfMonthAndTime);
  }

  static tz.TZDateTime scheduleMonthly(Time time) {
    tz.TZDateTime scheduledDate = scheduleDaily(time);
    return scheduledDate;
  }
}
