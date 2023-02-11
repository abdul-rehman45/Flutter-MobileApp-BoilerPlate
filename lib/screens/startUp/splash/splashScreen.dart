import 'dart:async';
import 'package:flutter/material.dart';

import '../../../constants/assets.dart';
import '../../../constants/colors.dart';


class Splash extends StatefulWidget {
  const Splash({this.backgroundimage, Key? key}) : super(key: key);
  final bool? backgroundimage;
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  bool _isLogin = false;
  @override
  void initState() {
    super.initState();
    _getStoredDate();
  }

  void _startTimer() async {
    Timer(Duration(seconds: 2), () {
      // Get.offAll(
      //       () => _isLogin == true ? Home() : Registration(),
      //     )
    });
  }

  _getStoredDate() async {
    // bool login = await DataStorage().retrieveUserInfo();
    // _isLogin = login;

    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    // AppGlobals.screenHeight = MediaQuery.of(context).size.height;
    // AppGlobals.screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
        //width: double.infinity,
        height: double.infinity,
        decoration: widget.backgroundimage == false
            ? BoxDecoration()
            : BoxDecoration(
                image: DecorationImage(
                image: AssetImage(
                  placeHolderImg,
                ),
                fit: BoxFit.fill,
              )),
        child: Center(
            //     child: Image.asset(
            //   AppGifs.splash,
            //   scale: 2,
            // ),
            ),
      ),
    );
  }
}
