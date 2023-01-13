import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart' as MediaPicker;
import 'package:image_picker/image_picker.dart';

import 'bottom_modal.dart';

class ImagePicker extends StatefulWidget {
  const ImagePicker({super.key});

  @override
  State<ImagePicker> createState() => _ImagePickerState();
}

class _ImagePickerState extends State<ImagePicker> {
  var imagefile;
  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pick Image')),
      body: Center(
        child: Column(
          children: [
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
                  onPressed: () => openModal(),
                  child: const Text(
                    "Upload Image",
                    style: TextStyle(color: Colors.white),
                  )),
            ),
            LayoutBuilder(builder: (context, constraints) {
              if (imagefile != null) {
                return Image.file(
                  imagefile,
                );
              } else {
                return Text("No Images");
              }
            })
          ],
        ),
      ),
    );
  }

  openModal() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return BottomModalSheet("Image", onFileChoosed);
        });
  }

  onFileChoosed(XFile pickedFile) {
    if (pickedFile != null) {
      setState(() {
        imagefile = File(pickedFile.path);
      });
    }
     Navigator.pop(context);
  }
}
