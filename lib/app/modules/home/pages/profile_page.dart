import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/app/modules/home/controllers/home_controller.dart';

class ProfilePage extends GetView<HomeController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'ProfilePage is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
