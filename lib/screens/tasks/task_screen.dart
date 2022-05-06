import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_event_management/screens/tasks/task_controller.dart';

class TaskScreen extends StatelessWidget {
  final TaskController controller = Get.put(TaskController());
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(controller.title),
    );
  }
}
