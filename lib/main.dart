import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      title: 'Pemain App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color.fromARGB(255, 245, 245, 245),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 111, 112, 111),
          foregroundColor: Colors.white,
        ),
      ),

      // ✅ Routing GetX
      initialRoute: AppRoutes.bottomNavPage,
      getPages: AppPages.pages,

      // ✅ Optional enhancements
      defaultTransition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 300),
      popGesture: true, // Geser untuk back di iOS
    );
  }
}
