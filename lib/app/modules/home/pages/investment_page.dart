import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:task/app/modules/home/controllers/investment_controller.dart';
import 'package:task/app/modules/home/widgets/investment_bottombar.dart';
import 'package:task/app/modules/home/widgets/investment_tile.dart';
import 'package:task/app/theme/app_colors.dart';

class InvestMentPage extends GetView<InvestmentController> {
  const InvestMentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ongoing Campaigns'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/svg/message.svg"),
          ),
        ],
      ),
      body: controller.obx(
        (state) {
          if (state == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.separated(
            itemBuilder: (context, index) {
              return InvestmentTile(investModel: state[index]);
            },
            itemCount: state.length,
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                height: 1,
                thickness: 1,
                color: AppColors.secondary.withOpacity(0.2),
              );
            },
          );
        },
        onEmpty: const Center(
          child: Text('No Data'),
        ),
        onError: (error) => Center(
          child: Text(error ?? ''),
        ),
        onLoading: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
      bottomNavigationBar: const InvestmentBottomBar(),
    );
  }
}
