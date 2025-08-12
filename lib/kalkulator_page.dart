import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KalkulatorPage extends StatefulWidget {
  const KalkulatorPage({super.key});

  @override
  State<KalkulatorPage> createState() => _KalkulatorPageState();
}

class _KalkulatorPageState extends State<KalkulatorPage> {
  final TextEditingController _angka1Controller = TextEditingController();
  final TextEditingController _angka2Controller = TextEditingController();
  String _hasil = '';

  void _hitung(String operator) {
    double? angka1 = double.tryParse(_angka1Controller.text);
    double? angka2 = double.tryParse(_angka2Controller.text);

    if (angka1 == null || angka2 == null) {
      setState(() {
        _hasil = 'Input tidak valid';
      });
      return;
    }

    double result;
    switch (operator) {
      case '+':
        result = angka1 + angka2;
        break;
      case '-':
        result = angka1 - angka2;
        break;
      case '×':
        result = angka1 * angka2;
        break;
      case '÷':
        if (angka2 == 0) {
          setState(() {
            _hasil = 'Tidak bisa dibagi 0';
          });
          return;
        }
        result = angka1 / angka2;
        break;
      default:
        result = 0;
    }

    setState(() {
      _hasil = 'Hasil: $result';
    });
  }

  void _reset() {
    _angka1Controller.clear();
    _angka2Controller.clear();
    setState(() {
      _hasil = '';
    });
  }

  @override
  void dispose() {
    _angka1Controller.dispose();
    _angka2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kalkulator Sederhana"),
        backgroundColor: const Color.fromARGB(255, 111, 112, 111),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _angka1Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Angka 1"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _angka2Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Angka 2"),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _hitung('+'),
                  child: const Text('+'),
                ),
                ElevatedButton(
                  onPressed: () => _hitung('-'),
                  child: const Text('-'),
                ),
                ElevatedButton(
                  onPressed: () => _hitung('×'),
                  child: const Text('×'),
                ),
                ElevatedButton(
                  onPressed: () => _hitung('÷'),
                  child: const Text('÷'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              _hasil,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _reset,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
              child: const Text("Reset"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Tampilkan snackbar
                Get.snackbar(
                  'Berhasil',
                  'Berhasil Pindah ke Football Players',
                  snackPosition: SnackPosition.TOP,
                  backgroundColor: Colors.black87,
                  colorText: Colors.white,
                  margin: const EdgeInsets.all(10),
                  duration: const Duration(seconds: 2),
                  borderRadius: 12,
                );

                // Navigasi ke halaman daftar pemain
                Get.toNamed('/playerList', arguments: {
                  'fromCalculator': true,
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[700],
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              child: const Text(
                'Move to Football Players',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
