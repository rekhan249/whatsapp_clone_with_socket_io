import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatapp_clone_with_socket_io/constants/colors.dart';
import 'package:whatapp_clone_with_socket_io/constants/others.dart';
import 'package:whatapp_clone_with_socket_io/models/chat_model.dart';
import 'package:whatapp_clone_with_socket_io/routes/routes_all.dart';
import 'package:whatapp_clone_with_socket_io/screen_or_pages/fragments/custom_ui/custom_card.dart';

class Chats extends StatefulWidget {
  const Chats({super.key});

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  List<ChatModel> chatsModelList = [
    ChatModel(
        name: "Rehmat",
        icon: "assets/images/person.png",
        isGroup: false,
        time: setDateTime(DateTime.now())!,
        currentMessage: "hi how are you",
        status: '',
        isSelect: false),
    ChatModel(
        name: "REKhan",
        icon: "assets/images/person.png",
        isGroup: false,
        time: setDateTime(DateTime.now())!,
        currentMessage: "hi how are you",
        status: '',
        isSelect: false),
    ChatModel(
        name: "Khan",
        icon: "assets/images/person.png",
        isGroup: false,
        time: setDateTime(DateTime.now())!,
        currentMessage: "hi how are you",
        status: '',
        isSelect: false),
    ChatModel(
        name: "King",
        icon: "assets/images/group.png",
        isGroup: true,
        time: setDateTime(DateTime.now())!,
        currentMessage: "hi how are you",
        status: '',
        isSelect: false),
    ChatModel(
        name: "King",
        icon: "assets/images/person.png",
        isGroup: false,
        time: setDateTime(DateTime.now())!,
        currentMessage: "hi how are you",
        status: '',
        isSelect: false),
    ChatModel(
        name: "King",
        icon: "assets/images/group.png",
        isGroup: true,
        time: setDateTime(DateTime.now())!,
        currentMessage: "hi how are you",
        status: '',
        isSelect: false),
  ];
  ChatsMenuItems? chatsMenuItems;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: white,
        title: const Text(
          "WhatsApp",
          style: TextStyle(color: lightGreen, fontWeight: FontWeight.bold),
        ),
        actions: [
          Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.camera_alt_outlined, color: black)),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search, color: black)),
              PopupMenuButton<ChatsMenuItems>(
                position: PopupMenuPosition.over,
                iconColor: black,
                initialValue: chatsMenuItems,
                onSelected: (ChatsMenuItems item) {
                  setState(() {
                    chatsMenuItems = item;
                  });
                },
                itemBuilder: (BuildContext context) =>
                    <PopupMenuEntry<ChatsMenuItems>>[
                  PopupMenuItem<ChatsMenuItems>(
                    onTap: () {},
                    value: ChatsMenuItems.newGroup,
                    child: const Text('New Group'),
                  ),
                  PopupMenuItem<ChatsMenuItems>(
                    onTap: () {},
                    value: ChatsMenuItems.newBroadcast,
                    child: const Text('New Broadcast'),
                  ),
                  PopupMenuItem<ChatsMenuItems>(
                    onTap: () {},
                    value: ChatsMenuItems.linkedDevices,
                    child: const Text('Linked devices'),
                  ),
                  PopupMenuItem<ChatsMenuItems>(
                    onTap: () {},
                    value: ChatsMenuItems.starredMessages,
                    child: const Text('Starred messages'),
                  ),
                  PopupMenuItem<ChatsMenuItems>(
                    onTap: () {
                      Navigator.pushNamed(context, RouteGenerator.setting);
                    },
                    value: ChatsMenuItems.settings,
                    child: const Text('Settings'),
                  ),
                  PopupMenuItem<ChatsMenuItems>(
                    onTap: () {},
                    value: ChatsMenuItems.switchAccounts,
                    child: const Text('Switch accounts'),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: chatsModelList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Divider(thickness: 0.5.sp),
                    CustomCard(chatModel: chatsModelList[index]),
                  ],
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        backgroundColor: lightGreen,
        child: const Icon(
          Icons.chat_outlined,
          color: white,
        ),
        onPressed: () {},
      ),
    );
  }
}
