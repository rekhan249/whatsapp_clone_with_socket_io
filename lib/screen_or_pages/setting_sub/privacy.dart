// ignore_for_file: use_build_context_synchronously

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:whatapp_clone_with_socket_io/constants/colors.dart';
import 'package:whatapp_clone_with_socket_io/constants/strings.dart';
import 'package:whatapp_clone_with_socket_io/screen_or_pages/setting_sub/privacy_sub/lastseen.dart';

class Privacy extends StatelessWidget {
  final int index;
  const Privacy({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
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
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.search, color: black)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: privacyTitlesList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    if (index == 0) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LastSeenScreen(),
                          ));
                    }
                  },
                  title: Text(
                    privacyTitlesList[index],
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(
                    privacySubTitlesList[index],
                    style: const TextStyle(fontSize: 12),
                  ),
                );
              },
            ),
            ElevatedButton(
                onPressed: () async {
                  var status = await Permission.location.request();
                  if (status == PermissionStatus.permanentlyDenied) {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: const Text("Manaualy Allow Location"),
                              content: const Text(
                                  "Location permission were permanantly denied, You need to be access manualy though app setting"),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      openAppSettings();
                                    },
                                    child: const Text("Okay"))
                              ],
                            ));
                  } else if (status == PermissionStatus.granted) {
                    var position = await Geolocator.getCurrentPosition();
                    List<Placemark> placemarks = await placemarkFromCoordinates(
                        position.latitude, position.longitude);
                    for (var element in placemarks) {
                      if (kDebugMode) {
                        print(element.toJson());
                      }
                    }
                  }
                },
                child: const Text("Fetch Location"))
          ],
        ),
      ),
    );
  }
}
