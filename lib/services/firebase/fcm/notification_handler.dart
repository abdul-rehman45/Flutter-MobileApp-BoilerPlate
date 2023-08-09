import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject/helpers/helpers.dart';
import 'package:overlay_support/overlay_support.dart';

class NotificationRegister {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  PushNotification notification = PushNotification();
  late Map messageData;

  Future<void> registerNotification() async {
    // ignore: unused_local_variable
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      sound: true,
      badge: true,
      carPlay: false,
      provisional: false, // iOS only
      announcement: false,
      criticalAlert: false,
    );

    await messaging.setForegroundNotificationPresentationOptions(
      alert: true, // Required to display a heads up notification
      badge: true,
      sound: true,
    );
    // print('User granted permission: ${settings.authorizationStatus}');
    //getFCMToken();

    // Get initial notification data
    FirebaseMessaging.instance.getInitialMessage().then(
      (RemoteMessage? message) {
        if (message != null) {
          _navigateToPage(message.data);
        }
      },
    );

    //App is running in foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message while app is in the foreground!');
      print('Message body: ${message.data}');
      if (message.notification != null) {
        print(
            'Message also contained a notification: ${message.notification!.title}');
        notification = PushNotification(
          title: message.notification!.title,
          body: message.notification!.body,
          dataTitle: message.data['title'],
          dataBody: message.data['body'],
          image_url: message.data['image_url'],
        );
        String msgTitle =
            message.notification!.title ?? notification.dataTitle ?? '';
        String msgBody =
            message.notification!.body ?? notification.dataBody ?? '';
        // String imgUrl = notification.image_url ?? '';

        // ignore: unused_local_variable
        bool? dismissnotification = false;

        // show a notification at top of screen.

        showSimpleNotification(
          InkWell(
            child: Text(
              msgTitle,
              maxLines: 1,
              softWrap: true,
              style: Helper.textStyle(),
            ),
            onTap: () {
              dismissnotification = true;
              _navigateToPage(message.data);
            },
          ),
          subtitle: InkWell(
            onTap: () {
              dismissnotification = true;
              _navigateToPage(message.data);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  msgBody,
                  maxLines: 2,
                  softWrap: true,
                  style: Helper.textStyle(),
                  overflow: TextOverflow.ellipsis,
                ),
                // SizedBox(
                //   height: 10,
                // ),
                // Container(
                // clipBehavior: Clip.hardEdge,
                // decoration:
                //  BoxDecoration(borderRadius: BorderRadius.circular(10),
                //  ),
                // child:
                // Image.network(
                //   imgUrl,
                //   height: 100,
                // ),
                //  ),
              ],
            ),
          ),

          background: Colors.white,
          duration: const Duration(seconds: 5),
          slideDismissDirection: DismissDirection.up,

