// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_7/core/functions/navigations.dart';
import 'package:flutter_application_7/core/utilits/colors.dart';
import 'package:flutter_application_7/core/utilits/styleText.dart';
import 'package:flutter_application_7/core/wight/CustomButtons.dart';
import 'package:flutter_application_7/features/intro/home.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';

class Uploadscreen extends StatefulWidget {
  const Uploadscreen({super.key});

  @override
  State<Uploadscreen> createState() => _nameState();
}

class _nameState extends State<Uploadscreen> {
  String? path;
  var controloerName = TextEditingController();
  var fomKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () async {
                if (fomKey.currentState!.validate() && path != null) {
                  var user = Hive.box('user');
                  user.put('name', controloerName.text);
                  user.put('path', path);
                  user.put('isUpload', true);
                  pushToWithReplacment(context, Home());
                } else if (path == null) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(
                            'Error',
                            style: TextStyle(
                                color: AppColor.primaryColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          content: Text(
                            'Please upload image',
                            style: TextStyle(
                                color: AppColor.DartColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('OK'))
                          ],
                        );
                      });
                }
              },
              child: Text(
                'Done',
                style: TextStyle(color: AppColor.primaryColor),
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
  radius: 70,
  backgroundImage: path != null
      ? FileImage(File(path!)) as ImageProvider<Object>
      : NetworkImage(
          "https://png.pngtree.com/png-clipart/20210608/ourmid/pngtree-gray-silhouette-avatar-png-image_3418406.jpg",
        ) as ImageProvider<Object>,
),

              SizedBox(
                height: 10,
              ),
              CoustomButton(
                text: 'Upload image from Gallery',
                onParessed: () async {
                  await ImagePicker()
                      .pickImage(source: ImageSource.gallery)
                      .then((value) {
                    setState(() {
                      path = value!.path;
                    });
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              CoustomButton(
                text: 'Upload image from camera',
                onParessed: () async {
                  await ImagePicker()
                      .pickImage(source: ImageSource.camera)
                      .then((value) {
                    setState(() {
                      path = value!.path;
                    });
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                color: AppColor.primaryColor,
                indent: 20,
                endIndent: 20,
                thickness: 2,
              ),
              SizedBox(
                height: 15,
              ),
              Form(
                key: fomKey,
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Name is required';
                    } else if (RegExp('^[A-z][a-z]{2,8}').hasMatch(value)) {
                      return null;
                    }
                  },
                  controller: controloerName,
                  decoration: InputDecoration(
                      hintText: 'Enter your name...',
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColor.primaryColor, width: 2),
                        borderRadius: BorderRadius.circular(20),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}