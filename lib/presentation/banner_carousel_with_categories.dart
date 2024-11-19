import 'package:flutter/material.dart';
import '../data/data_provider.dart';
import '../domain/banner.dart';
import '../domain/category.dart';
import '../domain/center.dart';
import '../domain/doctor.dart';

class BannerCarouselWithCategories extends StatefulWidget {
  @override
  _BannerCarouselWithCategoriesState createState() =>
      _BannerCarouselWithCategoriesState();
}

class _BannerCarouselWithCategoriesState
    extends State<BannerCarouselWithCategories> {
  List<Banner2> banners = [];
  List<Category> categories = [];
  List<Center2> nearbyCenters = [];
  List<Doctor> doctors = [];
  int currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final dataProvider = DataProvider();
    final loadedBanners = await dataProvider.getBanners();
    final loadedCategories = await dataProvider.getCategories();
    final loadedCenters = await dataProvider.getNearbyCenters();
    final loadedDoctors = await dataProvider.getDoctors();

    setState(() {
      banners = loadedBanners;
      categories = loadedCategories;
      nearbyCenters = loadedCenters;
      doctors = loadedDoctors;
    });
  }

  @override
Widget build(BuildContext context) {
  return banners.isEmpty && categories.isEmpty && nearbyCenters.isEmpty
      ? Center(child: CircularProgressIndicator())
      : SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Carusel pentru bannere
              SizedBox(
                height: 250, // Setează înălțimea caruselului
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemCount: banners.length,
                  itemBuilder: (context, index) {
                    final banner = banners[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.network(
                                banner.image,
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.black.withOpacity(0.3),
                              ),
                            ),
                            Positioned(
                              left: 16,
                              bottom: 16,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    banner.title,
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    banner.description,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(banners.length, (index) {
                  return AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    margin: EdgeInsets.symmetric(horizontal: 4.0),
                    width: currentIndex == index ? 12.0 : 8.0,
                    height: 8.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: currentIndex == index ? Colors.blue : Colors.grey,
                    ),
                  );
                }),
              ),

              // Secțiunea de categorii
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Categories',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Aici poți adăuga logica pentru "See All"
                      },
                      child: Text(
                        'See All',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 16.0,
                    crossAxisSpacing: 16.0,
                    childAspectRatio: 1,
                  ),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    return InkWell(
                      onTap: () {
                        // Adaugă acțiunea dorită la apăsarea elementului
                        print('Elementul ${category.title} a fost apăsat');
                      },
                      splashColor: Colors.blue.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(12),
                      child: Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                category.icon,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            category.title,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              // Carusel pentru centrele medicale
              SizedBox(
                height: 300,
                child: PageView.builder(
                  controller: PageController(viewportFraction: 0.8),
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemCount: nearbyCenters.length,
                  itemBuilder: (context, index) {
                    final center = nearbyCenters[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 8),
                            Container(
                              height: 125,
                              width: double.infinity,
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16),
                                  topRight: Radius.circular(16),
                                ),
                                child: Image.network(
                                  center.image,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: 125,
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(16),
                                  bottomRight: Radius.circular(16),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    center.title,
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    center.locationName,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    'Rating: ${center.reviewRate} (${center.countReviews} reviews)',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    '${center.distanceKm} km - ${center.distanceMinutes} minutes',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Secțiunea pentru lista doctorilor
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                child: Text(
                  'Doctors',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: doctors.length,
                itemBuilder: (context, index) {
                  final doctor = doctors[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                doctor.image,
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    doctor.fullName,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    doctor.typeOfDoctor,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    doctor.locationOfCenter,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'Rating: ${doctor.reviewRate}',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        );
}

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}