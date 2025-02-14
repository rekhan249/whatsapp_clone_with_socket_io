import 'package:flutter/material.dart';
import 'package:whatapp_clone_with_socket_io/screen_or_pages/camera.dart';
import 'package:whatapp_clone_with_socket_io/screen_or_pages/create_group.dart';
import 'package:whatapp_clone_with_socket_io/screen_or_pages/fragments/calls.dart';
import 'package:whatapp_clone_with_socket_io/screen_or_pages/fragments/chats.dart';
import 'package:whatapp_clone_with_socket_io/screen_or_pages/fragments/status.dart';
import 'package:whatapp_clone_with_socket_io/screen_or_pages/home.dart';
import 'package:whatapp_clone_with_socket_io/screen_or_pages/login_screen.dart';
import 'package:whatapp_clone_with_socket_io/screen_or_pages/select_contacts.dart';
import 'package:whatapp_clone_with_socket_io/screen_or_pages/settings.dart';

class RouteGenerator {
  static const String splash = '/';
  static const String login = 'login';
  static const String home = 'home';
  static const String setting = 'setting';
  static const String select = 'select';
  static const String group = 'group';
  static const String chats = 'chats';
  static const String status = 'status';
  static const String calls = 'calls';
  static const String cameras = 'cameras';

  RouteGenerator._();
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case home:
        return MaterialPageRoute(builder: (context) => const Home());
      case setting:
        return MaterialPageRoute(builder: (context) => const Settings());
      case select:
        return MaterialPageRoute(builder: (context) => const SelectContacts());
      case group:
        return MaterialPageRoute(builder: (context) => const CreateGroup());
      case chats:
        return MaterialPageRoute(builder: (context) => const Chats());
      case status:
        return MaterialPageRoute(builder: (context) => const Status());
      case calls:
        return MaterialPageRoute(builder: (context) => const Calls());
      case cameras:
        return MaterialPageRoute(builder: (context) => const Camera());
      default:
        throw "Route not found";
    }
  }
}
