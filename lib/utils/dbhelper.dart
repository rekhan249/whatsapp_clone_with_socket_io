import 'package:get_storage/get_storage.dart';

class Dbhelper {
  static void saveData(String email, String password) {
    GetStorage().write("email", email);
    GetStorage().write("password", password);
  }

  static (String?, String?) fetchValues() {
    var email = GetStorage().read<String>("email");
    var password = GetStorage().read<String>("password");
    return (email, password);
  }
}
