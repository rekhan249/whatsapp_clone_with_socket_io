// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:whatapp_clone_with_socket_io/constants/colors.dart';
import 'package:whatapp_clone_with_socket_io/getx_controllers/setting_control.dart';

enum LastSeenElements { everyone, myContact, myContactExcept, noBody }

class LastSeenScreen extends StatelessWidget {
  const LastSeenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingControl settingControl = Get.put(SettingControl());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back, color: black)),
        title: const Text(
          "Privacy",
          style: TextStyle(color: lightGreen, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Who can see my last seen"),
            Obx(
              () => Column(
                  children: LastSeenElements.values
                      .map((e) => RadioListTile(
                            contentPadding: const EdgeInsets.all(0),
                            title: Text(e.name),
                            value: e,
                            groupValue: settingControl.lastSeenElements.value,
                            onChanged: (value) {
                              settingControl.lastSeenElements.value = value!;
                              GetStorage().write("last_seen", value.name);
                            },
                          ))
                      .toList()),
            ),
            const Text("Who can see when I'm online"),
            Obx(
              () => Column(
                  children: LastSeenElements.values
                      .map((e) => RadioListTile(
                            contentPadding: const EdgeInsets.all(0),
                            title: Text(e.name),
                            value: e,
                            groupValue: settingControl.lastSeenElements.value,
                            onChanged: (value) {
                              settingControl.lastSeenElements.value = value!;
                            },
                          ))
                      .toList()),
            ),
            kHeightTen,
            const Text(
                "If you don't share when you were last seen or online you won't be able to see when other people were last seen or online"),
          ],
        ),
      ),
    );
  }
}
