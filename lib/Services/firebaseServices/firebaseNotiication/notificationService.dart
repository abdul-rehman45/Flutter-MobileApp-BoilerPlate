// import 'dart:convert';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:overlay_support/overlay_support.dart';
// import 'package:http/http.dart' as http;

// class NotificationService {
//   final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
//   // late final FirebaseMessaging _messaging;
//   // PushNotification? messageData;
//   PushNotification notification = PushNotification();

//   // TextStyle textStyle = Utilities.setTextStyle(16,
//   //     color: Colors.white, fontWeight: FontWeight.w500);
//   Future<void> SendNotification({
//     String? title,
//     String? body,
//     Map<String, dynamic>? data,
//     String? userId,
//     String? chat,
//     String? image,
//   }) async {
//     String? token;

//     token = await getPushToken();
//     // .then((value) {return token = value.body;});

//     Map<String, String> data = {
//       'image': "",
//       'chat': chat ?? 'no',
//       'name': title ?? '',
//       'content': body ?? '',
//       'id': userId ?? '',
//       'image': image ?? '',
//       // 'uid': "${AppGlobals.userId}",
//     };

//     // Replace with server token from firebase console settings.
//     String serverToken =
//         'AAAATLJ0suU:APA91bE_NiiCtKNNnB4OJClAp-Ge4JTdJ7UmLiKxLUxThZPdOugnFJ9Tz0kz75zJ2nDNYzEMHtVsl3oSqS0neHJi6G2NOo_vkNbieahB00dRuZVqHSofeA6Cpd61pBvo-zogNcrSDQTS';

//     await http
//         .post(
//           Uri.parse('https://fcm.googleapis.com/fcm/send'),
//           headers: <String, String>{
//             'Content-Type': 'application/json',
//             'Authorization': 'key=$serverToken',
//           },
//           body: jsonEncode(
//             <String, dynamic>{
//               'notification': <String, dynamic>{
//                 'body': body ?? "0",
//                 'click_action': 'FLUTTER_NOTIFICATION_CLICK',
//                 'title': title ?? "0"
//                 /*,"image":chat=="yes"? Global.userDetails.images.isNotEmpty ? Global.userDetails.images[0] : "http://buddytobody.com/Content/Website/Images/logo.png":""*/
//               },
//               'priority': 'high',
//               'data': data,
//               'to': token
//             },
//           ),
//         )
//         .then((value) {})
//         .catchError(
//       (onError) {
//         print("sendNotification Err:  $onError");
//         print(onError.message);
//       },
//     );
//   }

//   Future<void> registerNotification() async {
//     try {
//       print("registerNotification called....");
//       // 1. Initialize the Firebase app
//       // await Firebase.initializeApp(); // added in main

//       // 2. Instantiate Firebase Messaging
//       // _messaging = FirebaseMessaging.instance;

//       // 3. On iOS, this helps to take the user permissions
//       NotificationSettings settings = await firebaseMessaging.requestPermission(
//         alert: true,
//         badge: true,
//         sound: true,
//         provisional: false,
//       );
//       await enableIOSNotifications();

//       if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//         print('User granted notification permission');

//         getPushToken();

//         checkForInitialMessage();

//         // For handling the received notifications inApp
//         FirebaseMessaging.onMessage.listen(
//           (RemoteMessage? message) {
//             print("onMessage: ${message}");
//             if (message != null) {
//               print("onMessage: ${message.notification}");
//               print("message data: ${message.data}");
//               // print("onMessage: $message");

//               Map<String, dynamic> parsedMessage;

//               // Parse the received notfication data
//               parsedMessage = message.data;

//               if (message.notification != null) {
//                 notification = PushNotification(
//                   title: message.notification!.title,
//                   body: message.notification!.body,
//                   dataTitle: message.data['title'],
//                   dataBody: message.data['body'],
//                   image: message.data['image'],
//                 );
//               }

//               print("parsedMessage: $parsedMessage");

//               String msgTitle =
//                   "${notification.title ?? notification.dataTitle ?? ''}";
//               String msgBody =
//                   "${notification.body ?? notification.dataBody ?? ''}";
//               String image =
//                   "${notification.image ?? notification.dataBody ?? ''}";

//               print('in app notif data: $msgBody');
//               // For displaying the notification as an overlay
//               // showOverlayNotification(
//               //   Widget B
//               // )
//               showSimpleNotification(
//                   InkWell(
//                     child: Text(
//                       msgTitle,
//                       maxLines: 1,
//                       softWrap: true,
//                       style: const TextStyle(
//                           color: Colors.black, fontWeight: FontWeight.bold),
//                       // style: textStyle,
//                     ),
//                     onTap: () {
//                       //  notificationNavigation(parsedMessage);
//                     },
//                   ),
//                   subtitle: Text(
//                     msgBody,
//                     maxLines: 2,
//                     softWrap: true,
//                     style: const TextStyle(color: Colors.black),
//                     //  style: textStyle,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                   //position: NotificationPosition.bottom,
//                   slideDismissDirection: DismissDirection.up,
//                   background: Colors.white,
//                   duration: const Duration(seconds: 2),
//                   leading: CircleAvatar(
//                     backgroundImage: NetworkImage(image),
//                   ));
//             }
//           },
//         );

