import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'notification.dart';
import 'notificationApi.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    NotificationApi.init();
    listenNotifications();
  }

  void listenNotifications() {
    NotificationApi.onNotification.stream.listen(onClickedNotification);
  }

  void onClickedNotification(String? payload) =>
      Get.to(() => NotificationPage(payload: payload));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
          ),
          child: Text('Create Notification'),
          onPressed: () {
            NotificationApi.showNotification(
                title: 'Hello',
                body: 'This is simple notification test',
                payload: 'This is test Notification');
          },
        ),
      ),
    );
  }
}
