// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:the_apple_sign_in/the_apple_sign_in.dart';
// import 'auth.dart';

// class AuthFireBase {
//   final authService = AuthService();
//   late final FacebookAuth _facebookAuth;
//   //final FacebookLogin  facebookLogin = FacebookLogin();

//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final GoogleSignIn _googleSignIn = GoogleSignIn();
//   User? user;
//   // ignore: unused_field
//   bool _loggedIn = false;

//   // ignore: prefer_final_fields, unused_field
//   int _counter = 0;
//   Stream<User?> get currentUser => authService.currentUser;

//   Future<dynamic> loginFacebook(BuildContext context) async {
//     bool? _isLogged;
//     Map<String, dynamic>? _userData;
//     //Map<String, dynamic>? get userData => _userData;
//     final LoginResult result = await _facebookAuth.login(
//         loginBehavior: LoginBehavior.dialogOnly,
//         permissions: ['email', 'public_profile']);

//     _isLogged = result.status == LoginStatus.success;
//     if (_isLogged) {
//       _userData = await _facebookAuth.getUserData();
//       (_userData);
//     }
//     if (_userData != null) {
//       FacebookAuth.instance.logOut();
//       FacebookLoginModel facebookLoginModel =
//           FacebookLoginModel.fromJson(_userData);
//       return facebookLoginModel;
//     } else {
//       FacebookAuth.instance.logOut();
//       // FlutterToastCall.instance.toast(
//       //   "${StringConstant.wrong}",
//       //);

//       return null;
//     }

//     //User user = await FirebaseAuth.instance.currentUser;

//     // print('Starting Facebook Login');
//     // try {
//     //   FacebookLoginResult _result =
//     //       await facebookLogin.logIn(['email', 'public_profile']);
//     //   bool isFBLogin = false;
//     //   switch (_result.status) {
//     //     case FacebookLoginStatus.cancelledByUser:
//     //       print("FacebookLogin cancelledByUser");

//     //       break;
//     //     case FacebookLoginStatus.error:
//     //       print("FacebookLogin error");

//     //       break;
//     //     case FacebookLoginStatus.loggedIn:
//     //       print("User fb loged..");
//     //       isFBLogin = await signinWithFacebook(_result, context);
//     //       return isFBLogin;
//     //       break;
//     //     // default:
//     //   }
//     // } catch (e) {
//     //   print(e);
//     // }
//   }

//   // Future<bool> signinWithFacebook(
//   //     FacebookLoginResult _result, BuildContext context) async {
//   //   try {
//   //     FacebookAccessToken _accessToken = _result.accessToken;
//   //     print("_result.accessToken");
//   //     print(_result.accessToken);
//   //     AuthCredential _credential =
//   //         FacebookAuthProvider.credential(_accessToken.token);
//   //     print("_credential.providerId");
//   //     print(_credential.providerId);
//   //     var authResult = await _auth.signInWithCredential(_credential);
//   //     final User? user = authResult.user;

//   //     if (user != null) {
//   //       assert(!user.isAnonymous);
//   //       assert(await user.getIdToken() != null);

//   //       assert(user.email != null);
//   //       assert(user.displayName != null);
//   //       assert(user.photoURL != null);

//   //       print('${user.displayName} is now logged in');
//   //       // globals.fullname = user.displayName;
//   //       // globals.email = user.email;
//   //       // globals.phonenumber = user.phoneNumber;
//   //       // globals.image = user.photoURL;
//   //       // globals.userlogintype = "facebook";
//   //       // globals.firsttime = false;

//   //       print('signinWithFacebook succeeded: $user');

//   //       return true;
//   //     }

//   //     return false;
//   //   } catch (e) {
//   //     print(e.toString());

//   //     return false;
//   //   }
//   // }

//   logout() {
//     authService.logout();
//   }

//   Future<bool> signinApple(BuildContext context) async {
//     bool islogin = false;
//     final AuthorizationResult result = await TheAppleSignIn.performRequests([
//       AppleIdRequest(requestedScopes: [Scope.email, Scope.fullName])
//     ]);

//     switch (result.status) {
//       case AuthorizationStatus.authorized:

