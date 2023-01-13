import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_features/widgets/navigation_widgets/app_drawer.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/app_model.dart';

class FirstNavigation extends StatelessWidget {
  const FirstNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Screen"),
      ),
      bottomNavigationBar: NavigationBar(
          onDestinationSelected: (value) =>
              onDestinationSelected(value, context),
          selectedIndex: context.watch<AppModel>().getcurrentPageIndex,
          backgroundColor: Colors.white,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.euro_symbol),
              label: "Tab 1",
            ),
            NavigationDestination(
              icon: Icon(Icons.assignment),
              label: "NavFlow",
            ),
            NavigationDestination(
              icon: Icon(Icons.account_balance_wallet),
              label: "Tab 2",
            )
          ]),
      body: Center(
          child: Column(
        verticalDirection: VerticalDirection.down,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Tap the button to move to Second Screen"),
          TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  minimumSize: Size(88, 36),
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  )),
              onPressed: () => navtoSecondWidget(context),
              child: const Text(
                "Second Screen",
                style: TextStyle(color: Colors.white),
              )),
        ],
      )),
    );
  }

  navtoSecondWidget(BuildContext context) {
    Navigator.pushNamed(context, '/SecondNavigation');
  }

  void onDestinationSelected(int index, BuildContext context) {
    if (index != Provider.of<AppModel>(context, listen: false).getcurrentPageIndex) {
      Navigator.popUntil(context, (route) => route.isFirst);
      context.read<AppModel>().setPageIndex(index);
    }
  }
}
