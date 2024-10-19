import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:whatapp_clone_with_socket_io/constants/colors.dart';
import 'package:whatapp_clone_with_socket_io/constants/others.dart';
import 'package:whatapp_clone_with_socket_io/routes/routes_all.dart';

class Calls extends StatefulWidget {
  const Calls({super.key});

  @override
  State<Calls> createState() => _CallsState();
}

class _CallsState extends State<Calls> {
  @override
  Widget build(BuildContext context) {
    CallsMenuItems? callsMenuItems;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: white,
        title: const Text(
          "Calls",
          style: TextStyle(color: lightGreen, fontWeight: FontWeight.bold),
        ),
        actions: [
          Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search, color: black)),
              PopupMenuButton<CallsMenuItems>(
                position: PopupMenuPosition.over,
                iconColor: black,
                initialValue: callsMenuItems,
                onSelected: (CallsMenuItems item) {
                  setState(() {
                    callsMenuItems = item;
                  });
                  log("message ${callsMenuItems.runtimeType}");
                },
                itemBuilder: (BuildContext context) =>
                    <PopupMenuEntry<CallsMenuItems>>[
                  PopupMenuItem<CallsMenuItems>(
                    onTap: () {},
                    value: CallsMenuItems.clearCallLog,
                    child: const Text('Clear call log'),
                  ),
                  PopupMenuItem<CallsMenuItems>(
                    onTap: () {
                      Navigator.pushNamed(context, RouteGenerator.setting);
                    },
                    value: CallsMenuItems.settings,
                    child: const Text('Settings'),
                  ),
                  PopupMenuItem<CallsMenuItems>(
                    onTap: () {},
                    value: CallsMenuItems.switchAccounts,
                    child: const Text('Switch accounts'),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
