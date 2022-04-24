import 'package:flutter/material.dart';
import 'package:samachar_app/widgets/newCategory_item.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:developer';

import 'package:samachar_app/widgets/newsCart_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController? searchController;
  List<String> navItem = [
    "India",
    "World",
    "Top",
    "Latest",
    "Finance",
    "Sports",
    "Entertainment",
    "Politics"
  ];

  List<Color> newsItem = [
    Colors.blue,
    Colors.yellow,
    Colors.green,
    Colors.purple,
    Colors.red
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Samachar"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    border: Border.all(width: 2, color: Colors.blue)),
                child: TextField(
                    onSubmitted: (value) {
                      log(value);
                    },
                    textInputAction: TextInputAction.search,
                    controller: searchController,
                    decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.search_rounded),
                      border: InputBorder.none,
                      hintText: "Search",
                    )),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                height: 100,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: navItem.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: (() {
                            log(navItem[index]);
                          }),
                          child: NewsItem(item: navItem[index]));
                    }),
              ),
              CarouselSlider(
                items: newsItem.map((index) {
                  return Builder(builder: (BuildContext context) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 8),
                      decoration: BoxDecoration(
                        color: index,
                      ),
                    );
                  });
                }).toList(),
                options: CarouselOptions(
                  height: 200,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                ),
              ),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const NewsCartItem();
                  })
            ],
          ),
        ),
      ),
    );
  }
}
