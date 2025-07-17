import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_7/core/completedTask.dart';
import 'package:flutter_application_7/core/functions/TaskAdapter.dart';
import 'package:flutter_application_7/core/utilits/colors.dart';
import 'package:flutter_application_7/features/intro/splash_screen.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive
  await Hive.initFlutter();
  Hive.registerAdapter(Taskadapter()); // Register the TaskAdapter

  // Open Hive boxes with error handling
  try {
    final dir = await getApplicationDocumentsDirectory();
    final taskBoxFile = File('${dir.path}/task.hive');

    // Check for corrupted task box and delete if necessary
    if (await taskBoxFile.exists()) {
      try {
        await Hive.openBox('task'); // Try opening the task box
      } catch (e) {
        print('Corrupted Hive box detected: $e');
        await taskBoxFile.delete(); // Delete corrupted task box file
        await Hive.openBox('task'); // Recreate the box
      }
    } else {
      await Hive.openBox('task'); // Create a new box if it doesn't exist
    }

    // Open the 'user' box as usual
    await Hive.openBox('user');
  } catch (e) {
    print('Error initializing Hive boxes: $e');
  }

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
                color: AppColor
                    .primaryColor), // Replace with AppColor.primaryColor if defined
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
                color: AppColor
                    .DartColor), // Replace with AppColor.primaryColor if defined
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
                color: Colors
                    .red), // Replace with AppColor.primaryColor if defined
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: Center(
          child: SlashScreen  (),
        ),
      ),
    );
  }
}
