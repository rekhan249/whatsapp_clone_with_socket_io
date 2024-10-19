import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatapp_clone_with_socket_io/constants/colors.dart';
import 'package:whatapp_clone_with_socket_io/constants/others.dart';
import 'package:whatapp_clone_with_socket_io/models/chat_model.dart';
import 'package:whatapp_clone_with_socket_io/screen_or_pages/fragments/chats.dart';
import 'package:whatapp_clone_with_socket_io/screen_or_pages/fragments/custom_ui/contact_card.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({super.key});

  @override
  State<CreateGroup> createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  SelectContactMenuItems? selectContactMenuItems;
  List<ChatModel> chatsModelListSelect = [
    ChatModel(
        name: "REKhan",
        icon: "assets/images/person.png",
        isGroup: false,
        time: setDateTime(DateTime.now())!,
        currentMessage: "hi how are you",
        status: 'Hey Hi,look I am using whatsapp here',
        isSelect: false),
    ChatModel(
        name: "Rehmat",
        icon: "assets/images/person.png",
        isGroup: false,
        time: setDateTime(DateTime.now())!,
        currentMessage: "hi how are you",
        status: 'Hey Hi,look I am using whatsapp here',
        isSelect: false),
    ChatModel(
        name: "REKhan",
        icon: "assets/images/person.png",
        isGroup: false,
        time: setDateTime(DateTime.now())!,
        currentMessage: "hi how are you",
        status: 'Hey Hi,look I am using whatsapp here',
        isSelect: false),
    ChatModel(
        name: "Khan",
        icon: "assets/images/person.png",
        isGroup: false,
        time: setDateTime(DateTime.now())!,
        currentMessage: "hi how are you",
        status: 'Hey Hi,look I am using whatsapp here',
        isSelect: false),
    ChatModel(
        name: "REKhan",
        icon: "assets/images/person.png",
        isGroup: false,
        time: setDateTime(DateTime.now())!,
        currentMessage: "hi how are you",
        status: 'Hey Hi,look I am using whatsapp here',
        isSelect: false),
    ChatModel(
        name: "King",
        icon: "assets/images/group.png",
        isGroup: true,
        time: setDateTime(DateTime.now())!,
        currentMessage: "hi how are you",
        status: 'Hey Hi,look I am using whatsapp here',
        isSelect: false),
    ChatModel(
        name: "King Khan",
        icon: "assets/images/group.png",
        isGroup: true,
        time: setDateTime(DateTime.now())!,
        currentMessage: "hi how are you",
        status: 'Hey Hi,look I am using whatsapp here',
        isSelect: false),
    ChatModel(
        name: "REKhan",
        icon: "assets/images/person.png",
        isGroup: false,
        time: setDateTime(DateTime.now())!,
        currentMessage: "hi how are you",
        status: 'Hey Hi,look I am using whatsapp here',
        isSelect: false),
    ChatModel(
        name: "Come fall",
        icon: "assets/images/group.png",
        isGroup: true,
        time: setDateTime(DateTime.now())!,
        currentMessage: "hi how are you",
        status: 'Hey Hi,look I am using whatsapp here',
        isSelect: false),
  ];
  List<ChatModel> selectionForGroup = [];
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
              "New Group",
              style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: black.withOpacity(0.5)),
            ),
            Text(
              "Add Participants",
              style: TextStyle(fontSize: 13.sp),
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        ],
      ),
      body: Stack(
        children: [
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: chatsModelListSelect.length + 1,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Container(
                  height: selectionForGroup.isNotEmpty ? 80.h : 10.h,
                );
              }
              return InkWell(
                  onTap: () {
                    if (chatsModelListSelect[index - 1].isSelect == false) {
                      setState(() {
                        chatsModelListSelect[index - 1].isSelect = true;
                        selectionForGroup.add(chatsModelListSelect[index - 1]);
                      });
                    } else {
                      setState(() {
                        selectionForGroup
                            .remove(chatsModelListSelect[index - 1]);
                        chatsModelListSelect[index - 1].isSelect = false;
                      });
                    }
                  },
                  child: ContactCard(contact: chatsModelListSelect[index - 1]));
            },
          ),
          selectionForGroup.isNotEmpty
              ? Column(
                  children: [
                    Container(
                      height: 70.h,
                      padding: EdgeInsets.only(left: 5.w, right: 5.w),
                      width: MediaQuery.of(context).size.height,
                      decoration:
                          const BoxDecoration(color: Colors.transparent),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: chatsModelListSelect.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          if (chatsModelListSelect[index].isSelect == true) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  selectionForGroup
                                      .remove(chatsModelListSelect[index]);
                                  chatsModelListSelect[index].isSelect = false;
                                });
                              },
                              child: CustomCardForGroup(
                                  contact: chatsModelListSelect[index]),
                            );
                          } else {
                            return Container();
                          }
                        },
                      ),
                    ),
                    Divider(thickness: 1.h),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }
}

class CustomCardForGroup extends StatelessWidget {
  final ChatModel contact;
  const CustomCardForGroup({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: Column(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 25.r,
                backgroundColor: grey.withOpacity(0.5),
                child: Image.asset(contact.icon, height: 40.h, width: 40.w),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                  radius: 9.r,
                  backgroundColor: grey,
                  child: Icon(
                    Icons.clear,
                    color: white,
                    size: 12.sp,
                  ),
                ),
              ),
            ],
          ),
          Text(
            contact.name,
            style: TextStyle(fontSize: 12.sp),
          )
        ],
      ),
    );
  }
}
