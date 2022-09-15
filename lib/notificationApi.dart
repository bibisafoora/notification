import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/subjects.dart';


class NotificationApi{
  static final _notifications = FlutterLocalNotificationsPlugin();
  static final  onNotification = BehaviorSubject<String?>();

  static Future showNotification( {
    int id = 0,
    String? title,
    String? body,
    String? payload,
}) async =>
      _notifications.show(
    id,
    title,
    body,
    await _notificationDetails(),
    payload: payload,
  );


  static Future _notificationDetails() async{
    return const NotificationDetails(
      android: AndroidNotificationDetails(
       'channel id',
        'channel name',
        //'channel Description',
        importance: Importance.max,
      ),
      iOS: IOSNotificationDetails(),
    );
  }


  static Future init({bool initSchedule = false}) async{
    final ios = IOSInitializationSettings();
    final android = AndroidInitializationSettings('@mipmap/ic_launcher');
    final settings = InitializationSettings(android: android, iOS: ios);
    await _notifications.initialize(
      settings,
      onSelectNotification: (payload) async{
        onNotification.add(payload);
      }
    );
  }
}