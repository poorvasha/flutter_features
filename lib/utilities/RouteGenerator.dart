import 'package:flutter/material.dart';
import 'package:flutter_features/widgets/local_notification_widgets/local_notification_home.dart';
import '../main.dart';
import '../widgets/adverse_scenario_widgets/page_not_found.dart';
import '../widgets/home_page.dart';
import '../widgets/media_widgets/file_picker.dart';
import '../widgets/media_widgets/image_picker.dart';
import '../widgets/media_widgets/media_home.dart';
import '../widgets/media_widgets/video_picker.dart';
import '../widgets/navigation_widgets/navigation_demo.dart';
import '../widgets/navigation_widgets/first_navigation.dart';
import '../widgets/navigation_widgets/second_navigation.dart';
import '../widgets/navigation_widgets/third_navigation.dart';

class RouteGenerator {
  static List<Route<dynamic>> returnOnGenerateIntialRoute(String initialRoute) {
    switch (initialRoute) {
      case '/Home':
        return [MaterialPageRoute(
            builder: ((context) => const MediaHome()))];
      case '/NavigationHome':
        return [MaterialPageRoute(
            builder: ((context) => NavigationDemo(tabBarCount: 4)))];
      case '/MediaHome':
        return [MaterialPageRoute(
            builder: ((context) => MediaHome()))];
      case '/LocalNotificationHome':
        return [MaterialPageRoute(
            builder: ((context) => LocalNotificationHome()))];
      default:
        return [MaterialPageRoute(
            builder: ((context) => const PageNotFound()))];
    }
  }


  static Route<dynamic> generateRoutesWithParams(RouteSettings settings) {
    switch (settings.name) {
      case '/Home':
        return MaterialPageRoute(
            builder: ((context) => const MediaHome()));
      case '/NavigationHome':
        return MaterialPageRoute(
            builder: ((context) =>
                NavigationDemo(tabBarCount: settings.arguments as int)));
      default:
        return MaterialPageRoute(
            builder: ((context) => const PageNotFound()));
    }
  }

  static Map<String, Widget Function(BuildContext)> generateRoutesWithoutParams() {
    return {
      '/FirstNavigation': (context) => const FirstNavigation(),
      '/SecondNavigation': (context) => const SecondNavigation(),
      '/ThirdNavigation': (context) => const ThirdNavigation(),
      '/MediaHome': (context) => const MediaHome(),
      '/ImagePicker' : (context) => const ImagePicker(),
      '/VideoPicker' : (context) => const VideoPicker(),
      '/FilePicker' : (context) => const FilePicker(),
      '/LocalNotificationHome' : (context) => const LocalNotificationHome(),
    };
  }
}