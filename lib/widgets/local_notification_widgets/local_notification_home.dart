import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import '../../models/app_model.dart';
import '../../utilities/notification_api.dart';

class LocalNotificationHome extends StatefulWidget {
  const LocalNotificationHome({super.key});

  @override
  State<LocalNotificationHome> createState() => _LocalNotificationHomeState();
}

class _LocalNotificationHomeState extends State<LocalNotificationHome> {
  List mediaElemets = ["Notify Immediately", "Notify After 15 sec"];


  @override
  void initState() {
    
    super.initState();
    NotificationApi.init(context: context);
    listenNotification();
    // context.read<AppModel>().setRoute('/Home');
  }

  void listenNotification(){
    NotificationApi.onNotifications.stream.listen((onClickNotification));
  }
  void onClickNotification(String? payload){
    Navigator.pushNamed(context, '/SuccessfulNotification');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Center(child: Text("Local Notification"))),
        body: Stack(
          alignment: AlignmentDirectional.topCenter,
          fit: StackFit.passthrough,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 80, 0, 80),
              child: ListView.builder(
                  padding: EdgeInsets.all(20),
                  itemCount: mediaElemets.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => doSpecificMediaFunctionality(index),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            mediaElemets[index],
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(40),
              child: TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.black87,
                      minimumSize: Size(88, 36),
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      )),
                  onPressed: () => navToHomeScreen(),
                  child: const Text(
                    "See All Flutter Feature",
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          ],
        ));
  }

  void navToHomeScreen() async {
    context.read<AppModel>().setRoute('/Home');
  }

  Future doSpecificMediaFunctionality(int index) async {
    switch (mediaElemets[index]) {
      case "Notify Immediately":
        ShowNotification();
        break;
      case "Notify After 15 sec":
        Navigator.pushNamed(context, '/VideoPicker');
        break;
    }
  }

  void ShowNotification() {
    NotificationApi.ShowNotification(
        title: "Hey poorva",
        body: "We're very proud of you, congragulations for your career life");
  }
}
