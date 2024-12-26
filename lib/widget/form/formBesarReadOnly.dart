import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pblsemester5/utils/warna.dart';

class FormBesarReadOnly extends StatelessWidget {
  const FormBesarReadOnly({super.key, this.namaForm, this.value});

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
          height: 150, // Tinggi tetap
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Warna().AbuForm,
              borderRadius: BorderRadius.circular(8),
            ),
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Text(
                value!,
                style: GoogleFonts.poppins(
                  color: Warna().HitamHuruf,
                  fontSize: 12,
                ),
                softWrap: true, // Membuat teks menyesuaikan lebar form
              ),
            ),
          ),
        ),
      ],
    );
  }
}
