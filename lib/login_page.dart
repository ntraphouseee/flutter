import 'package:flutter/material.dart';

import 'package:pemain_app/kalkulator_page.dart';
import 'package:pemain_app/register_page.dart';
import 'package:pemain_app/widget/widgetbutton.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    String username = "nendra";
    String password = "asd";

    String inputUsername = _emailController.text;
    String inputPassword = _passwordController.text;

    if (inputUsername.isEmpty || inputPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Email dan Password tidak boleh kosong!"),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        ),
      );
    } else if (inputUsername == username && inputPassword == password) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Login Berhasil: $inputUsername"),
          backgroundColor: Colors.green,
          duration: const Duration(seconds: 2),
        ),
      );
      Future.delayed(const Duration(seconds: 1), () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const KalkulatorPage()),
        );
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(

          content: Text("Login gagal! Email atau password salah."),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  void _register() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Register()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login Page")),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome to our first App",
              style: TextStyle(
                fontSize: 20,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text("please login using your email and password"),
            Center(
              child: Image.asset('images/logo.png', width: 100, height: 100),
            ),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                hintText: "Email",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: "Password",
                border: OutlineInputBorder(),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 25),
              child: Center(
                child: Column(
                  children: [
                    // Tombol login
                    CustomButton(
                      color: Colors.blueAccent,
                      press: _login,
                      textt: "Login",
                      textColor: Colors.white,
                    ),
                    const SizedBox(height: 10),
                    const Text("atau"),
                    const SizedBox(height: 10),
                    // Tombol register
                    CustomButton(
                      color: Colors.blueAccent,
                      press: _register,
                      textt: "Register",
                      textColor: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
