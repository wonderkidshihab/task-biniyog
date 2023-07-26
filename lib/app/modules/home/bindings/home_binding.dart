import 'package:get/get.dart';
import 'package:task/app/modules/home/controllers/investment_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut(() => InvestmentController());
  }
}
