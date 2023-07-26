import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/app/modules/home/widgets/app_navigation_bar.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: controller.tabIndex.value,
          children: controller.pages,
        ),
      ),
      bottomNavigationBar: const AppNavigationBar(),
    );
  }
}
