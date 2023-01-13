import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/app_model.dart';

class ThirdNavigation extends StatelessWidget {
  const ThirdNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Third Screen"),
      ),
      body: Center(
          child: Column(
            verticalDirection: VerticalDirection.down,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Tap the button to move back to Navigation Home Screen"),
              TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.deepPurple, 
                      minimumSize: Size(88, 36),
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      )),
                  onPressed: () => backToHome(context),
                  child: const Text("Back to Home", style: TextStyle(color: Colors.white),)),
            ],
          )),
    );
  }

  void backToHome(BuildContext context) {
    context.read<AppModel>().setPageIndex(1);
    Navigator.popUntil(context, (route) => route.isFirst);
  }
}
