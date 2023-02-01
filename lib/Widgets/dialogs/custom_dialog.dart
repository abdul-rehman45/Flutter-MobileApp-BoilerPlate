import 'package:flutter/material.dart';
import 'package:flutterproject/constant/colors.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    Key? key,
    this.title,
    this.description,
    this.button1,
    this.button2,
    this.descrpitionTextAlign = TextAlign.justify,
    this.tap1,
    this.tap2,
  }) : super(key: key);

  final String? title;
  final String? description;
  final String? button1;
  final String? button2;
  final TextAlign? descrpitionTextAlign;
  final VoidCallback? tap1;
  final VoidCallback? tap2;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.lightgrey),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 15),
            Text(
              title ?? '',
              // style: Helper.setTextStyle(
              //   16,
              //   FontWeight.bold,
              //   color: AppColors.text,
              // ),
            ),
            // SizedBox(height: 30),
            if (description != null)
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  description ?? '',
                  textAlign: descrpitionTextAlign,
                  //   style: Helper.setTextStyle(16, FontWeight.w400,
                  //       color: AppColors.text),
                ),
              ),
            if (description == null) const SizedBox(height: 30),
            const Divider(height: 0),
            IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: tap1,
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          child: Text(
                            button1 ?? '',
                            // style: Helper.setTextStyle(
                            //   16,
                            //   // color: AppColors.blue,
                            //   FontWeight.w500,
                            // ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const VerticalDivider(),
                  Expanded(
                    child: InkWell(
                      onTap: tap2,
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          child: Text(
                            button2 ?? '',
                            // style: Helper.setTextStyle(
                            //   16,
                            //   FontWeight.w500,
                            //   color: AppColors.primary,
                            // ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