          //autoDismiss: dismissnotification!,
          //contentPadding: EdgeInsets.all(10),`
        );
      }
    });

    //App is in background but not killed
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!.. ${message.data}');
      if (message.notification != null) {
        _navigateToPage(message.data);
      }
    });
  }

  Future<String?> getFCMToken() async {
    String? token = await messaging.getToken();
    print('FCM Token: $token');

    return token;
  }

  Future<void> getInitialMessage() async {
    // Get initial notification data
    await FirebaseMessaging.instance.getInitialMessage().then(
      (RemoteMessage? message) {
        if (message != null) {
          _navigateToPage(message.data);
        }
      },
    );
  }

  void _navigateToPage(Map<String, dynamic>? messageData) async {
    if (messageData != null) {
      // if (messageData['type'] == "offer") {
      //   OfferModel? offerModel;
      //   offerModel = await OffersService.getOfferById(
      //     id: int.parse(messageData['id']),
      //     isOffer: true,
      //   );
      //   if (offerModel != null) {
      //     offerModel.validFrom = Helper.formatDateTime(offerModel.validFrom);
      //     offerModel.validTill = Helper.formatDateTime(offerModel.validTill);

      //     Get.to(() => OfferDetailPage(
      //           isOffer: true,
      //           offerRestaurantModel: offerModel,
      //           validFromDate: offerModel!.validFrom,
      //           validTillDate: offerModel.validTill,
      //         ));
      //   }
      // } else if (messageData['type'] == "deal") {
      //   OfferModel? offerModel;
      //   offerModel = await OffersService.getOfferById(
      //     id: int.parse(messageData['id']),
      //     isOffer: false,
      //   );
      //   if (offerModel != null) {
      //     offerModel.validFrom = Helper.formatDateTime(offerModel.validFrom);
      //     offerModel.validTill = Helper.formatDateTime(offerModel.validTill);

      //     Get.to(() => OfferDetailPage(
      //           isOffer: false,
      //           offerRestaurantModel: offerModel,
      //           validFromDate: offerModel!.validFrom,
      //           validTillDate: offerModel.validTill,
      //         ));
      //   }
      // } else if (messageData['type'] == "restaurant") {
      //   RestaurantModel? restaurantModel =
      //       await RestaurantService.getResturantById(
      //           id: int.parse(messageData['id']));
      //   if (restaurantModel != null) {
      //     Get.to(RestaurantPage(
      //       id: restaurantModel.id!,
      //       restaurantName: restaurantModel.name,
      //       coverImage: restaurantModel.coverImage,
      //       address: restaurantModel.address,
      //       restaurantCategory: restaurantModel.category,
      //       restaurantLogo: restaurantModel.logoImage,
      //       avgRating: restaurantModel.rating!.avgRating ?? 0,
      //       reviewsCount: restaurantModel.reviewsCount,
      //     ));
      //   }
      // }
    }

    // if (messageData != null) {
    //   String? _type = messageData["type"].toString();
    //   switch (_type) {
    //     case "chat":
    //       String? _group = messageData["isGroup"].toString().toLowerCase();
    //       bool? isGroup = _group == "true" ? true : false;
    //       // bool? isGroup = messageData["isGroup"] == "true" ? true : false;
    //       List members = json.decode(messageData["members"]);

    //       navigatorKey.currentState!.push(
    //         PageRouteBuilder(
    //           opaque: false,
    //           pageBuilder: (BuildContext context, _, __) => isGroup == true
    //               ? GroupChat(
    //                   name: messageData["title"],
    //                   imageUrl: messageData["image"],
    //                   groupId: messageData["chatId"],
    //                   groupMembers: List<String>.from(members),
    //                 )
    //               : ChatScreen(
    //                   name: messageData["title"],
    //                   userId: messageData["chatId"],
    //                   imageUrl: messageData["image"],
    //                 ),
    //         ),
    //       );
    //       break;
    //     default:
    //       print("default.....${messageData["type"]}");
    //   }
    // }
  }
  // void setChannel() async {
  //   /// Create a [AndroidNotificationChannel] for heads up notifications
  //   AndroidNotificationChannel channel;
  //   /// Initialize the [FlutterLocalNotificationsPlugin] package.
  //   FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  //   channel = const AndroidNotificationChannel(
  //     'high_importance_channel', // id
  //     'High Importance Notifications', // title
  //     description:
  //         'This channel is used for important notifications.', // description
  //     importance: Importance.high,
  //   );
  //   flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  //   /// Create an Android Notification Channel.
  //   ///
  //   /// We use this channel in the `AndroidManifest.xml` file to override the
  //   /// default FCM channel to enable heads up notifications.
  //   await flutterLocalNotificationsPlugin
  //       .resolvePlatformSpecificImplementation<
  //           AndroidFlutterLocalNotificationsPlugin>()
  //       ?.createNotificationChannel(channel);
  //   /// Update the iOS foreground notification presentation options to allow
  //   /// heads up notifications.
  //   await messaging.setForegroundNotificationPresentationOptions(
  //     alert: true,
  //     badge: true,
  //     sound: true,
  //   );
  // }
}

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage value) async {
  print("firebaseMessagingBackgroundHandler ${value.data}");
}

class PushNotification {
  PushNotification({
    this.title,
    this.body,
    this.dataTitle,
    this.dataBody,
    this.image_url,
  });

  String? title;
  String? body;
  String? dataTitle;
  String? dataBody;
  String? image_url;
}
