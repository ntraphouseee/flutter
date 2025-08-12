import 'package:flutter/material.dart';
import 'package:pemain_app/login_page.dart';
import 'package:pemain_app/math.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _openMathPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Math()),
    );
  }

  void _goBackToLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: const Color.fromARGB(255, 111, 112, 111),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 25),
            const Text(
              "WELCOME",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Tombol Kalkulator dengan teks di bawahnya
                Column(
                  children: [
                    SizedBox(
                      width: 120,
                      height: 120,
                      child: ElevatedButton(
                        onPressed: _openMathPage,
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          backgroundColor: const Color.fromARGB(255, 111, 112, 111),
                          padding: const EdgeInsets.all(20),
                        ),
                        child: Image.asset(
                          "assets/math.png",
                          height: 50,
                          width: 50,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Kalkulator",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),

                const SizedBox(width: 30),

                // Tombol Logout dengan teks di bawahnya
                Column(
                  children: [
                    SizedBox(
                      width: 120,
                      height: 120,
                      child: ElevatedButton(
                        onPressed: _goBackToLogin,
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          backgroundColor: const Color.fromARGB(255, 111, 112, 111),
                          padding: const EdgeInsets.all(20),
                        ),
                        child: const Icon(
                          Icons.logout_rounded,
                          color: Colors.white,
                          size: 50,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Logout",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
