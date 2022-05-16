import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_event_management/models/news_model.dart';
import 'package:news_event_management/screens/news/news_api_config.dart';
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

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: Config.categories.length, vsync: this, initialIndex: 0);
    _tabController.animateTo(0);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: Config.categories.length,
      initialIndex: 0,
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(size.width * 0.05),
              child: ScreenTitle(size: size, title: 'News'),
            ),
            Expanded(
              child: TabBarView(
                physics: const BouncingScrollPhysics(),
                controller: _tabController,
                children: Config.categories.map((Tab tab) {
                  final String? label = tab.text;
                  return FutureBuilder(
                    future: controller.getNews(label!),
                    builder: (context, AsyncSnapshot snapshot) {
                      NewsModel? data = snapshot.data;
                      // print(data);
                      if (snapshot.hasData) {
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: data!.articles!.length,
                          itemBuilder: (context, index) {
                            return NewsCard(
                                news: data, index: index, size: size);
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
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
