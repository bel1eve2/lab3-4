import 'package:flutter/material.dart';
import '/presentation/banner_carousel_with_categories.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Banner Carousel & Categories')),
        body: BannerCarouselWithCategories(),
      ),
    );
  }
}