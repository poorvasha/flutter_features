import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_features/models/app_model.dart';
import 'package:flutter_features/widgets/home_page.dart';
import 'package:flutter_features/widgets/local_notification_widgets/local_notification_home.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'utilities/RouteGenerator.dart';
import 'widgets/adverse_scenario_widgets/page_not_found.dart';
import 'widgets/media_widgets/media_home.dart';
import 'widgets/navigation_widgets/navigation_demo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => AppModel()),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // context.read<AppModel>().setRoute('/Home');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        onGenerateRoute: RouteGenerator.generateRoutesWithParams,
        routes: RouteGenerator.generateRoutesWithoutParams(),
        home: DisplayHome());
  }

  Widget DisplayHome() {
    var currentroute = context.watch<AppModel>().getInitialRoute;
    switch(currentroute){
      case '/Home' : return MyHomePage(title: "flutter Feature");
      case '/NavigationHome' : return NavigationDemo();
      case '/MediaHome' : return MediaHome();
      case '/LocalNotificationHome' : return LocalNotificationHome();
      default : return PageNotFound();
    }
  }
}
