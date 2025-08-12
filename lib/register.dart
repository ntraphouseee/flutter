import 'package:flutter/material.dart';
import 'package:pemain_app/home.dart';
import 'widgets/textfield.dart';
import 'widgets/gender.dart';
import 'package:intl/intl.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController date = TextEditingController();

  String? selectedGender;

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        date.text = DateFormat("yyyy-MM-dd").format(picked);
      });
    }
  }

  void _register() {
    final uname = username.text;
    final pwd = password.text;
    final mail = email.text;
    final tanggal = date.text;
    final gender = selectedGender;

    if (uname.isEmpty ||
        pwd.isEmpty ||
        mail.isEmpty ||
        tanggal.isEmpty ||
        gender == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("⚠️ Semua field wajib diisi"),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 1),
        ),
      );

      username.clear();
      password.clear();
      email.clear();
      date.clear();
      setState(() {
        selectedGender = null;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("✅ Register berhasil!"),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 1),
        ),
      );

      Future.delayed(const Duration(milliseconds: 800), () {
        if (!mounted) return;  // cek mounted sebelum pakai context
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        backgroundColor: Colors.blueAccent[400],
      ),
      body: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Textfield(hint: "Username", controller: username),
            Textfield(hint: "Email", controller: email),
            Textfield(hint: "Password", controller: password, isPassword: true),
            const SizedBox(height: 8),
            GenderDropdown(
              selectedGender: selectedGender,
              onChanged: (value) {
                setState(() {
                  selectedGender = value;
                });
              },
            ),
            const SizedBox(height: 8),
            TextField(
              controller: date,
              readOnly: true,
              onTap: _selectDate,
              decoration: InputDecoration(
                hintText: "tanggal lahir",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: _register,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text("Register", style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
