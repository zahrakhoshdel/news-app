import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_event_management/screens/notes/note_controller.dart';

class NoteScreen extends StatelessWidget {
  final NoteController controller = Get.put(NoteController());
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(controller.title),
    );
  }
}