//         // For handling notification when the app in background
//         // but not terminated
//         FirebaseMessaging.onMessageOpenedApp.listen(
//           (RemoteMessage? message) {
//             print('Message clicked onMessageOpenedApp! ${message}');

//             if (message != null) {
//               print("onMessageOpenedApp: ${message.notification}");
//               print("message data: ${message.data}");
//               // print("onMessage: $message");

//               Map<String, dynamic> parsedMessage;

//               // Parse the received notfication data
//               parsedMessage = message.data;

//               if (message.notification != null) {
//                 notification = PushNotification(
//                   title: message.notification!.title,
//                   body: message.notification!.body,
//                   dataTitle: message.data['title'],
//                   dataBody: message.data['body'],
//                 );
//               }

//               print("parsedMessage: $parsedMessage");

//               String msgTitle =
//                   "${notification.title ?? notification.dataTitle ?? ''}";
//               String msgBody =
//                   "${notification.body ?? notification.dataBody ?? ''}";

//               print('bg app notif data: $msgBody');

//               notificationNavigation(parsedMessage);
//             }
//           },
//         );

//         // For handling notification when the app is
//         //in the background or terminated.
//         // FirebaseMessaging.onBackgroundMessage(
//         //   (message) => firebaseMessagingBackgroundHandler(message),
//         // );
//         FirebaseMessaging.onBackgroundMessage(
//             firebaseMessagingBackgroundHandler);
//       } else {
//         print('User declined or has not accepted permission');
//       }
//     } catch (e) {
//       print("in registerNotification error $e");
//     }
//   }

//   // For handling notification when the app is
//   //in Terminated state
//   checkForInitialMessage() async {
//     // await Firebase.initializeApp();
//     RemoteMessage? message = await firebaseMessaging.getInitialMessage();
//     if (message != null) {
//       print('initial notif data: ${message.data}');

//       Map<String, dynamic> parsedMessage;

//       // Parse the received notfication data
//       parsedMessage = message.data;

//       if (message.notification != null) {
//         notification = PushNotification(
//           title: message.notification!.title,
//           body: message.notification!.body,
//           dataTitle: message.data['title'],
//           dataBody: message.data['body'],
//         );
//       }

//       print("parsedMessage: $parsedMessage");

//       String msgTitle = "${notification.title ?? notification.dataTitle ?? ''}";
//       String msgBody = "${notification.body ?? notification.dataBody ?? ''}";

//       print('init app notif data: $msgBody');

//       notificationNavigation(parsedMessage);
//     }
//   }

//   enableIOSNotifications() async {
//     await FirebaseMessaging.instance
//         .setForegroundNotificationPresentationOptions(
//       alert: true, // Required to display a heads up notification
//       badge: true,
//       sound: true,
//     );
//   }

//   Future<String?> getPushToken() async {
//     try {
//       String? fcmToken = await firebaseMessaging.getToken();
//       print('fcmToken: $fcmToken');
//       return fcmToken;
//     } catch (e) {
//       print('getPushToken error: $e');
//       return null;
//     }
//   }
// }

// Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   print("Handling a background message: $message");
//   print('background message ${message.notification?.body}');

//   Map<String, dynamic> parsedMessage;
//   PushNotification? notification;

//   // Parse the received notfication data
//   parsedMessage = message.data;

//   if (message.notification != null) {
//     notification = PushNotification(
//       title: message.notification!.title,
//       body: message.notification!.body,
//       dataTitle: message.data['title'],
//       dataBody: message.data['body'],
//     );
//   }

//   print("parsedMessage: $parsedMessage");

//   String msgTitle = "${notification?.title ?? notification?.dataTitle ?? ''}";
//   String msgBody = "${notification?.body ?? notification?.dataBody ?? ''}";
//   print('bgs app notif data: $msgBody');

//   notificationNavigation(parsedMessage);
// }

// // check and handle condition for navigation
// void notificationNavigation(Map<String, dynamic> data) {
//   print('tap data $data');
//   if (data["type"] == "chat") {
//     // Get.to(ChatScreen(
//     //   name: data["userName"],
//     //   imageUrl: data["imageUrl"],
//     //   userId: int.tryParse(data["userId"]),
//     // ));
//   }
// }

// class PushNotification {
//   PushNotification({
//     this.title,
//     this.body,
//     this.dataTitle,
//     this.dataBody,
//     this.image,
//   });

//   String? title;
//   String? body;
//   String? dataTitle;
//   String? dataBody;
//   String? image;
// }
