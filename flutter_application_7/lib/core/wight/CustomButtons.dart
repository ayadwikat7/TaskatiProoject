// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_application_7/core/utilits/colors.dart';
import 'package:flutter_application_7/core/utilits/styleText.dart';

class CoustomButton extends StatelessWidget {
  final double width;
  final double height;
  final String text;
  final Color? background;
  final Color? textColor;
  final Function() onParessed;
  const CoustomButton({
    super.key,
    this.width = 350,
    this.height = 50,
    required this.text,
    this.background,
    this.textColor,
    required this.onParessed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: () {
          onParessed();
        },
        child: Text(
          text,
          style: gitSmallText(ColorT: textColor ?? AppColor.primaryTextColor),
        ),
        style: ElevatedButton.styleFrom(
            backgroundColor: background ?? AppColor.primaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
