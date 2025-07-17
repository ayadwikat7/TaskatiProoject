import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_7/core/functions/TaskModle.dart';
import 'package:flutter_application_7/core/functions/navigations.dart';
import 'package:flutter_application_7/core/utilits/colors.dart';
import 'package:flutter_application_7/core/utilits/styleText.dart';
import 'package:flutter_application_7/features/intro/home.dart';
import 'package:flutter_application_7/features/intro/task_itmes.dart';

class Completedtask extends StatelessWidget {
  final List<Taskmodle> taskCompleted;
  final int taskc;
  const Completedtask(
      {super.key, required this.taskCompleted, required this.taskc});

  @override
  Widget build(BuildContext context) {
    int rela = 100;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            pushToWithReplacment(context, Home());
          },
          icon: Icon(
            Icons.navigate_before_sharp,
            color: AppColor.primaryColor,
            size: 30,
          ),
        ),
        title: Text(
          'Completed Task Page',
          style: gitTitleText(fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              width: 500,
              height: 350,
              decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 183, 78, 163),
                    offset: Offset(4, 4),
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'The probability of completed task',
                      style: gitBodyText(
                          ColorT: AppColor.primaryTextColor, fontSize: 19),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      '%$rela',
                      style: gitBodyText(
                          ColorT: AppColor.primaryTextColor, fontSize: 80),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        (rela < 50)
                            ? 1
                            : (rela >= 50 && rela < 100)
                                ? 2
                                : 3,
                        (index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            // Wrap ListView.builder in Expanded
            Expanded(
              child: ListView.builder(
                itemCount: taskCompleted.length,
                itemBuilder: (BuildContext context, int index) {
                  taskCompleted.add(taskCompleted.elementAt(index));
                  return task_itmes(
                    task: taskCompleted[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
