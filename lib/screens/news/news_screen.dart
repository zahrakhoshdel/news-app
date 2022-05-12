import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_event_management/models/news_model.dart';
import 'package:news_event_management/screens/news/news_controller.dart';
import 'package:news_event_management/screens/news/widgets/news_card.dart';
import 'package:news_event_management/widgets/screen_title.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> with TickerProviderStateMixin {
  late Size size;

  final controller = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(size.width * 0.05),
            child: ScreenTitle(size: size, title: 'News'),
          ),
          Expanded(
            child: FutureBuilder(
              future: controller.getNews(),
              builder: (context, AsyncSnapshot snapshot) {
                NewsModel? data = snapshot.data;
                // print(data);
                if (snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: data!.articles!.length,
                    itemBuilder: (context, index) {
                      return NewsCard(news: data, index: index, size: size);
                    },
                  );
                }
                if (snapshot.hasError) {
                  return const Center(
                    child: Text("Something went wrong!"),
                  );
                }
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}
