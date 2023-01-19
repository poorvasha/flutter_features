import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class Successfulnotification extends StatelessWidget {
  const Successfulnotification({super.key});

  @override
  Widget build(BuildContext context) {  
    return  Scaffold(
      appBar: AppBar(title: const Center(child: Text("Successful Notification"))),
      body: const Center(
        child: Text("Congrats Poorvasha \n Notification Tapped",
            textAlign: TextAlign.center,
            style: TextStyle(
                height: 1.5,
                color: Colors.red,
                fontSize: 24,
                fontWeight: FontWeight.bold)),
      ),
    );
  }
}
