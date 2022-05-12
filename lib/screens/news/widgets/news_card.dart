// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:news_event_management/constants/app_colors.dart';
import 'package:news_event_management/constants/text_styles.dart';
import 'package:news_event_management/models/news_model.dart';

class NewsCard extends StatelessWidget {
  NewsModel news;
  int index;
  Size size;
  NewsCard(
      {Key? key, required this.news, required this.index, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.05, vertical: size.width * 0.02),
      child: Center(
        child: Material(
          color: AppColors.backgroundColor,
          elevation: 8,
          borderRadius: BorderRadius.circular(30),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                  width: double.infinity,
                  height: size.height * 0.25,
                  child: Image.network(
                    news.articles![index].urlImage.toString(),
                    fit: BoxFit.fill,
                  )),
              SizedBox(
                height: size.height * 0.01,
              ),
              Padding(
                padding: EdgeInsets.all(size.width * 0.03),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      news.articles![index].title.toString(),
                      style: TextStyles.titleTextStyle,
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    news.articles![index].urlImage != null
                        ? Text(
                            news.articles![index].description.toString(),
                            style: TextStyles.subtitleTextStyle,
                          )
                        : Container()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
