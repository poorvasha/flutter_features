import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

typedef onPressedCallBack = Function();

class SecondTab extends StatelessWidget {
  const SecondTab({super.key, required this.onpressedNavToHome});
  final onPressedCallBack onpressedNavToHome;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      verticalDirection: VerticalDirection.down,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RichText(
            text: const TextSpan(children: [
          TextSpan(
              text: "Tab 2",
              style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
        ])),
        SizedBox(height: 30),
        RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(children: [
              TextSpan(
                  text: "Move to ",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.black)),
              TextSpan(
                  text: "NavFlow Tab ",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple)),
              TextSpan(
                  text: "to see the navigation flow.",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.black)),
            ])),
        SizedBox(height: 30),
        TextButton(
            style: TextButton.styleFrom(
                backgroundColor: Colors.black87,
                minimumSize: Size(88, 36),
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                )),
            onPressed: onpressedNavToHome,
            child: const Text(
              "See All Flutter Feature",
              style: TextStyle(color: Colors.white),
            )),
      ],
    ));
  }
}
