import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:task/app/modules/home/controllers/home_controller.dart';
import 'package:task/app/theme/app_colors.dart';

class AppNavigationBar extends GetView<HomeController> {
  const AppNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BottomNavigationBar(
        currentIndex: controller.tabIndex.value,
        onTap: controller.changeTabIndex,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/svg/home.svg",
              color: controller.tabIndex.value == 0
                  ? AppColors.primary
                  : AppColors.secondary,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/svg/invest.svg",
              color: controller.tabIndex.value == 1
                  ? AppColors.primary
                  : AppColors.secondary,
            ),
            label: 'Invest',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/svg/profile.svg",
              color: controller.tabIndex.value == 2
                  ? AppColors.primary
                  : AppColors.secondary,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
