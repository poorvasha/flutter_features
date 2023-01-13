import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import '../../models/app_model.dart';

class MediaHome extends StatefulWidget {
  const MediaHome({super.key});

  @override
  State<MediaHome> createState() => _MediaHomeState();
}

class _MediaHomeState extends State<MediaHome> {
  List mediaElemets = ["Image Picker", "Video Picker", "File Picker"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Center(child: Text("Media"))),
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
  
  doSpecificMediaFunctionality(int index) {
    switch(mediaElemets[index]){
      case "Image Picker" : 
        Navigator.pushNamed(context, '/ImagePicker');
        break;
      case "Video Picker" :
        Navigator.pushNamed(context, '/VideoPicker');
        break;
      case "File Picker" :
        Navigator.pushNamed(context, '/FilePicker');
        break; 
    }
  }
}
