import 'dart:io';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_features/widgets/media_widgets/play_video.dart';
import 'package:image_picker/image_picker.dart' as MediaPicker;
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

import 'bottom_modal.dart';

class VideoPicker extends StatefulWidget {
  const VideoPicker({super.key});

  @override
  State<VideoPicker> createState() => _VideoPickerState();
}

class _VideoPickerState extends State<VideoPicker> {
  var imagefile;
  final VideoPicker _picker = VideoPicker();
  VideoPlayerController? _controller;
  VideoPlayerController? _toBeDisposed;
  String? _retrieveDataError;

  openModal() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return BottomModalSheet("Video", onFileChoosed);
        });
  }

   onFileChoosed(XFile pickedFile) {
    if (pickedFile != null) {
      setState(() {
        _playVideo(pickedFile);
      });
    }
     Navigator.pop(context);
  }

  Future<void> _playVideo(XFile? file) async {
    if (file != null && mounted) {
      await _disposeVideoController();
      late VideoPlayerController controller;
      if (kIsWeb) {
        controller = VideoPlayerController.network(file.path);
      } else {
        controller = VideoPlayerController.file(File(file.path));
      }
      setState(() {
        _controller = controller;
      });

      // In web, most browsers won't honor a programmatic call to .play
      // if the video has a sound track (and is not muted).
      // Mute the video so it auto-plays in web!
      // This is not needed if the call to .play is the result of user
      // interaction (clicking on a "play" button, for example).
      const double volume = kIsWeb ? 0.0 : 1.0;
      await controller.setVolume(volume);
      await controller.initialize();
      await controller.setLooping(true);
      await controller.play();
    }
  }

  Widget _previewVideo() {
    if (_controller == null) {
      return const Text(
        'You have not yet picked a video',
        textAlign: TextAlign.center,
      );
    }
    return Padding(
      padding: const EdgeInsets.all(0),
      child: AspectRatioVideo(_controller),
    );
  }

  @override
  void dispose() {
    _disposeVideoController();

    super.dispose();
  }

  Future<void> _disposeVideoController() async {
    if (_toBeDisposed != null) {
      await _toBeDisposed!.dispose();
    }
    _toBeDisposed = _controller;
    _controller = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pick Video')),
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
                    "Upload Video",
                    style: TextStyle(color: Colors.white),
                  )),
            ),
            LayoutBuilder(builder: (context, constraints) {
              return _previewVideo();
            })
          ],
        ),
      ),
    );
  }
}
