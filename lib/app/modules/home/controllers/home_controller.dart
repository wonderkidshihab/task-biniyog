import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/app/modules/home/pages/home_page.dart';
import 'package:task/app/modules/home/pages/investment_page.dart';
import 'package:task/app/modules/home/pages/profile_page.dart';

class HomeController extends GetxController {
  RxInt tabIndex = 1.obs;
  List<Widget> pages = [
    const HomePage(),
    const InvestMentPage(),
    const ProfilePage(),
  ];

  void changeTabIndex(int i) {
    tabIndex.value = i;
  }
}
