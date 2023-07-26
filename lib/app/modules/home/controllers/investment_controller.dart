import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:task/app/data/models/invest_model.dart';
import 'package:task/app/data/repository/investment_repository.dart';
import 'package:task/app/theme/app_colors.dart';

class InvestmentController extends GetxController
    with StateMixin<List<InvestModel>> {
  RxInt currentIvestment = 40000.obs;
  @override
  void onInit() {
    super.onInit();
    getInvestments();
  }

  void getInvestments() async {
    change([], status: RxStatus.loading());
    try {
      var investments = await InvestmentRepository().getInvestments();
      change(investments, status: RxStatus.success());
    } catch (e) {
      change([], status: RxStatus.error(e.toString()));
    }
  }

  void updateInvestment(int value) {
    if (currentIvestment.value + value < 0) {
      return;
    }
    currentIvestment.value += value;
  }

  void showInvestmentUpdateDialog() async {
    TextEditingController controller =
        TextEditingController(text: currentIvestment.value.toString());
    int? value = await Get.dialog<int>(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        insetPadding: const EdgeInsets.symmetric(vertical: 30),
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 30),
              TextField(
                controller: controller,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Investment Amount',
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      Get.back(result: int.tryParse(controller.text));
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: AppColors.secondary,
                      textStyle: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                      fixedSize: const Size(120, 40),
                    ),
                    child: const Text('Save'),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xff334155),
                      foregroundColor: Colors.white,
                      textStyle: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                      fixedSize: const Size(120, 40),
                    ),
                    child: const Text('Cancel'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
    if (value != null) {
      currentIvestment.value = value;
    }
  }
}
