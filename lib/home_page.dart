import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pemain_app/pages/player_list_page.dart';
import 'package:pemain_app/pages/CalculatorPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pilih Fitur'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Get.to(() => PlayerListPage());
              },
              child: const Text('Manajemen Pemain Bola'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Get.to(() => CalculatorPage());
              },
              child: const Text('Kalkulator'),
            ),
          ],
        ),
      ),
    );
  }
}
