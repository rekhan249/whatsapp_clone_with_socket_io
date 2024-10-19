import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';
import 'package:whatapp_clone_with_socket_io/constants/colors.dart';

class RecordVideoPreview extends StatefulWidget {
  final String video;
  const RecordVideoPreview({super.key, required this.video});

  @override
  State<RecordVideoPreview> createState() => _RecordVideoPreviewState();
}

class _RecordVideoPreviewState extends State<RecordVideoPreview> {
  late VideoPlayerController _controller;
  @override
  void initState() {
    _controller = VideoPlayerController.file(
      File(widget.video),
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    );

    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back, color: white)),
        backgroundColor: black,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.crop_rotate, color: white)),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.emoji_emotions_outlined, color: white)),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.title, color: white)),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.edit, color: white)),
        ],
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(),
          child: Stack(
            children: [
              Container(
                  height: MediaQuery.of(context).size.height - 150,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(),
                  child: _controller.value.isInitialized
                      ? AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: VideoPlayer(_controller),
                        )
                      : Container()),
              Positioned(
                bottom: 0,
                child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(color: black),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: TextFormField(
                            style: const TextStyle(color: white),
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.add_photo_alternate,
                                    color: white),
                                contentPadding: EdgeInsets.all(10),
                                border: UnderlineInputBorder(
                                    borderSide: BorderSide.none),
                                hintText: "Add Caption here.....",
                                hintStyle: TextStyle(color: white)),
                          ),
                        ),
                        CircleAvatar(
                            backgroundColor: lightGreen,
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.send,
                                  color: white,
                                )))
                      ],
                    )),
              ),
              Align(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () {
                    _controller.value.isPlaying
                        ? _controller.pause()
                        : _controller.play();
                  },
                  child: Icon(
                    _controller.value.isPlaying
                        ? Icons.pause
                        : Icons.play_arrow,
                    color: white,
                    size: 50.sp,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
