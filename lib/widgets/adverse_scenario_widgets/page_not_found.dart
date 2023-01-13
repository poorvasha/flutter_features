import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PageNotFound extends StatelessWidget {
  const PageNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Sorry for inconvenience, Page Not Found!",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
      ),
    );
  }

  navtoSecondWidget(BuildContext context) {
    Navigator.pushNamed(context, '/SecondNavigation');
  }
}
