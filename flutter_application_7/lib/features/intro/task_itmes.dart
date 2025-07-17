// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_7/core/functions/TaskModle.dart';
import 'package:flutter_application_7/core/utilits/colors.dart';
import 'package:flutter_application_7/core/utilits/styleText.dart';

class task_itmes extends StatelessWidget {
  final Taskmodle task;
  const task_itmes({
    super.key,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: task.Color==0?AppColor.DartColor
        :task.Color==1?Colors.amber
        :Colors.deepOrange,
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.Title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: gitSmallText(ColorT: Colors.white),
                ),
                SizedBox(height: 5,),
              Text(
                  task.Date,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: gitSmallText(ColorT: Colors.white,fontSize: 15),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.watch_later,
                      color: Colors.white,
                      size: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text('${task.StartTime}:${task.EndTime}',
                      
                      style: gitSmallText(ColorT: Colors.white),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            width: 2,
            height: 50,
            color: Colors.white,
          ),
          RotatedBox(
            quarterTurns: 3,
            child: Text(
              'TODO',
              style: gitSmallText(ColorT: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
