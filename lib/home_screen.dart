import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController pageController = PageController();

  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 3), (timer) {
      // print('실행 !');
      int? nextPage = pageController.page?.toInt();
      if (nextPage == null) {
        return;
      }
      if (nextPage == 4) {
        nextPage = 0;
      } else {
        nextPage++;
      }
      pageController.animateToPage(
        nextPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return Scaffold(
        body: PageView(
            controller: pageController,
            children: [1, 2, 3, 4, 5]
                .map((number) => Image.asset('images/image_$number.jpeg',
                    fit: BoxFit.cover)) // 진짜 리스트는 아니다.
                .toList()));
  }
}
