import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecondNavigation extends StatelessWidget {
  const SecondNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: Center(
          child: Column(
            verticalDirection: VerticalDirection.down,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Tap the button to move to Third Screen"),
              TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.deepPurple, 
                      minimumSize: Size(88, 36),
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      )),
                  onPressed: () => navtoThirdWidget(context),
                  child: const Text("Third Screen", style: TextStyle(color: Colors.white),)),
            ],
          )),
    );
  }

  navtoThirdWidget(BuildContext context) {
    Navigator.pushNamed(context, '/ThirdNavigation');
  }
}
