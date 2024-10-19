import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatapp_clone_with_socket_io/constants/colors.dart';

class ImagePreview extends StatefulWidget {
  final String image;
  const ImagePreview({super.key, required this.image});

  @override
  State<ImagePreview> createState() => _ImagePreviewState();
}

class _ImagePreviewState extends State<ImagePreview> {
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
                    child: Image.file(
                      File(widget.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 5.h),
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
                ],
              ))),
    );
  }
}
