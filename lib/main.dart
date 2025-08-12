import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Ganti dari get_navigation agar lengkap
import 'package:pemain_app/pages/CalculatorPage.dart';
import 'package:pemain_app/login_page.dart';
import 'package:pemain_app/routes/pages.dart';
import 'package:pemain_app/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 111, 112, 111),
          foregroundColor: Colors.white,
        ),
      ),
      initialRoute: AppRoutes.calculator,
      getPages: AppPages.pages,

      // ✅ Tambahan penting agar overlay Snackbar muncul dengan lancar
      defaultTransition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 300),
      popGesture: true,
    );
  }
}
