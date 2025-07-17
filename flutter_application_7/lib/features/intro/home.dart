// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:bottom_picker/resources/arrays.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_7/core/completedTask.dart';
import 'package:flutter_application_7/core/functions/TaskModle.dart';
import 'package:flutter_application_7/core/functions/navigations.dart';
import 'package:flutter_application_7/core/utilits/styleText.dart';
import 'package:flutter_application_7/core/utilits/colors.dart';
import 'package:flutter_application_7/core/wight/CustomButtons.dart';
import 'package:flutter_application_7/features/intro/Upload/AddTask.dart';
import 'package:flutter_application_7/features/intro/task_itmes.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:bottom_picker/bottom_picker.dart';

class Home extends StatelessWidget {
  Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var user = Hive.box('user');
    String name = user.get('name');
    String path = user.get('path');

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row1(
                title: name,
                title1: 'Have a ncie Day !',
                customWi: CircleAvatar(
                  radius: 40,
                  backgroundImage: FileImage(File(path)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row1(
                title: DateFormat('dd MMM yyyy').format(DateTime.now()),
                title1: DateFormat('EEE').format(DateTime.now()),
                customWi: CoustomButton(
                    text: '+ Add Task',
                    onParessed: () {
                      pushToWithReplacment(context, Addtask());
                    },
                    width: 180),
              ),
              SizedBox(
                height: 20,
              ),
              BottomPicker.date(
                pickerTitle:
                    Text('Date of Task', style: gitTitleText(fontSize: 20)),
                dateOrder: DatePickerDateOrder.dmy,
                initialDateTime: DateTime(2007, 1, 1),
                maxDateTime: DateTime(2025),
                minDateTime: DateTime(2007),
                pickerTextStyle: gitBodyText(fontSize: 17),
                onChange: (index) {
                  print(index);
                },
                onSubmit: (index) {
                  print(index);
                },
                bottomPickerTheme: BottomPickerTheme.morningSalad,
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: Hive.box('task').listenable(),
                  builder: (context, Box taskBox, child) {
                    var task = taskBox.values.toList();
                    return ListView.builder(
                      itemCount: task.length,
                      itemBuilder: (context, index) {
                        return Dismissible(
                          onDismissed: (Direction) {
                            if (Direction == DismissDirection.endToStart) {
                              taskBox.deleteAt(index);
                            } else {
                              Taskmodle taskCom = taskBox.getAt(index) as Taskmodle;

                              print(taskCom);

                              pushToWithReplacment(
                                  context,
                                  Completedtask(
                                    taskCompleted: [taskCom],
                                    taskc: [taskCom].length,
                                  ));
                            }
                          },
                          background: Container(
                            margin: EdgeInsets.only(
                              bottom: 10,
                            ),
                            decoration: BoxDecoration(
                                color: AppColor.DartColor,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromARGB(255, 154, 230, 239),
                                      blurRadius: 5,
                                      offset: Offset(2, 3)),
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  RotatedBox(
                                    quarterTurns: 3,
                                    child: Text(
                                      'Done',
                                      style: gitSmallText(
                                          ColorT: Colors.white, fontSize: 18),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    width: 2,
                                    height: 50,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          secondaryBackground: Container(
                            margin: EdgeInsets.only(
                              bottom: 10,
                            ),
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                      color: const Color.fromARGB(
                                          255, 222, 104, 96),
                                      blurRadius: 5,
                                      offset: Offset(2, 3))
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    width: 2,
                                    height: 50,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  RotatedBox(
                                    quarterTurns: 3,
                                    child: Text(
                                      'Delete',
                                      style: gitSmallText(ColorT: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          key: UniqueKey(),
                          child: task_itmes(
                            task: task[index],
                          ),
                        );
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Row1 extends StatelessWidget {
  const Row1({
    super.key,
    required this.title,
    required this.title1,
    required this.customWi,
  });

  final String title;
  final String title1;

  final Widget customWi;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: gitTitleText(fontSize: 20),
            ),
            Text(title1,
                style: gitTitleText(fontSize: 25, ColorT: AppColor.DartColor)),
          ],
        ),
        Spacer(),
        customWi
      ],
    );
  }
}
