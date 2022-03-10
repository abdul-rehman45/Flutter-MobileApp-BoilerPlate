// import 'package:cloud_firestore/cloud_firestore.dart';

// class ChatService {
//   final FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;

//   Future sendMessage(String type,
//       {String? chatId, url, message, userid, name, image}) async {
//     Timestamp _msgTime = Timestamp.now();
//     ////send message
//     firestoreInstance.collection("Chat/Chatting/" + "$chatId").doc().set({
//       'type': type,
//       'time': _msgTime,
//       'msg': url ?? message,
//       "uid": AppGlobals.username,
//       'sendby': AppGlobals.username,
//     });

//     ////update last message in my inbox
//     // firestoreInstance
//     //     .collection('inbox/messages/${AppGlobals.userId}')
//     //     .doc(userid.toString())
//     //     .set(
//     //   {
//     //     'type': type,
//     //     'time': _msgTime,
//     //     "ID": userid,
//     //     "name": name,
//     //     "image": image,
//     //     "msg": type == "text"
//     //         ? message
//     //         : type == "url"
//     //             ? "Picture"
//     //             : "Sticker",
//     //     // "Message": url ?? message
//     //   },
//     //   SetOptions(merge: true),
//     // );

//     // ////update last message in other user inbox
//     // firestoreInstance
//     //     .collection('inbox/messages/$userid')
//     //     .doc(AppGlobals.userId.toString())
//     //     .set(
//     //   {
//     //     'type': type,
//     //     'time': _msgTime,
//     //     "ID": AppGlobals.userId,
//     //     "name": AppGlobals.getFullName(),
//     //     'unreadCount': FieldValue.increment(1),
//     //     "image": AppGlobals.image,
//     //     "msg": type == "text"
//     //         ? message
//     //         : type == "url"
//     //             ? "Picture"
//     //             : "Sticker",
//     //     // "Message": url ??
//     //     // "Message": url ?? message
//     //   },
//     //   SetOptions(merge: true),
//     // );

//     ////Send notification to other user
//     await NotificationService().SendNotification(
//       //type: "chat",
//       userId: userid.toString(),
//       title: AppGlobals.getFullName(),
//       body: type == "text" ? message : "Image",
//     );
//   }

//   ////Update User Online Status
//   setUserOnlineStatus(bool status) async {
//     Timestamp _time = Timestamp.now();
//     await firestoreInstance
//         .collection("onlineUsers")
//         .doc(AppGlobals.userId.toString())
//         .set({"online": status, "seen": _time});
//   }

//   // delete user chat//
//   Future<void> deleteChat({String? chatId, userId}) async {
//     try {
//       //CustomLoader.show();
//       await FirebaseFirestore.instance
//           .collection('inbox/messages/${AppGlobals.userId}')
//           .doc(userId)
//           .delete();
//       await FirebaseFirestore.instance
//           .collection('inbox/messages/${userId}')
//           .doc(AppGlobals.userId.toString())
//           .delete();
//       await FirebaseFirestore.instance
//           .collection("Chat")
//           .doc("Chatting")
//           .collection("$chatId")
//           .get()
//           .then((value) {
//         if (value.docs != null && value.docs.isNotEmpty) {
//           for (int i = 0; i < value.docs.length; i++) {
//             FirebaseFirestore.instance
//                 .collection("Chat/Chatting/" + "$chatId")
//                 .doc(value.docs[i].id)
//                 .delete();
//           }
//         }
//       });
//       // CustomLoader.dismiss();
//     } on Exception catch (e) {
//       print("delete chat error... $e");
//       // CustomLoader.dismiss();
//     }
//   }

//   // delete user Inbox//
//   Future<void> deleteInbox({String? chatId, userId}) async {
//     try {
//       // CustomLoader.show();
//       await FirebaseFirestore.instance
//           .collection("inbox")
//           .doc("messages")
//           .collection("${AppGlobals.userId}")
//           .get()
//           .then((value) {
//         if (value.docs != null && value.docs.isNotEmpty) {
//           for (int i = 0; i < value.docs.length; i++) {
//             FirebaseFirestore.instance
//                 .collection("inbox/messages/" + "${AppGlobals.userId}")
//                 .doc(value.docs[i].id)
//                 .delete();
//           }
//         }
//       });
//       // CustomLoader.dismiss();
//     } on Exception catch (e) {
//       // TODO
//       print("delete chat error... $e");
//       //  CustomLoader.dismiss();
//     }
//   }

//   /// step user to archive
//   void setUserToArchive({bool isArchive = true, int? userId}) {
//     firestoreInstance
//         .collection('inbox/messages/${AppGlobals.userId}')
//         .doc(userId.toString())
//         .set(
//       {"isArchive": isArchive},
//       SetOptions(merge: true),
//     );
//   }
// }
