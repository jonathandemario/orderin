// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

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

class MealDealsPage extends StatelessWidget {
  const MealDealsPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text(
            "Meal Deals",
            style: TextStyle(fontSize: 30, fontFamily: 'SFBold'),
          ),
          shadowColor: Colors.black,
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width >= 600 ? 800 : MediaQuery.of(context).size.width,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: meal.length,
                itemBuilder: (BuildContext context, int index) {
                  return generateFoodCards(
                      meal, mealNames, mealPrice)[index];
                },
              ),
            ),
          ),
        ),
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
      padding: const EdgeInsets.only(bottom: 20),
      child: SizedBox(
        height: 250,
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
                  height: 180.0,
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