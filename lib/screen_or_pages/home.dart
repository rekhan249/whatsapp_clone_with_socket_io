import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatapp_clone_with_socket_io/constants/colors.dart';
import 'package:whatapp_clone_with_socket_io/screen_or_pages/fragments/calls.dart';
import 'package:whatapp_clone_with_socket_io/screen_or_pages/fragments/chats.dart';
import 'package:whatapp_clone_with_socket_io/screen_or_pages/fragments/status.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Rx<int> currentIndex = 0.obs;
    Map<String, dynamic> layouts = {
      "Chats": {"layout": const Chats(), "icon": const Icon(Icons.chat)},
      "Updates": {"layout": const Status(), "icon": const Icon(Icons.update)},
      "Calls": {"layout": const Calls(), "icon": const Icon(Icons.call)}
    };

    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => Column(
            children: [
              Expanded(
                  child: layouts.entries
                      .toList()[currentIndex.value]
                      .value["layout"])
            ],
          ),
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          selectedItemColor: lightGreen,
          unselectedItemColor: black,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.chat_outlined), label: "Chats"),
            BottomNavigationBarItem(icon: Icon(Icons.update), label: "Updates"),
            BottomNavigationBarItem(
                icon: Icon(Icons.call_rounded), label: "Calls"),
          ],
          backgroundColor: Colors.white,
          currentIndex: currentIndex.value,
          onTap: (value) {
            currentIndex.value = value;
          },
        ),
      ),
    );
  }
}
