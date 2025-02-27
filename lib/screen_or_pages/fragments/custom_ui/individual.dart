// ignore_for_file: library_prefixes

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatapp_clone_with_socket_io/constants/colors.dart';
import 'package:whatapp_clone_with_socket_io/constants/others.dart';
import 'package:whatapp_clone_with_socket_io/constants/strings.dart';
import 'package:whatapp_clone_with_socket_io/models/chat_model.dart';
import 'package:whatapp_clone_with_socket_io/models/message_model.dart';
import 'package:whatapp_clone_with_socket_io/screen_or_pages/fragments/chats.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:whatapp_clone_with_socket_io/screen_or_pages/fragments/custom_ui/own_message_card.dart';
import 'package:whatapp_clone_with_socket_io/screen_or_pages/fragments/custom_ui/reply_card.dart';

class Individual extends StatefulWidget {
  final ChatModel? chatModel;
  final ChatModel? sourceChatModel;
  const Individual({super.key, this.chatModel, this.sourceChatModel});

  @override
  State<Individual> createState() => _IndividualState();
}

class _IndividualState extends State<Individual> {
  SingleChatMenuItems? singleChatMenuItems;
  bool show = false;
  FocusNode focusNode = FocusNode();
  IO.Socket? socket;
  bool micOrSend = false;
  List<MessageModel> messageModelList = [];
  @override
  void initState() {
    super.initState();

    focusNode.addListener(
      () {
        if (focusNode.hasFocus) {
          setState(() {
            show = false;
          });
        }
      },
    );

    socket = IO.io('http://192.168.100.227:5000', <String, dynamic>{
      'transports': ['websocket'], // Ensure WebSocket transport
      'autoConnect': true,
    });

    socket?.on('connect', (_) {
      if (kDebugMode) {
        print('Connected to server');
      }
      socket?.emit('signin', widget.sourceChatModel!.id);
    });
    socket?.onConnect((data) {
      if (kDebugMode) {
        print(socket!.connected);
      }
      socket?.on("message", (data) {
        setMessage("destination", data["message"]);
      });
    });
  }

  void sendMessages(String message, int sourceId, targetId) {
    setMessage("source", message);
    socket?.emit("message",
        {"message": message, "sourceId": sourceId, "targetId": targetId});
  }

  void setMessage(String type, String message) {
    MessageModel messageModel = MessageModel(
        type: type, message: message, time: DateTime.now().toString());
    setState(() {
      setState(() {
        messageModelList.add(messageModel);
      });
    });
  }

