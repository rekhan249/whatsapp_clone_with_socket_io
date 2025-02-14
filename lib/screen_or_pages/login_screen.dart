import 'package:flutter/material.dart';
import 'package:whatapp_clone_with_socket_io/constants/others.dart';
import 'package:whatapp_clone_with_socket_io/models/chat_model.dart';
import 'package:whatapp_clone_with_socket_io/screen_or_pages/fragments/custom_ui/button_card.dart';
import 'package:whatapp_clone_with_socket_io/screen_or_pages/home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ChatModel? sourceChatModel;
  List<ChatModel> chatsModelList = [
    ChatModel(
        name: "Rehmat",
        icon: "assets/images/person.png",
        isGroup: false,
        time: setDateTime(DateTime.now())!,
        currentMessage: "hi how are you",
        status: '',
        isSelect: false,
        id: 1),
    ChatModel(
        name: "REKhan",
        icon: "assets/images/person.png",
        isGroup: false,
        time: setDateTime(DateTime.now())!,
        currentMessage: "hi how are you",
        status: '',
        isSelect: false,
        id: 2),
    ChatModel(
        name: "Khan",
        icon: "assets/images/person.png",
        isGroup: false,
        time: setDateTime(DateTime.now())!,
        currentMessage: "hi how are you",
        status: '',
        isSelect: false,
        id: 3),
    // ChatModel(
    //     name: "King",
    //     icon: "assets/images/group.png",
    //     isGroup: true,
    //     time: setDateTime(DateTime.now())!,
    //     currentMessage: "hi how are you",
    //     status: '',
    //     isSelect: false),
    ChatModel(
        name: "King",
        icon: "assets/images/person.png",
        isGroup: false,
        time: setDateTime(DateTime.now())!,
        currentMessage: "hi how are you",
        status: '',
        isSelect: false,
        id: 4),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: chatsModelList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              sourceChatModel = chatsModelList.removeAt(index);
              Navigator.push(context, MaterialPageRoute(builder: (context) => Home(chatsModelList:chatsModelList,sourceChatModel:sourceChatModel)));
            },
            child: ButtonCard(
                title: chatsModelList[index].name, iconData: Icons.person),
          );
        },
      ),
    );
  }
}
