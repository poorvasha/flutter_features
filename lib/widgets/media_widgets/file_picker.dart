import 'dart:io';
import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart' as MediaPicker;
import 'package:image_picker/image_picker.dart';
import 'package:open_filex/open_filex.dart' as filex;
//import 'package:open_file/open_file.dart';

import 'bottom_modal.dart';
import 'package:file_picker/file_picker.dart' as AnyFilePicker;

class FilePicker extends StatefulWidget {
  const FilePicker({super.key});

  @override
  State<FilePicker> createState() => _FilePickerState();
}

class _FilePickerState extends State<FilePicker> {
  var pickedFile;
  final FilePicker _picker = FilePicker();

  pickFile() async {
    pickedFile =
        await AnyFilePicker.FilePicker.platform.pickFiles(allowMultiple: false);

    // if no file is picked
    if (pickedFile == null) return;
    onFileChoosed(pickedFile);
    // we will log the name, size and path of the
    // first picked file (if multiple are selected)
    print(pickedFile.files.first.name);
    print(pickedFile.files.first.size);
    print(pickedFile.files.first.path);
  }

  onFileChoosed(AnyFilePicker.FilePickerResult _pickedFile) {
    if (_pickedFile != null) {
      setState(() {
        pickedFile = _pickedFile;
      });
    }
    //Navigator.pop(context);
  }

  Future<void> openFile(AnyFilePicker.FilePickerResult _pickedFile) async{
   
    final result = await filex.OpenFilex.open((_pickedFile.files.first.path).toString());


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pick File')),
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
                  onPressed: () => pickFile(),
                  child: const Text(
                    "Upload File",
                    style: TextStyle(color: Colors.white),
                  )),
            ),
            LayoutBuilder(builder: (context, constraints) {
              if (pickedFile != null) {
                return GestureDetector(
                  onTap: () => openFile(pickedFile),
                  child: Container(
                    padding: EdgeInsets.all(20),
                      margin: EdgeInsets.all(20),
                      color: Color.fromARGB(255, 219, 219, 219),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(pickedFile.files.first.name),
                          Text(
                            (pickedFile.files.first.size).toString(),
                            style: TextStyle(color: Colors.red),
                          ),
                          Text((pickedFile.files.first.extension).toString())
                        ],
                      )),
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
}
