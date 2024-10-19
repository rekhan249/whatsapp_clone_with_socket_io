import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:whatapp_clone_with_socket_io/screen_or_pages/setting_sub/privacy_sub/lastseen.dart';

class SettingControl extends GetxController {
  late Rx<LastSeenElements> lastSeenElements =
      Rx(getLastSeenElements() ?? LastSeenElements.noBody);

  @override
  void onInit() {
    GetStorage().listenKey(
      "last_seen",
      (value) {
        if (value != null) {
          lastSeenElements.value = LastSeenElements.values.byName(value);
        }
      },
    );
    super.onInit();
  }

  LastSeenElements? getLastSeenElements() {
    var lastSeen = GetStorage().read<String>("last_seen");
    if (lastSeen != null) {
      return LastSeenElements.values.byName(lastSeen);
    }
    return null;
  }
}