//         // Store user ID
//         await FlutterSecureStorage()
//             .write(key: "userId", value: result.credential?.user);
//         debugPrint(result.toString());
//         debugPrint(result.credential?.email);
//         // globals.appleuserdata = result.credential;
//         // globals.email = result.credential.email;
//         // globals.fullname = result.credential.fullName.toString();
//         // globals.image = "";
//         // globals.userlogintype = "apple";
//         // globals.firsttime = false;
//         return islogin = true;

//       case AuthorizationStatus.error:
//         debugPrint("Sign in failed: ${result.error?.localizedDescription}");

//         return islogin;

//       case AuthorizationStatus.cancelled:
//         debugPrint('User cancelled');
//         return islogin;
//       // break;
//     }
//   }

//   void checkLoggedInState() async {
//     final userId = await const FlutterSecureStorage().read(key: "userId");
//     if (userId == null) {
//       debugPrint("No stored user ID");
//       return;
//     }

//     final credentialState = await TheAppleSignIn.getCredentialState(userId);
//     switch (credentialState.status) {
//       case CredentialStatus.authorized:
//         debugPrint("getCredentialState returned authorized");
//         break;

//       case CredentialStatus.error:
//         debugPrint(
//             "getCredentialState returned an error: ${credentialState.error?.localizedDescription}");
//         break;

//       case CredentialStatus.revoked:
//         debugPrint("getCredentialState returned revoked");
//         break;

//       case CredentialStatus.notFound:
//         debugPrint("getCredentialState returned not found");
//         break;

//       case CredentialStatus.transferred:
//         debugPrint("getCredentialState returned not transferred");
//         break;
//     }
//   }

//   Future<User?> googleSignIn() async {
//     try {
//       GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
//       GoogleSignInAuthentication googleAuth =
//           await googleSignInAccount!.authentication;

//       final AuthCredential credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );

//       user = (await _auth.signInWithCredential(credential)).user;

//       debugPrint("user id: ${user!.uid}");
//       debugPrint("user name: ${user!.displayName}");
//       debugPrint("user email: ${user!.email}");
//       debugPrint("USer LOggedIN! ");

//       _loggedIn = true;

//       return user!;
//     } on Exception catch (exception) {
//       // only executed if error is of type Exception
//       debugPrint("$exception");
//     } catch (error) {
//       // executed for errors of all types other than Exception
//       debugPrint("$error");
//     }
//     return user;
//   }

//   signOut() async {
//     await _googleSignIn.signOut();
//     _loggedIn = false;
//     debugPrint("Logout!");
//   }

//   Future<User?> registerWithEmail(String email, String password) async {
//     User? user = (await _auth.createUserWithEmailAndPassword(
//       email: email,
//       password: password,
//     ))
//         .user;
//     if (user != null) {
//       // setState(() {
//       //   _success = true;
//       //   _userEmail = user.email;
//       // });
//       return user;
//     } else {
//       return null;
//       // setState(() {
//       //   _success = true;
//       // });
//     }
//   }
// }

// class FacebookLoginModel {
//   String? name;
//   String? email;
//   String? firstName;
//   String? lastName;
//   Picture? picture;
//   String? id;

//   FacebookLoginModel(
//       {this.name,
//       this.email,
//       this.firstName,
//       this.lastName,
//       this.picture,
//       this.id});

//   FacebookLoginModel.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     email = json['email'];
//     firstName = json['first_name'];
//     lastName = json['last_name'];
//     picture =
//         json['picture'] != null ? new Picture.fromJson(json['picture']) : null;
//     id = json['id'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     data['email'] = this.email;
//     data['first_name'] = this.firstName;
//     data['last_name'] = this.lastName;
//     if (this.picture != null) {
//       data['picture'] = this.picture!.toJson();
//     }
//     data['id'] = this.id;
//     return data;
//   }
// }

// class Picture {
//   Data? data;

//   Picture({this.data});

//   Picture.fromJson(Map<String, dynamic> json) {
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     return data;
//   }
// }

// class Data {
//   int? height;
//   bool? isSilhouette;
//   String? url;
//   int? width;

//   Data({this.height, this.isSilhouette, this.url, this.width});

//   Data.fromJson(Map<String, dynamic> json) {
//     height = json['height'];
//     isSilhouette = json['is_silhouette'];
//     url = json['url'];
//     width = json['width'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['height'] = this.height;
//     data['is_silhouette'] = this.isSilhouette;
//     data['url'] = this.url;
//     data['width'] = this.width;
//     return data;
//   }
// }
