import 'package:flutter/material.dart';
import 'package:flutterproject/constant/colors.dart';
import 'package:flutterproject/widgets/common/custom_rich_text.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox(
      {Key? key,
      this.isCheck = false,
      this.onChanged,
      required this.title,
      required this.linkTitle,
      this.termAndPrivacyCall = false,
      this.url})
      : super(key: key);
  final bool isCheck;
  final onChanged;
  final String title, linkTitle;
  final bool termAndPrivacyCall;
  final String? url;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          ClipRRect(
            clipBehavior: Clip.hardEdge,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            child: SizedBox(
              width: 22,
              height: 22,
              child: Center(
                child: Theme(
                  data: ThemeData(
                    unselectedWidgetColor: AppColors.scaffold,
                  ),
                  child: Checkbox(
                    value: isCheck,
                    onChanged: onChanged,
                    activeColor: AppColors.green,
                    // checkColor: CommonColors.checkBoxColor,
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 5),
          CustomRichText(
            title: title,
            linkTitle: linkTitle,
            navigateToClass: Container(),
            termAndPrivacyCall: termAndPrivacyCall,
            url: url,
          ),
        ],
      ),
    );
  }
}
