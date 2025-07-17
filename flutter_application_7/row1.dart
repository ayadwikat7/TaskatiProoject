// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_7/core/utilits/colors.dart';
import 'package:flutter_application_7/core/utilits/styleText.dart';

class Row1 extends StatelessWidget {
  const Row1({
    super.key,
    required this.title,
    required this.path, required this.ti,
  });

  final String title;
  final String ti;
  final String path;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: gitTitleText(fontSize: 25),
            ),
            Text(ti,
                style: gitTitleText(fontSize: 30, ColorT: AppColor.DartColor)),
          ],
        ),
        Spacer(),
        CircleAvatar(
          radius: 50,
          backgroundImage: FileImage(File(path)),
        )
      ],
    );
  }
}
