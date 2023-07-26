import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/app/data/models/invest_model.dart';
import 'package:task/app/modules/home/controllers/investment_controller.dart';
import 'package:task/app/theme/app_colors.dart';
import 'package:task/app/utils/grade_color.dart';

class InvestmentTile extends GetView<InvestmentController> {
  final InvestModel investModel;
  const InvestmentTile({super.key, required this.investModel});

  @override
  Widget build(BuildContext context) {
    // return ListTile(
    //   leading: CircleAvatar(
    //     radius: 30,
    //     backgroundImage: NetworkImage(investModel.image ?? ''),
    //   ),
    //   title: Text(investModel.name ?? ''),
    //   subtitle: Text(investModel.description ?? ''),
    //   trailing: Obx(
    //     () => Text(
    //       (controller.currentIvestment.value +
    //               (investModel.profit *
    //                   controller.currentIvestment.value /
    //                   100))
    //           .toStringAsFixed(0),
    //     ),
    //   ),
    // );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(investModel.name ?? '',
                  style: const TextStyle(fontSize: 16)),
              const Spacer(),
              Text(
                "${investModel.daysLeft} days left",
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(investModel.type ?? '',
              style: const TextStyle(fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                investModel.description ?? '',
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
              const Spacer(),
              Image.network(
                investModel.image ?? '',
                width: 80,
                height: 30,
                fit: BoxFit.cover,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  const Text("ESTIMATED PROFIT",
                      style: TextStyle(fontSize: 12, color: Colors.grey)),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "${investModel.profit}%",
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 4),
                      const Text("per annum",
                          style: TextStyle(fontSize: 12, color: Colors.grey)),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                width: 60,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      const Text("RISK GRADE",
                          style: TextStyle(fontSize: 12, color: Colors.grey)),
                      const SizedBox(width: 4),
                      Tooltip(
                        message:
                            "Risk grade is a grade given to a loan based on the risk associated with the loan. The lower the grade, the lower the risk.",
                        textStyle:
                            const TextStyle(fontSize: 12, color: Colors.white),
                        margin: const EdgeInsets.symmetric(horizontal: 40),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        showDuration: const Duration(seconds: 5),
                        child: const Icon(
                          Icons.info_outline,
                          size: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: getColorBasedOnGrade(investModel.risk ?? ''),
                      ),
                    ),
                    child: Text(
                      investModel.risk ?? '',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: getColorBasedOnGrade(investModel.risk ?? '')),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColors.primary,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(
                    () => Text(
                        "Projected Repayment Tk ${(controller.currentIvestment.value + (investModel.profit * controller.currentIvestment.value / 100)).toStringAsFixed(0)}*",
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: AppColors.secondary)),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Icon(
                    Icons.arrow_forward,
                    color: AppColors.secondary,
                    size: 16,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
