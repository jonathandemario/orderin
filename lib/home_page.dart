// ignore_for_file: use_key_in_widget_constructors

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:orderin/meal_deals_page.dart';
import 'package:orderin/most_popular_page.dart';

final List<String> imgPaths = [
  'assets/images/food1.jpg',
  'assets/images/food2.jpg',
  'assets/images/food3.jpg',
  'assets/images/food4.jpg',
];

final List<String> popular = [
  'assets/images/food1.jpg',
  'assets/images/food2.jpg',
  'assets/images/food3.jpg',
  'assets/images/food4.jpg',
  'assets/images/food5.jpg',
];

final List<String> popularNames = [
  'Restaurant 1',
  'Restaurant 2',
  'Restaurant 3',
  'Restaurant 4',
  'Restaurant 5',
];

final List<String> popularAddresses = [
  'Address 1, City',
  'Address 2, City',
  'Address 3, City',
  'Address 4, City',
  'Address 5, City',
];

final List<String> meal = [
  'assets/images/food6.jpg',
  'assets/images/food7.jpg',
  'assets/images/food8.jpg',
  'assets/images/food9.jpg',
  'assets/images/food10.jpg',
  'assets/images/food11.jpg',
];

final List<String> mealNames = [
  'Menu 1',
  'Menu 2',
  'Menu 3',
  'Menu 4',
  'Menu 5',
  'Menu 6',
];

final List<String> mealPrice = [
  'IDR 50.000',
  'IDR 60.000',
  'IDR 70.000',
  'IDR 80.000',
  'IDR 90.000',
  'IDR 100.000',
];

late List<Widget> _pageCarousel;
int _activePage = 0;
final PageController _pageController = PageController(initialPage: 0);
Timer? _timer;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_pageController.page == imgPaths.length - 1) {
        _pageController.animateToPage(0,
            duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
      } else {
        _pageController.nextPage(
            duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _pageCarousel = List.generate(
      imgPaths.length,
      (index) => ImagePlaceHolder(
        imgPath: imgPaths[index],
      ),
    );
    startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double horizontalPadding = 16.0;
    double paddingCardL = 16.0;
    double paddingCardR = 0.0;
    if (screenWidth >= 1000 && screenWidth < 1300) {
      horizontalPadding = 150.0;
      paddingCardR = 150.0;
      paddingCardL = 150.0;
    } else if (screenWidth >= 1300) {
      horizontalPadding = 300.0;
      paddingCardR = 300.0;
      paddingCardL = 300.0;
    } else if (screenWidth < 1000) {
      horizontalPadding = 16.0;
      paddingCardL = 16.0;
      paddingCardR = 0.0;
    }
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.black,
        backgroundColor: Colors.white,
        centerTitle: true,
        actions: [
          Padding(
            padding:
                const EdgeInsets.only(right: 15.0, left: 15.0, bottom: 15.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 30.0,
              child: TextFormField(
                style: const TextStyle(fontFamily: 'SFRegular', fontSize: 16),
                decoration: InputDecoration(
                  hintText: 'Search for restaurants...',
                  hintStyle: const TextStyle(
                      color: Colors.grey, fontFamily: 'SFRegular'),
                  prefixIcon: const Icon(Icons.search),
                  prefixIconColor: MaterialStateColor.resolveWith((states) =>
                      states.contains(MaterialState.focused)
                          ? Colors.black
                          : Colors.grey),
                  contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Colors.orange,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Colors.orange,
                    ),
                  ),
                ),
                cursorColor: Colors.orange,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 0.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height / 3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(2.0),
                            child: PageView.builder(
                              controller: _pageController,
                              itemCount: imgPaths.length,
                              onPageChanged: (value) {
                                setState(() {
                                  _activePage = value;
                                });
                              },
                              itemBuilder: (context, index) {
                                return _pageCarousel[index];
                              },
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          right: 0,
                          left: 0,
                          child: Container(
                            color: Colors.transparent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List<Widget>.generate(
                                _pageCarousel.length,
                                (index) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: InkWell(
                                    onTap: () {
                                      _pageController.animateToPage(index,
                                          duration:
                                              const Duration(microseconds: 300),
                                          curve: Curves.easeIn);
                                    },
                                    child: CircleAvatar(
                                      radius: 4,
                                      backgroundColor: _activePage == index
                                          ? Colors.orange
                                          : Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 10.0,
                          left: horizontalPadding,
                          right: horizontalPadding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Most Popular',
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'SFBold'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MostPopularPage()),
                              );
                            },
                            child: const Text(
                              'See All',
                              style: TextStyle(
                                  color: Colors.orange,
                                  fontSize: 16,
                                  fontFamily: 'SFRegular'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: paddingCardL, right: paddingCardR),
                      child: SizedBox(
                        height: 230,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: popular.length,
                          itemBuilder: (BuildContext context, int index) {
                            return generateFoodCards(
                                popular, popularNames, popularAddresses)[index];
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 0.0,
                          left: horizontalPadding,
                          right: horizontalPadding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Meal Deals',
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'SFBold'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MealDealsPage()),
                              );
                            },
                            child: const Text(
                              'See All',
                              style: TextStyle(
                                  color: Colors.orange,
                                  fontSize: 16,
                                  fontFamily: 'SFRegular'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: paddingCardL, right: paddingCardR, bottom: 70),
                      child: SizedBox(
                        height: 230,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: meal.length,
                          itemBuilder: (BuildContext context, int index) {
                            return generateFoodCards(
                                meal, mealNames, mealPrice)[index];
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FoodCard extends StatelessWidget {
  final String image;
  final String attr1;
  final String attr2;
  final int idx;
  final int lgth;

  const FoodCard({
    super.key,
    required this.image,
    required this.attr1,
    required this.attr2,
    required this.idx,
    required this.lgth,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 10,
        bottom: 16,
        left: 0,
        right: idx == lgth - 1 ? 16.0 : 16.0,
      ),
      child: SizedBox(
        width: 250.0,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(6, 3),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.asset(
                  image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 120.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(height: 4),
                      Text(
                        attr1,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        attr2,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List<Widget> generateFoodCards(
    List<String> images, List<String> attr1, List<String> attr2) {
  List<Widget> cards = [];
  for (int i = 0; i < images.length; i++) {
    cards.add(
      FoodCard(
        image: images[i],
        attr1: attr1[i],
        attr2: attr2[i],
        idx: i,
        lgth: images.length,
      ),
    );
  }
  return cards;
}

class ImagePlaceHolder extends StatelessWidget {
  final String? imgPath;
  const ImagePlaceHolder({Key? key, this.imgPath});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imgPath!,
      fit: BoxFit.cover,
    );
  }
}