  var textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leadingWidth: 95,
        leading: Row(
          children: [
            IconButton(
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
            CircleAvatar(
              radius: 23,
              backgroundColor: grey.withValues(alpha: 0.4),
              child: Image.asset(widget.chatModel!.icon, height: 35, width: 35),
            ),
          ],
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.chatModel!.name,
              style: TextStyle(
                  fontSize: 20.sp, fontWeight: FontWeight.w600, color: black),
            ),
            Text(
              "last seen time ago",
              style: TextStyle(fontSize: 13.sp),
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.videocam)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
          PopupMenuButton<SingleChatMenuItems>(
            position: PopupMenuPosition.over,
            iconColor: black,
            initialValue: singleChatMenuItems,
            onSelected: (SingleChatMenuItems item) {
              setState(() {
                singleChatMenuItems = item;
              });
            },
            itemBuilder: (BuildContext context) =>
                <PopupMenuEntry<SingleChatMenuItems>>[
              PopupMenuItem<SingleChatMenuItems>(
                onTap: () {},
                value: SingleChatMenuItems.viewContact,
                child: const Text('View contact'),
              ),
              PopupMenuItem<SingleChatMenuItems>(
                onTap: () {},
                value: SingleChatMenuItems.report,
                child: const Text('Report'),
              ),
              PopupMenuItem<SingleChatMenuItems>(
                onTap: () {},
                value: SingleChatMenuItems.block,
                child: const Text('Block'),
              ),
              PopupMenuItem<SingleChatMenuItems>(
                onTap: () {},
                value: SingleChatMenuItems.search,
                child: const Text('Search'),
              ),
              PopupMenuItem<SingleChatMenuItems>(
                onTap: () {},
                value: SingleChatMenuItems.muteNotifications,
                child: const Text('Mute notifications'),
              ),
              PopupMenuItem<SingleChatMenuItems>(
                onTap: () {},
                value: SingleChatMenuItems.disappearingMessages,
                child: const Text('Disappearing messages'),
              ),
              PopupMenuItem<SingleChatMenuItems>(
                onTap: () {},
                value: SingleChatMenuItems.wallpaper,
                child: const Text('Wallpaper'),
              ),
              PopupMenuItem<SingleChatMenuItems>(
                onTap: () {},
                value: SingleChatMenuItems.mediaLinksDocs,
                child: const Text('Media links, and docs'),
              ),
              PopupMenuItem<SingleChatMenuItems>(
                onTap: () {},
                value: SingleChatMenuItems.clearChat,
                child: const Text('Clear chat'),
              ),
              PopupMenuItem<SingleChatMenuItems>(
                onTap: () {},
                value: SingleChatMenuItems.exportChat,
                child: const Text('Export chat'),
              ),
              PopupMenuItem<SingleChatMenuItems>(
                onTap: () {},
                value: SingleChatMenuItems.addShortcut,
                child: const Text('Add shortcut'),
              ),
            ],
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(),
        child: PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) {
            if (show) {
              setState(() {
                show = false;
              });
            } else {
              Navigator.pop(context);
            }
          },
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  controller: _scrollController,
                  shrinkWrap: true,
                  itemCount: messageModelList.length + 1,
                  itemBuilder: (context, index) {
                    if (index == messageModelList.length) {
                      return Container(height: 30);
                    }
                    if (messageModelList[index].type == "source") {
                      return OwnMessageCard(
                        message: messageModelList[index].message,
                        time: messageModelList[index].time,
                      );
                    } else {
                      return ReplyCard(
                        reply: messageModelList[index].message,
                        time: messageModelList[index].time,
                      );
                    }
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: const EdgeInsets.all(0),
                  height: 60,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width - 55,
                            decoration: const BoxDecoration(),
                            child: Card(
                              margin: EdgeInsets.only(
                                  left: 2.w, right: 2.w, bottom: 8.h),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.r)),
                              child: TextFormField(
                                controller: textController,
                                focusNode: focusNode,
                                textAlignVertical: TextAlignVertical.center,
                                keyboardType: TextInputType.multiline,
                                minLines: 1,
                                maxLines: 5,
                                decoration: InputDecoration(
                                  focusedBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide.none),
                                  enabledBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide.none),
                                  hintText: "Type a message...",
                                  prefixIcon: IconButton(
                                    onPressed: () {
                                      focusNode.unfocus();
                                      focusNode.canRequestFocus = false;
                                      setState(() {
                                        show = !show;
                                      });
                                    },
                                    icon: const Icon(Icons.emoji_emotions,
                                        color: tealGreen),
                                  ),
                                  suffixIcon: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            showModalBottomSheet(
                                                context: context,
                                                builder: (context) =>
                                                    bottomSheet());
                                          },
                                          icon: const Icon(Icons.attach_file,
                                              color: tealGreen)),
                                      IconButton(
                                          onPressed: () {},
                                          icon: const Icon(Icons.camera_alt,
                                              color: tealGreen)),
                                    ],
                                  ),
                                ),
                                onChanged: (value) {
                                  if (value.isNotEmpty) {
                                    setState(() {
                                      micOrSend = true;
                                    });
                                  } else {
                                    setState(() {
                                      micOrSend = true;
                                    });
                                  }
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 4.0),
                            child: CircleAvatar(
                              backgroundColor: Colors.grey,
                              radius: 25.r,
                              child: IconButton(
                                  onPressed: () {
                                    if (micOrSend) {
                                      _scrollController.animateTo(
                                          _scrollController
                                              .position.maxScrollExtent,
                                          duration:
                                              const Duration(milliseconds: 300),
                                          curve: Curves.ease);
                                      sendMessages(
                                          textController.text,
                                          widget.sourceChatModel!.id,
                                          widget.chatModel!.id);
                                      textController.clear();
                                      setState(() {
                                        micOrSend = false;
                                      });
                                    }
                                  },
                                  icon: Icon(micOrSend ? Icons.send : Icons.mic,
                                      color: tealGreen, size: 30.sp)),
                            ),
                          )
                        ],
                      ),
                      show ? emojiPicker() : Container()
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget emojiPicker() {
    return EmojiPicker(
      onEmojiSelected: (category, emoji) {
        debugPrint(emoji.toString());
        setState(() {
          textController.text = textController.text + emoji.emoji;
        });
      },
    );
  }

  Widget bottomSheet() {
    return Container(
        height: 278.h,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(),
        child: Card(
          margin: const EdgeInsets.all(18),
          child: Column(
            children: [
              kHeightFifteen,
              Row(
                children: [
                  CustomIconsForBottomSheets(
                      iconsImage: '${mainIconsString}gallery.png',
                      nameIcons: 'Gallery',
                      color: Colors.blue,
                      onTap: () {
                        Navigator.pop(context);
                      }),
                  CustomIconsForBottomSheets(
                    iconsImage: '${mainIconsString}camera.png',
                    nameIcons: 'Camera',
                    color: Colors.red,
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  CustomIconsForBottomSheets(
                    iconsImage: '${mainIconsString}location.png',
                    nameIcons: 'Location',
                    color: lightGreen,
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  CustomIconsForBottomSheets(
                    iconsImage: '${mainIconsString}contact.png',
                    nameIcons: 'Contact',
                    color: const Color.fromARGB(255, 1, 60, 109),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  CustomIconsForBottomSheets(
                    iconsImage: '${mainIconsString}calllink.png',
                    nameIcons: 'Call link',
                    color: lightGreen,
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              kHeightTwentyF,
              Row(
                children: [
                  CustomIconsForBottomSheets(
                    iconsImage: '${mainIconsString}docs.png',
                    nameIcons: 'Documents',
                    color: const Color.fromARGB(255, 74, 3, 87),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  CustomIconsForBottomSheets(
                    iconsImage: '${mainIconsString}audio.png',
                    nameIcons: 'Audio',
                    color: Colors.deepOrange,
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  CustomIconsForBottomSheets(
                    iconsImage: '${mainIconsString}poll.png',
                    nameIcons: 'Poll',
                    color: Colors.amberAccent,
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  CustomIconsForBottomSheets(
                    iconsImage: '${mainIconsString}images.png',
                    nameIcons: 'Imagine',
                    color: const Color.fromARGB(255, 28, 8, 206),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              )
            ],
          ),
        ));
  }
}

class CustomIconsForBottomSheets extends StatelessWidget {
  final String iconsImage, nameIcons;
  final Color color;
  final VoidCallback onTap;
  const CustomIconsForBottomSheets(
      {super.key,
      required this.iconsImage,
      required this.nameIcons,
      required this.color,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.r)),
              color: white,
            ),
            child: Image.asset(iconsImage,
                cacheHeight: 25, cacheWidth: 25, color: color),
          ),
          Text(
            nameIcons,
            style: TextStyle(fontSize: 12.sp),
          )
        ],
      ),
    );
  }
}
