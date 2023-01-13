import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_features/widgets/navigation_widgets/tabs/first_tab.dart';
import 'package:flutter_features/widgets/navigation_widgets/tabs/nav_flow_tab.dart';
import 'package:flutter_features/widgets/navigation_widgets/tabs/second_tab.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../main.dart';
import '../../models/app_model.dart';
import 'app_drawer.dart';

class NavigationDemo extends StatefulWidget {
  NavigationDemo({super.key, this.tabBarCount});
  int? tabBarCount;
  @override
  State<NavigationDemo> createState() => _NavigationDemoState();
}

class _NavigationDemoState extends State<NavigationDemo> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      endDrawer:  MenuDrawer(scaffoldKey : scaffoldKey),
      bottomNavigationBar: NavigationBar(
          onDestinationSelected: onDestinationSelected,
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
      body: Column(
       crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 20, 0),
              child: IconButton(
                icon: Icon(Icons.menu, color: Colors.black, size: 40),
                onPressed: () {
                  scaffoldKey.currentState?.openEndDrawer();
                },
              ),
            ),
          ),
          Expanded(
            child: [
              FristTab(onpressedNavToHome: navToHomeScreen),
              Navflow(onpressedNavToHome: navToHomeScreen),
              SecondTab(onpressedNavToHome: navToHomeScreen)
            ][context.watch<AppModel>().getcurrentPageIndex],
          ),
        ],
      ),
    );
  }

  navtoFirstWidget() {
    Navigator.pushNamed(context, '/FirstNavigation');
  }

  void navToHomeScreen() async {
    context.read<AppModel>().setRoute('/Home');
  }

  void onDestinationSelected(int index) {
    context.read<AppModel>().setPageIndex(index);
  }
}
