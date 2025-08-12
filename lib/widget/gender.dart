import 'package:flutter/material.dart';

class GenderDropdown extends StatelessWidget {
  final String? selectedGender;
  final Function(String?) onChanged;

  const GenderDropdown({
    super.key,
    required this.selectedGender,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        hintText: 'Pilih Jenis Kelamin',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      ),
      value: selectedGender,
      items: [
        DropdownMenuItem(value: "Laki-laki", child: Text("Laki-laki")),
        DropdownMenuItem(value: "Perempuan", child: Text("Perempuan")),
      ],
      onChanged: onChanged,
    );
  }
}
