import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatapp_clone_with_socket_io/constants/colors.dart';
import 'package:whatapp_clone_with_socket_io/constants/others.dart';
import 'package:whatapp_clone_with_socket_io/routes/routes_all.dart';

class Status extends StatefulWidget {
  const Status({super.key});

  @override
  State<Status> createState() => _StatusState();
}

class _StatusState extends State<Status> {
  @override
  Widget build(BuildContext context) {
    StatusMenuItems? statusMenuItems;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: white,
        title: const Text(
          "Updates",
          style: TextStyle(color: lightGreen, fontWeight: FontWeight.bold),
        ),
        actions: [
          Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search, color: black)),
              PopupMenuButton<StatusMenuItems>(
                position: PopupMenuPosition.over,
                iconColor: black,
                initialValue: statusMenuItems,
                onSelected: (StatusMenuItems item) {
                  setState(() {
                    statusMenuItems = item;
                  });
                },
                itemBuilder: (BuildContext context) =>
                    <PopupMenuEntry<StatusMenuItems>>[
                  PopupMenuItem<StatusMenuItems>(
                    onTap: () {},
                    value: StatusMenuItems.statusPrivacy,
                    child: const Text('Status privacy'),
                  ),
                  PopupMenuItem<StatusMenuItems>(
                    onTap: () {},
                    value: StatusMenuItems.createChannel,
                    child: const Text('Create channel'),
                  ),
                  PopupMenuItem<StatusMenuItems>(
                    onTap: () {
                      Navigator.pushNamed(context, RouteGenerator.setting);
                    },
                    value: StatusMenuItems.settings,
                    child: const Text('Settings'),
                  ),
                  PopupMenuItem<StatusMenuItems>(
                    onTap: () {},
                    value: StatusMenuItems.switchAccounts,
                    child: const Text('Switch accounts'),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        backgroundColor: lightGreen,
        child: const Icon(
          Icons.camera_alt,
          color: white,
        ),
        onPressed: () {
          Navigator.pushNamed(context, RouteGenerator.cameras);
        },
      ),
    );
  }
}
