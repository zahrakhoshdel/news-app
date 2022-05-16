import 'package:flutter/material.dart';

class Config {
  static String apiKey = "&apiKey=9d8db3f17bcc4ee5ba1f523900fa31bf";
  static String apiUrl = "http://newsapi.org/v2/top-headlines";
  static String country = "?country=us";
  static String categoryUrl = "&category=business";

  static List<Tab> categories = <Tab>[
    const Tab(text: 'business'),
    const Tab(text: 'entertainment'),
    const Tab(text: 'general'),
    const Tab(text: 'health'),
    const Tab(text: 'science'),
    const Tab(text: 'sports'),
    const Tab(text: 'technology'),
  ];
}
