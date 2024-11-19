import 'package:flutter/material.dart';
import '../banner_carousel_with_categories.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Banner Carousel & Categories'),
      ),
      body: BannerCarouselWithCategories(),  // Apelăm widget-ul aici
    );
  }
}