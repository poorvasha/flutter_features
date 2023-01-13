import 'package:flutter/material.dart';
import 'package:flutter_features/models/app_model.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:notification_permissions/notification_permissions.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List features = ['Navigation', 'Media', 'Local Notification'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: ListView.builder(
              padding: EdgeInsets.all(20),
              itemCount: features.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => navigateToFeature(features[index]),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(features[index]),
                    ),
                  ),
                );
              })),
    );
  }

  navigateToFeature(String feature) async {
    try {
      switch (feature) {
        case 'Navigation':
          // SharedPreferences pref = await SharedPreferences.getInstance();
          // pref.setString('intialRoute', '/NavigationHomeScreen');
          // pref.getString('intialRoute');
          context.read<AppModel>().setRoute('/NavigationHome');
          // setState(() {
          //   intialRoute;
          // });
          //Navigator.pushNamedAndRemoveUntil(context, intialRoute.toString(), (route) => route.isFirst, arguments: 4);
          //Navigator.pushNamed(context, '/NavigationHomeScreen', arguments: 4);
          break;
        case "Media":
          context.read<AppModel>().setRoute('/MediaHome');
          break;

        case "Local Notification":
          FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
              FlutterLocalNotificationsPlugin();
          bool? isNotificationEnabled = await flutterLocalNotificationsPlugin
              .resolvePlatformSpecificImplementation<
                  AndroidFlutterLocalNotificationsPlugin>()
              ?.requestPermission();
          if (isNotificationEnabled!) {
            context.read<AppModel>().setRoute('/LocalNotificationHome');
          } else {
            NotificationPermissions.requestNotificationPermissions(
                iosSettings: const NotificationSettingsIos(
                    sound: true, badge: true, alert: true));
          }
      }
    } catch (e) {
      Exception(e);
    }
  }
}
