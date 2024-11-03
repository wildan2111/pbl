import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pblsemester5/utils/warna.dart';

class form extends StatelessWidget {
  const form({super.key, this.namaForm, this.initialValue});

  final String? namaForm;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          namaForm!,
          style: GoogleFonts.poppins(
            color: Warna().AbuHuruf,
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          initialValue: initialValue, // Gunakan initialValue di sini
          decoration: InputDecoration(
            filled: true,
            fillColor: Warna().AbuForm,
            border: const UnderlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
