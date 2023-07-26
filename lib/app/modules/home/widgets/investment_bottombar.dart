import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/app/modules/home/controllers/investment_controller.dart';
import 'package:task/app/theme/app_colors.dart';

class InvestmentBottomBar extends GetView<InvestmentController> {
  const InvestmentBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 130,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, -4),
              blurRadius: 8,
              color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.16),
            ),
          ],
        ),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Text(
                "Adjust your investment amount and see live preview of projected repayment",
                style: TextStyle(color: AppColors.secondary, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton.icon(
                  icon: const Icon(Icons.remove_circle_outline),
                  label: const Text("10K"),
                  onPressed: () {
                    controller.updateInvestment(-10000);
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: AppColors.secondary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                OutlinedButton(
                  onPressed: () {
                    controller.showInvestmentUpdateDialog();
                  },
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    foregroundColor: AppColors.secondary,
                  ),
                  child: Obx(
                    () => Text(
                        "Tk ${(controller.currentIvestment.value / 1000).toStringAsFixed(0)}K"),
                  ),
                ),
                TextButton.icon(
                  icon: const Icon(Icons.add_circle_outline),
                  label: const Text("10K"),
                  onPressed: () {
                    controller.updateInvestment(10000);
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: AppColors.secondary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            ),
            Obx(() => Text(
                  "Tk ${controller.currentIvestment.value}",
                  style: const TextStyle(
                    color: AppColors.secondary,
                    fontSize: 12,
                  ),
                )),
          ],
        ),
      );
  }
}