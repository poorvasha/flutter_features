import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

typedef onPressedCallBack = Function();

class Navflow extends StatelessWidget {
  const Navflow({super.key, required this.onpressedNavToHome});
  final onPressedCallBack onpressedNavToHome;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      verticalDirection: VerticalDirection.down,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("Navigation Flow",
            style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
        const SizedBox(height: 30),
        const Text("Tap the button to move to First Screen"),
        TextButton(
            style: TextButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                minimumSize: const Size(88, 36),
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                )),
            onPressed: () => navtoFirstWidget(context),
            child: const Text(
              "First Screen",
              style: TextStyle(color: Colors.white),
            )),
        const SizedBox(height: 30),
        TextButton(
            style: TextButton.styleFrom(
                backgroundColor: Colors.black87,
                minimumSize: const Size(88, 36),
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
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

  navtoFirstWidget(BuildContext context) {
    Navigator.pushNamed(context, '/FirstNavigation');
  }
}
