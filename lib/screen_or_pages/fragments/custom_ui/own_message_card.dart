import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OwnMessageCard extends StatelessWidget {
  final String message;
  final String time;
  const OwnMessageCard({super.key, required this.message, required this.time});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 45,
        ),
        child: Card(
          color: Colors.greenAccent.shade200,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 30, bottom: 20, top: 5),
                child: Text(
                  message,
                  style: const TextStyle(fontSize: 14),
                ),
              ),
              Positioned(
                bottom: 4,
                right: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      DateFormat("HH:MM").format(DateTime.parse(time)),
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.done_all,
                      size: 14,
                      color: Colors.grey,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
