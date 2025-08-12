import 'package:flutter/material.dart';

import 'package:pemain_app/kalkulator_page.dart';
import 'widget/textfield.dart';
import 'widget/gender.dart';
import 'package:intl/intl.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController Username = TextEditingController();
  final TextEditingController Password = TextEditingController();
  final TextEditingController Email = TextEditingController();
  final TextEditingController date = TextEditingController();

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
    final username = Username.text;
    final password = Password.text;
    final email = Email.text;
    final tanggal = date.text;
    final gender = selectedGender;

    if (username.isEmpty ||
        password.isEmpty ||
        email.isEmpty ||
        tanggal.isEmpty ||
        gender == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("⚠️ Semua field wajib diisi"),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 1),
        ),
      );

      Username.clear();
      Password.clear();
      Email.clear();
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

      Future.delayed(Duration(milliseconds: 800), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const KalkulatorPage()),
        );
      });
    }
  }

  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        backgroundColor: Colors.blueAccent[400],
      ),
      body: Container(
        margin: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Textfield(hint: "Username", controller: Username),
            Textfield(hint: "Email", controller: Email),
            Textfield(hint: "Password", controller: Password, isPassword: true),
            SizedBox(height: 8),
            GenderDropdown(
              selectedGender: selectedGender,
              onChanged: (value) {
                setState(() {
                  selectedGender = value;
                });
              },
            ),
            SizedBox(height: 8),
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

            SizedBox(height: 20),

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
