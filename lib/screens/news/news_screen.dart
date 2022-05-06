import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_event_management/screens/news/news_controller.dart';

class NewsScreen extends GetView<NewsController> {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(controller.title),
    );
  }
}
