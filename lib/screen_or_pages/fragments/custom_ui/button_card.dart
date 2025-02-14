import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatapp_clone_with_socket_io/constants/colors.dart';

class ButtonCard extends StatelessWidget {
  final String title;
  final IconData iconData;
  const ButtonCard({super.key, required this.title, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
          radius: 25.r,
          backgroundColor: lightGreen,
          child: Icon(iconData, color: white, size: 30.sp)),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
