import 'package:get/get.dart';
import 'package:news_event_management/screens/home/home_controller.dart';
import 'package:news_event_management/screens/news/news_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<NewsController>(() => NewsController());
  }
}
