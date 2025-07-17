// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_7/core/functions/TaskModle.dart';
import 'package:flutter_application_7/core/functions/navigations.dart';

import 'package:flutter_application_7/core/utilits/colors.dart';
import 'package:flutter_application_7/core/utilits/styleText.dart';
import 'package:flutter_application_7/core/wight/CustomButtons.dart';
import 'package:flutter_application_7/features/intro/home.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

class Addtask extends StatefulWidget {
  const Addtask({super.key});

  @override
  State<Addtask> createState() => _AddtaskState();
}

class _AddtaskState extends State<Addtask> {
  var formKy = GlobalKey<FormState>();
  var titlecontroler = TextEditingController();
  var notecontroler = TextEditingController();
  var datecontroler = TextEditingController(
    text: DateFormat('dd/MM/yyyy').format(
      DateTime.now(),
    ),
  );

  var StartTimeController =
      TextEditingController(text: DateFormat('hh:mm a').format(DateTime.now()));
  var EndTimeController =
      TextEditingController(text: DateFormat('hh:mm a').format(DateTime.now()));

  int SelectedColor = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('+ Add Task',
            style: gitTitleText(ColorT: AppColor.DartColor, fontSize: 25)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: Form(
          key: formKy,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Title',
                  style:
                      gitTitleText(fontSize: 22, ColorT: AppColor.primaryColor),
                ),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: titlecontroler,
                  validator: (Value) {
                    if (Value != null) {
                      if (Value.length < 5) {
                        return 'Title must be at least 5 characters long.';
                      }
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Note',
                  style:
                      gitTitleText(fontSize: 22, ColorT: AppColor.primaryColor),
                ),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: notecontroler,
                  maxLines: 5,
                  validator: (Value) {
                    if (Value != null) {
                      if (Value.length < 10) {
                        return 'Note must be at least 10 characters long.';
                      }
                    }
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Date',
                  style:
                      gitTitleText(fontSize: 22, ColorT: AppColor.primaryColor),
                ),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  onTap: () {
                    showDatePicker(
                            context: context,
                            firstDate: DateTime.now(),
                            initialDate: DateTime.now(),
                            lastDate: DateTime(2026))
                        .then((Value) {
                      if (Value != null) {
                        datecontroler.text =
                            DateFormat('dd/MM/yyyy').format(Value);
                      }
                    });
                  },
                  controller: datecontroler,
                  readOnly: true,
                  decoration: InputDecoration(
                      suffixIcon: Icon(
                    Icons.calendar_month,
                    color: AppColor.DartColor,
                  )),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Start Time',
                            style: gitTitleText(
                                fontSize: 20, ColorT: AppColor.primaryColor),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            onTap: () {
                              showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now())
                                  .then((value) {
                                if (value != null) {
                                  StartTimeController.text =
                                      value.format(context);
                                }
                              });
                            },
                            controller: StartTimeController,
                            readOnly: true,
                            decoration: InputDecoration(
                                suffixIcon: Icon(
                              Icons.access_time,
                              color: AppColor.DartColor,
                            )),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'End Time',
                            style: gitTitleText(
                                fontSize: 20, ColorT: AppColor.primaryColor),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            onTap: () {
                              showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now())
                                  .then((value) {
                                if (value != null) {
                                  EndTimeController.text =
                                      value.format(context);
                                }
                              });
                            },
                            controller: EndTimeController,
                            readOnly: true,
                            decoration: InputDecoration(
                                suffixIcon: Icon(
                              Icons.access_time,
                              color: AppColor.DartColor,
                            )),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: List.generate(3, (index) {
                          return Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  SelectedColor = index;
                                });
                              },
                              child: CircleAvatar(
                                radius: 15,
                                backgroundColor: index == 0
                                    ? AppColor.DartColor
                                    : index == 1
                                        ? Colors.amber
                                        : Colors.red,
                                child: SelectedColor == index
                                    ? Icon(
                                        Icons.check,
                                        color: Colors.white,
                                      )
                                    : null,
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    Expanded(
                      child: CoustomButton(
                        text: 'Create',
                        onParessed: () {
                          if (formKy.currentState!.validate()) {
                            final startTime = DateFormat('hh:mm a')
                                .parse(StartTimeController.text);
                            final endTime = DateFormat('hh:mm a')
                                .parse(EndTimeController.text);

                            if (endTime.isBefore(startTime) ||
                                endTime.isAtSameMomentAs(startTime)) {
                              
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: AppColor.primaryColor,
                                  content: Container(
                                  color: AppColor.primaryColor,
                                child: Text(
                                  'End time must be after start time',
                                  style: gitSmallText(ColorT: Colors.white)
                                ),
                              )));
                              return; // Prevent further execution if validation fails
                            }

                            Taskmodle newTask = new Taskmodle(
                                Title: titlecontroler.text,
                                Note: notecontroler.text,
                                Date: datecontroler.text,
                                StartTime: StartTimeController.text,
                                EndTime: EndTimeController.text,
                                isCompleted: false,
                                Color: SelectedColor,
                                id: DateTime.now().toString() +
                                    titlecontroler.text);
                            var taskBox = Hive.box('task');
                            taskBox.put(newTask.id, newTask);
                            pushToWithReplacment(context, Home());
                          }
                          return;
                        },
                        width: 150,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
