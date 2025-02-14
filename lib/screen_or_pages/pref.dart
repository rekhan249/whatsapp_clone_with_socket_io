import 'package:flutter/material.dart';
import 'package:untitled/untitled.dart';

class Pref extends StatelessWidget {
  const Pref({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: PreferencesLayout(
        preferences: [
          SwitchPref(title: "title", value: "value"),
        ],
      ),
    );
  }
}
