import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pemain_app/controllers/calculator_controller.dart';
import 'package:pemain_app/widget/widgetbutton.dart';
import 'package:pemain_app/widget/textfield.dart';
import 'package:pemain_app/routes/routes.dart';

class CalculatorPage extends StatelessWidget {
  CalculatorPage({super.key});

  final CalculatorController calculatorController = Get.put(CalculatorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 111, 112, 111),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Textfield(
              hint: "Angka 1",
              controller: calculatorController.txtangka1,
            ),
            const SizedBox(height: 16),
            Textfield(
              hint: "Angka 2",
              controller: calculatorController.txtangka2,
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(
                  textColor: Colors.white,
                  textt: "+",
                  press: calculatorController.tambah,
                  color: const Color.fromARGB(255, 111, 112, 111),
                ),
                CustomButton(
                  textColor: Colors.white,
                  textt: "-",
                  press: calculatorController.kurang,
                  color: const Color.fromARGB(255, 111, 112, 111),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(
                  textColor: Colors.white,
                  textt: "×",
                  press: calculatorController.kali,
                  color: const Color.fromARGB(255, 111, 112, 111),
                ),
                CustomButton(
                  textColor: Colors.white,
                  textt: "÷",
                  press: calculatorController.bagi,
                  color: const Color.fromARGB(255, 111, 112, 111),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Obx(() {
              return Text(
                'Hasil: ${calculatorController.hasil.value}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              );
            }),
            const SizedBox(height: 24),
            CustomButton(
              textColor: Colors.white,
              textt: "Move to Football Players",
              press: () {
                calculatorController.clear();
                Get.toNamed(AppRoutes.playerList);
              },
              color: const Color.fromARGB(255, 111, 112, 111),
            ),
          ],
        ),
      ),
    );
  }
}
