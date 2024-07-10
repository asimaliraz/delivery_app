import 'dart:io';
import 'dart:math';
import 'package:Delivery_App/notification.dart';
import 'package:app_settings/app_settings.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationServices{

  FirebaseMessaging messaging = FirebaseMessaging.instance;
   final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  void requestNotificationPermission()async{
  NotificationSettings settings =await messaging.requestPermission(
    alert: true,
    announcement: true,
    badge: true,
    carPlay: true,
    criticalAlert: true,
    provisional: true,
    sound: true,
  );
 if(settings.authorizationStatus == AuthorizationStatus.authorized){
   print('user granted permission');
 }else if(settings.authorizationStatus == AuthorizationStatus.provisional){
   print('user granted provisional permission');
 }else{
  AppSettings.openAppSettings();
   print('user denied permission');
 }
  }
  
  void initLocalNotification(BuildContext context, RemoteMessage message)async{
   
   var androidInitializationSettings = const AndroidInitializationSettings('@mipmap/ic_launcher');
   var iosInitializationSettings = const DarwinInitializationSettings();

   var initializationSetting = InitializationSettings(
    android: androidInitializationSettings,
    iOS: iosInitializationSettings,
    );
    
    await _flutterLocalNotificationsPlugin.initialize(
      initializationSetting,
      onDidReceiveNotificationResponse: (payload) {
       handleMessage(context, message);
      },
    );
  }

  void FirebaseInit(BuildContext context){
  FirebaseMessaging.onMessage.listen((message) {

   if (kDebugMode) {
     print(message.notification!.title.toString());
     print(message.notification!.body.toString());
     print(message.data.toString());
     print(message.data['type']);
     print(message.data['id']);
   }
    if(Platform.isIOS){
      forgroundMessage();
    }
    if(Platform.isAndroid){
      initLocalNotification(context,message);
      showNotification(message); 
    }else{
      showNotification(message);
    }
  });
}

  Future<void> showNotification(RemoteMessage message)async {
   // ignore: unused_local_variable
   AndroidNotificationChannel androidNotificationChannel =AndroidNotificationChannel(
    Random.secure().nextInt(100000).toString(), 
    'High Imortance Notification',
    importance: Importance.max,
    );

    var channel;
    AndroidNotificationDetails androidNotificationDetails =AndroidNotificationDetails(
     channel.id.toString(),
     channel.name.toString(),
      channelDescription: 'your channel description',
      importance: Importance.high,
      priority: Priority.high,
      ticker: 'ticker'
      );
    
    const DarwinNotificationDetails darwinNotificationDetails =DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    NotificationDetails notificationDetails =NotificationDetails(
      android: androidNotificationDetails,
      iOS: darwinNotificationDetails,
    );

   Future.delayed(Duration.zero,(){
    _flutterLocalNotificationsPlugin.show(
     1,
     message.notification!.title.toString(), 
     message.notification!.body.toString(), 
     notificationDetails,
     );
   }
   );
  }

Future<String> getDeviceToken()async{
   await FirebaseMessaging.instance.getToken().then((value) {
    print('token---$value');
    
  });
  return '';
  // print('token----$token');
  // return token!;
}
   void isTokenRefresh()async{
    messaging.onTokenRefresh.listen((event) {
      event.toString();
      print('refresh');
    });
   }
   
   Future<void> setupInteractMessage(BuildContext context)async{
      RemoteMessage? intialMessage = await FirebaseMessaging.instance.getInitialMessage();
      if(intialMessage !=null){
        handleMessage(context, intialMessage);
      }

      FirebaseMessaging.onMessageOpenedApp.listen((event) { 
        handleMessage(context, event);
      });
   }

   void handleMessage(BuildContext context, RemoteMessage message){
     if(message.data['type']=='msg'){
      Navigator.push(context, 
      MaterialPageRoute(builder: (context) => NotificationScreen(id: message.data['id'],
      ),));
     }
   }
   
   Future forgroundMessage()async{
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
   }
  }
