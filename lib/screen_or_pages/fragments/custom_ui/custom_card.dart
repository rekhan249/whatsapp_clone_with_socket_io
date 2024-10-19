import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatapp_clone_with_socket_io/constants/colors.dart';
import 'package:whatapp_clone_with_socket_io/models/chat_model.dart';
import 'package:whatapp_clone_with_socket_io/screen_or_pages/fragments/custom_ui/individual.dart';

class CustomCard extends StatelessWidget {
  final ChatModel chatModel;
  const CustomCard({super.key, required this.chatModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Individual(chatModel: chatModel)));
      },
      child: ListTile(
        tileColor: white,
        minTileHeight: 0,
        leading: CircleAvatar(
          radius: 28.r,
          backgroundColor: grey.withOpacity(0.2),
          child: Image.asset(
            chatModel.isGroup
                ? "assets/images/group.png"
                : "assets/images/person.png",
            color: grey,
            height: 35,
            width: 35,
          ),
        ),
        title: Text(
          chatModel.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Row(
          children: [
            Icon(Icons.done_all, color: grey, size: 16.sp),
            kWidthFive,
            Text(
              chatModel.currentMessage,
              style: const TextStyle(color: grey),
            ),
          ],
        ),
        trailing: Text(chatModel.time),
      ),
    );
  }
}
