import 'package:cross_file/cross_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker/image_picker.dart' as MediaPicker;

class BottomModalSheet extends StatefulWidget {
  BottomModalSheet(this.mediaType, this.onFileChoosed, {Key? key}) : super(key: key);
  String mediaType;
  Function onFileChoosed;
  @override
  State<BottomModalSheet> createState() => _BottomModalSheetState();
}

class _BottomModalSheetState extends State<BottomModalSheet> {


  Future OpenPicker(
      BuildContext context, ImageSource pickerType, String fileType) async {
    XFile? pickedFile;
    if (fileType == "Video") {
      pickedFile = await MediaPicker.ImagePicker().pickVideo(
        source: pickerType,
      );
    } else if (fileType == "Image") {
      pickedFile = await MediaPicker.ImagePicker().pickImage(
        source: pickerType,
      );
    }
    
    if (pickedFile != null) {
      widget.onFileChoosed(pickedFile);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ListTile(
          leading: new Icon(Icons.browse_gallery),
          title: new Text('Gallary'),
          onTap: () =>
              OpenPicker(context, ImageSource.gallery, widget.mediaType),
        ),
        ListTile(
          leading: new Icon(Icons.camera),
          title: new Text('Camera'),
          onTap: () =>
              OpenPicker(context, ImageSource.camera, widget.mediaType),
        ),
      ],
    );
  }
}
