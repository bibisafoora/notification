import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  final String? payload;

  const NotificationPage({Key? key,required this.payload}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),

        child: Text(widget.payload ?? 'Test',
            style: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold,
          ),),


      ),
    );
  }
}
