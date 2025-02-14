import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReplyCard extends StatelessWidget {
  final String reply;
  final String time;
  const ReplyCard({super.key, required this.reply, required this.time});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 45,
        ),
        child: Card(
          color: Colors.grey.shade200,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 30, bottom: 20, top: 5),
                child: Text(
                  reply,
                  style: const TextStyle(fontSize: 14),
                ),
              ),
              Positioned(
                bottom: 4,
                right: 10,
                child: Text(
                  DateFormat("HH:MM").format(DateTime.parse(time)),
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
