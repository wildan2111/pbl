import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pblsemester5/utils/warna.dart';

class formReadOnly extends StatelessWidget {
  const formReadOnly({super.key, this.namaForm, this.value});

  final String? namaForm;
  final String? value;

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
        const SizedBox(height: 8),
        SizedBox(
          width: 600,
          height: 50, // Tinggi tetap
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Warna().AbuForm,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                value!,
                style: GoogleFonts.poppins(
                  color: Warna().HitamHuruf,
                  fontSize: 12,
                ),
                softWrap: true, // Teks otomatis turun jika melebihi panjang
              ),
            ),
          ),
        ),
      ],
    );
  }
}
