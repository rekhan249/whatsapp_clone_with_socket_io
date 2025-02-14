// ignore_for_file: use_build_context_synchronously
import 'dart:math';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatapp_clone_with_socket_io/constants/colors.dart';
import 'package:whatapp_clone_with_socket_io/screen_or_pages/image_preview.dart';
import 'package:whatapp_clone_with_socket_io/screen_or_pages/record_video_preview.dart';

List<CameraDescription> camera = [];

class Camera extends StatefulWidget {
  const Camera({super.key});

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  late CameraController? _cameraController;
  late Future<void>? cameraValue;
  bool isRecording = false;
  bool flash = false;
  bool isFrontOfCamera = true;
  double transform = 0;
  @override
  void initState() {
    _cameraController = CameraController(camera[0], ResolutionPreset.high);
    cameraValue = _cameraController!.initialize();
    super.initState();
  }

  @override
  void dispose() {
    _cameraController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: Column(
        children: [
          FutureBuilder(
            future: cameraValue,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              return CameraPreview(_cameraController!);
            },
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(color: Colors.transparent),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        flash = !flash;
                      });
                    },
                    icon: Icon(
                      flash ? Icons.flash_on : Icons.flash_off,
                      size: 32.sp,
                      color: white,
                    )),
                GestureDetector(
                  onLongPress: () async {
                    await _cameraController!.startVideoRecording();
                    setState(() {
                      isRecording = true;
                    });
                  },
                  onLongPressUp: () async {
                    final path = await _cameraController!.stopVideoRecording();
                    setState(() {
                      isRecording = false;
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              RecordVideoPreview(video: path.path),
                        ));
                  },
                  onTap: () {
                    if (!isRecording) takePhoto(context);
                  },
                  child: isRecording
                      ? Icon(
                          Icons.radio_button_on,
                          size: 80.sp,
                          color: Colors.red,
                        )
                      : Icon(
                          Icons.panorama_fish_eye,
                          size: 80.sp,
                          color: white,
                        ),
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        isFrontOfCamera = !isFrontOfCamera;
                        transform = transform + pi;
                      });
                      int newIndex = isFrontOfCamera ? 0 : 1;
                      _cameraController = CameraController(
                          camera[newIndex], ResolutionPreset.high);
                      cameraValue = _cameraController!.initialize();
                    },
                    icon: Transform.rotate(
                      angle: transform,
                      child: Icon(
                        Icons.flip_camera_ios,
                        size: 32.sp,
                        color: white,
                      ),
                    )),
              ],
            ),
          ),
          const Text(
            "Hold for video, tap for photo",
            style: TextStyle(color: white),
          )
        ],
      ),
    );
  }

  void takePhoto(BuildContext context) async {
    final image = await _cameraController!.takePicture();
    await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ImagePreview(image: image.path)));
  }
}
