import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject/constant/colors.dart';
import 'package:flutterproject/helpers/ui_helpers.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText(
      {Key? key,
      this.color,
      required this.title,
      required this.linkTitle,
      required this.navigateToClass,
      this.termAndPrivacyCall = false,
      this.url})
      : super(key: key);
  final String title, linkTitle;
  final Widget navigateToClass;
  final Color? color;
  final bool termAndPrivacyCall;
  final String? url;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: Helper.textStyle(fontSize: 14, color: color),
        children: [
          TextSpan(text: title),
          TextSpan(
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  print('navigate');
                  if (termAndPrivacyCall == false) {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => navigateToClass));
                  } else {
                    // AppGlobals().urlLuncher(
                    //   url: url,
                    // );
                  }
                },
              text: linkTitle,
              style: Helper.textStyle(fontSize: 14, color: green)
                  .copyWith(decoration: TextDecoration.underline))
        ],
      ),
    );
  }
}
