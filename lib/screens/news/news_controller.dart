import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:news_event_management/constants/app_colors.dart';
import 'package:news_event_management/models/news_model.dart';
import 'package:news_event_management/screens/news/news_api_config.dart';
class NewsController extends GetxController {
  final String title = "News Page Title";

   getNews() async {
    try {
      HttpClient client = HttpClient();
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;

      final url = Uri.parse(Config.apiUrl +
          Config.country +
          Config.categoryUrl +
          Config.apiKey);

      HttpClientRequest request = await client.getUrl(url);
      request.headers.set('content-type', 'application/json');

      HttpClientResponse response = await request.close();
      String reply = await response.transform(utf8.decoder).join();
      // print(response.statusCode);
      final Map<String, dynamic> data = jsonDecode(reply);

      if (response.statusCode == 200) {
        try {
          return NewsModel.fromJson(jsonDecode(reply));
        } catch (e) {
          Get.snackbar('can not get data', e.toString());
        }
      } else if (response.statusCode == 401) {
        // print('data: ${data['status']}, ${data['code']},  ${data['message']}');

        if (data['status'] == "error") {
          Get.snackbar(
            data['status'],
            data['message'],
            snackPosition: SnackPosition.BOTTOM,
            // leftBarIndicatorColor: Colors.red,
            backgroundColor: AppColors.errorColor.withOpacity(0.4),
            animationDuration: const Duration(seconds: 2),
            duration: const Duration(seconds: 4),
          );
        }
      }
      Get.snackbar(
        data['status'],
        data['message'],
        snackPosition: SnackPosition.BOTTOM,
        // leftBarIndicatorColor: Colors.red,
        backgroundColor: AppColors.errorColor.withOpacity(0.4),
        animationDuration: const Duration(seconds: 2),
        duration: const Duration(seconds: 4),
      );
    } catch (e) {
      // print(e.toString());
    }
  }
}
