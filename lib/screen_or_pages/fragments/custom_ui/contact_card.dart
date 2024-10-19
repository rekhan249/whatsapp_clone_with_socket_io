import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatapp_clone_with_socket_io/constants/colors.dart';
import 'package:whatapp_clone_with_socket_io/models/chat_model.dart';

class ContactCard extends StatelessWidget {
  final ChatModel contact;
  const ContactCard({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 10,
      minTileHeight: 50,
      leading: Container(
        height: 45,
        width: 45,
        decoration: const BoxDecoration(),
        child: Stack(
          children: [
            CircleAvatar(
              radius: 25.r,
              backgroundColor: grey.withOpacity(0.5),
              child: Image.asset("assets/images/person.png",
                  height: 40.h, width: 40.w),
            ),
            contact.isSelect
                ? Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 9.r,
                      backgroundColor: tealGreen,
                      child: Icon(
                        Icons.check,
                        color: white,
                        size: 12.sp,
                      ),
                    ))
                : Container()
          ],
        ),
      ),
      title: Text(
        contact.name,
        style: TextStyle(
            fontWeight: FontWeight.w600, color: black.withOpacity(0.6)),
      ),
      subtitle: Text(
        contact.status,
      ),
    );
  }
}
