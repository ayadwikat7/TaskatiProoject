import 'package:flutter/material.dart';
import 'package:flutter_application_7/core/utilits/colors.dart';

TextStyle gitTitleText({double? fontSize, Color? ColorT, FontWeight? FontWig}) {
  return TextStyle(
      fontSize: fontSize ?? 32,
      fontWeight: FontWig ?? FontWeight.bold,
      color: ColorT ?? AppColor.primaryColor);
}

TextStyle gitBodyText({double? fontSize, Color? ColorT, FontWeight? FontWig}) {
  return TextStyle(
      fontSize: fontSize ?? 18,
      fontWeight: FontWig ?? FontWeight.bold,
      color: ColorT ?? AppColor.DartColor);

}
TextStyle gitSmallText({double? fontSize, Color? ColorT, FontWeight? FontWig}) {
  return TextStyle(
      fontSize: fontSize ?? 18,
      fontWeight: FontWig ?? FontWeight.bold,
      color: ColorT ?? AppColor.DartColor);
}


