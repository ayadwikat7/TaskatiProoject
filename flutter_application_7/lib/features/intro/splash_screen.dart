// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_7/core/utilits/colors.dart';
import 'package:flutter_application_7/core/functions/navigations.dart';
import 'package:flutter_application_7/core/utilits/styleText.dart';
import 'package:flutter_application_7/features/intro/Upload/UploadScreen.dart';
import 'package:flutter_application_7/features/intro/home.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';

class SlashScreen extends StatefulWidget {
  const SlashScreen({super.key});

  @override
  State<SlashScreen> createState() => _SlashScreenState();
}

class _SlashScreenState extends State<SlashScreen> {
  @override
  @override
void initState() {
  super.initState();

  Future.delayed(Duration.zero, () async {
    try {
      var user = Hive.box('user');
      bool isUploaded = user.get('isUpload') ?? false;

      await Future.delayed(Duration(seconds: 2));
      if (isUploaded) {
        pushToWithReplacment(context, Home());
      } else {
        pushToWithReplacment(context, Uploadscreen());
      }
    } catch (e) {
      print("Error accessing Hive box in SlashScreen: $e");
    }
  });
}


  @override
Widget build(BuildContext context) {
  return Scaffold(
    body: Center(
      child: SingleChildScrollView( // Prevent layout overflow
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Taskati',
              style: gitTitleText(),
            ),
            SizedBox(
              height: 20,
            ),
            Lottie.asset('assets/images/Logo2.json'), // Ensure the path is correct
            SizedBox(
              height: 20,
            ),
            Text('This is time to organized', style: gitBodyText()),
          ],
        ),
      ),
    ),
  );
}

}
