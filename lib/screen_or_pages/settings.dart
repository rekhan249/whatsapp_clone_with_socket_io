import 'package:flutter/material.dart';
import 'package:whatapp_clone_with_socket_io/constants/colors.dart';
import 'package:whatapp_clone_with_socket_io/constants/strings.dart';
import 'package:whatapp_clone_with_socket_io/screen_or_pages/setting_sub/privacy.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {}, icon: const Icon(Icons.arrow_back, color: black)),
        title: const Text(
          "Settings",
          style: TextStyle(color: lightGreen, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.search, color: black)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Divider(thickness: 0.5),
            ListTile(
              horizontalTitleGap: 0,
              minVerticalPadding: 0,
              contentPadding: const EdgeInsets.all(0),
              leading: CircleAvatar(
                radius: 50,
                child: Image.asset(
                  height: 70,
                  width: 70,
                  "assets/images/dp.png",
                  fit: BoxFit.cover,
                ),
              ),
              title: const Text(
                "User name",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("+923001234567"),
                  Text("Hey there! I am using whatsapp".substring(0, 21)),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.qr_code, color: lightGreen)),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_drop_down_circle_outlined,
                          color: lightGreen)),
                ],
              ),
            ),
            const Divider(thickness: 0.5),
            kHeightTen,
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: settingsTitlesList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Privacy(index: index)));
                  },
                  leading: Icon(settingsLeadingIconsList[index]),
                  title: Text(
                    settingsTitlesList[index],
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(settingsSubTitlesList[index]),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
