import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatapp_clone_with_socket_io/constants/colors.dart';
import 'package:whatapp_clone_with_socket_io/constants/others.dart';
import 'package:whatapp_clone_with_socket_io/models/chat_model.dart';
import 'package:whatapp_clone_with_socket_io/routes/routes_all.dart';
import 'package:whatapp_clone_with_socket_io/screen_or_pages/fragments/chats.dart';
import 'package:whatapp_clone_with_socket_io/screen_or_pages/fragments/custom_ui/button_card.dart';
import 'package:whatapp_clone_with_socket_io/screen_or_pages/fragments/custom_ui/contact_card.dart';

class SelectContacts extends StatefulWidget {
  const SelectContacts({super.key});

  @override
  State<SelectContacts> createState() => _SelectContactsState();
}

class _SelectContactsState extends State<SelectContacts> {
  SelectContactMenuItems? selectContactMenuItems;
  List<ChatModel> chatsModelListSelect = [
    ChatModel(
        name: "REKhan",
        icon: "assets/images/person.png",
        isGroup: false,
        time: setDateTime(DateTime.now())!,
        currentMessage: "hi how are you",
        status: 'Hey Hi,look I am using whatsapp here',
        isSelect: false,
        id: 1),
    ChatModel(
        name: "Rehmat",
        icon: "assets/images/person.png",
        isGroup: false,
        time: setDateTime(DateTime.now())!,
        currentMessage: "hi how are you",
        status: 'Hey Hi,look I am using whatsapp here',
        isSelect: false,
        id: 2),
    ChatModel(
        name: "REKhan",
        icon: "assets/images/person.png",
        isGroup: false,
        time: setDateTime(DateTime.now())!,
        currentMessage: "hi how are you",
        status: 'Hey Hi,look I am using whatsapp here',
        isSelect: false,
        id: 3),
    ChatModel(
        name: "Khan",
        icon: "assets/images/person.png",
        isGroup: false,
        time: setDateTime(DateTime.now())!,
        currentMessage: "hi how are you",
        status: 'Hey Hi,look I am using whatsapp here',
        isSelect: false,
        id: 4),
    ChatModel(
        name: "REKhan",
        icon: "assets/images/person.png",
        isGroup: false,
        time: setDateTime(DateTime.now())!,
        currentMessage: "hi how are you",
        status: 'Hey Hi,look I am using whatsapp here',
        isSelect: false,
        id: 5),
    ChatModel(
        name: "King",
        icon: "assets/images/group.png",
        isGroup: true,
        time: setDateTime(DateTime.now())!,
        currentMessage: "hi how are you",
        status: 'Hey Hi,look I am using whatsapp here',
        isSelect: false,
        id: 6),
    ChatModel(
        name: "King Khan",
        icon: "assets/images/group.png",
        isGroup: true,
        time: setDateTime(DateTime.now())!,
        currentMessage: "hi how are you",
        status: 'Hey Hi,look I am using whatsapp here',
        isSelect: false,
        id: 7),
    ChatModel(
        name: "REKhan",
        icon: "assets/images/person.png",
        isGroup: false,
        time: setDateTime(DateTime.now())!,
        currentMessage: "hi how are you",
        status: 'Hey Hi,look I am using whatsapp here',
        isSelect: false,
        id: 8),
    ChatModel(
        name: "Come fall",
        icon: "assets/images/group.png",
        isGroup: true,
        time: setDateTime(DateTime.now())!,
        currentMessage: "hi how are you",
        status: 'Hey Hi,look I am using whatsapp here',
        isSelect: false,
        id: 9),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leading: IconButton(
          padding: const EdgeInsets.all(0),
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Future.delayed(const Duration(milliseconds: 500), () {
              Navigator.push(
                  // ignore: use_build_context_synchronously
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Chats(),
                  ));
            });
          },
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select Contact",
              style: TextStyle(
                  fontSize: 20.sp, fontWeight: FontWeight.w600, color: black),
            ),
            Text(
              "Select Contact",
              style: TextStyle(fontSize: 13.sp),
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          PopupMenuButton<SelectContactMenuItems>(
            position: PopupMenuPosition.over,
            iconColor: black,
            initialValue: selectContactMenuItems,
            onSelected: (SelectContactMenuItems item) {
              setState(() {
                selectContactMenuItems = item;
              });
            },
            itemBuilder: (BuildContext context) =>
                <PopupMenuEntry<SelectContactMenuItems>>[
              PopupMenuItem<SelectContactMenuItems>(
                onTap: () {},
                value: SelectContactMenuItems.inviteAFriend,
                child: const Text('Invite a friend'),
              ),
              PopupMenuItem<SelectContactMenuItems>(
                onTap: () {},
                value: SelectContactMenuItems.contacts,
                child: const Text('Contacts'),
              ),
              PopupMenuItem<SelectContactMenuItems>(
                onTap: () {},
                value: SelectContactMenuItems.refresh,
                child: const Text('Refresh'),
              ),
              PopupMenuItem<SelectContactMenuItems>(
                onTap: () {},
                value: SelectContactMenuItems.help,
                child: const Text('Help'),
              ),
            ],
          ),
        ],
      ),
      body: ListView(
        children: [
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: chatsModelListSelect.length + 2,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              if (index == 0) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RouteGenerator.group);
                  },
                  child: const ButtonCard(
                      title: 'New Group', iconData: Icons.group),
                );
              } else if (index == 1) {
                return const ButtonCard(
                    title: 'New Contact', iconData: Icons.person);
              }
              return ContactCard(contact: chatsModelListSelect[index - 2]);
            },
          )
        ],
      ),
    );
  }
}
