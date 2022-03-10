import 'package:flutter/material.dart';
import 'package:flutterproject/Constant/app_colors.dart';
import 'package:flutterproject/Constant/app_strings.dart';
import 'package:flutterproject/Widgets/buttons/gradient_button.dart';

class BlockAndReportDialog extends StatefulWidget {
  final String leftButtonTitle, rightButtonTitle;
  final int? reportUserId;

  const BlockAndReportDialog(
      {Key? key,
      this.leftButtonTitle = "",
      this.rightButtonTitle = "",
      this.reportUserId})
      : super(key: key);

  @override
  _BlockAndReportDialogState createState() => _BlockAndReportDialogState();
}

class _BlockAndReportDialogState extends State<BlockAndReportDialog> {
  bool spam = false;
  bool photo = false;
  bool message = false;
  bool others = false;
  List list = [];

  void report() async {
    if (list.isNotEmpty) {
      Navigator.pop(context);
      String res = list.join(',');
      // var report =await UserMatches.reportUser(widget.reportUserId!, res);
      // if (report == true) {
      //   final navServices = Get.find<NavBarService>();
      //   navServices.navIndex.value = 3;
      //   Get.offAll(
      //     () => Home(),
      //   );
      // }
    }
    // else {
    //   CustomSnackBar.showSnackBar(
    //     message: AppStrings.reason,
    //     type: SnackBarType.error,
    //     seconds: 4,
    //   );
    // }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.bgColor,
      insetPadding: EdgeInsets.all(16),
      contentPadding: EdgeInsets.fromLTRB(20, 40, 20, 40),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(18.0),
        ),
      ),
      content: Container(
        // height: AppGlobals.screenHeight * 0.6,
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Are you sure?\nTell us why",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: AppColors.textColor),
                  textAlign: TextAlign.center,
                ),
                CheckBoxWidget(
                  checkText: "Feel like spam",
                  checkValue: spam,
                  list: list,
                ),
                CheckBoxWidget(
                  checkText: "Inappropriate photos",
                  checkValue: photo,
                  list: list,
                ),
                CheckBoxWidget(
                  checkText: "Inappropriate messages",
                  checkValue: message,
                  list: list,
                ),
                CheckBoxWidget(
                  checkText: "Others",
                  checkValue: others,
                  list: list,
                ),
                Column(
                  children: [
                    SizedBox(height: 32),
                    Row(
                      children: [
                        Expanded(
                            child: GradientButton(
                                title: widget.leftButtonTitle,
                                isGradient: false,
                                onTap: () => Navigator.pop(context))),
                        SizedBox(width: 20),
                        Expanded(
                          child: GradientButton(
                              title: widget.rightButtonTitle, onTap: report),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CheckBoxWidget extends StatefulWidget {
  final String? checkText;
  bool? checkValue;
  List? list = [];

  CheckBoxWidget({this.checkText, this.checkValue, this.list});

  @override
  _CheckBoxWidgetState createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Theme(
          data: ThemeData(unselectedWidgetColor: AppColors.lightGreen),
          child: Checkbox(
            activeColor: AppColors.lightGreen,
            value: widget.checkValue,
            onChanged: (bool? value) {
              if (widget.checkValue == false) {
                widget.list!.add(widget.checkText);
                setState(() {});
              } else if (widget.checkValue == true) {
                widget.list!.remove(widget.checkText);

                setState(() {});
              }
              setState(() {
                widget.checkValue = value;
                print("${widget.checkValue}");
              });
            },
          ),
        ),
        Expanded(
            child: Text(widget.checkText!,
                style: TextStyle(fontSize: 14, color: AppColors.textColor))),
      ],
    );
  }
}
