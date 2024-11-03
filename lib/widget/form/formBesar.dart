import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pblsemester5/utils/warna.dart';

class FormBesar extends StatelessWidget {
  const FormBesar({super.key, this.namaForm, this.initialValue});

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
        SizedBox(
          height: 150, // Tinggi tetap untuk TextFormField
          child: TextFormField(
            initialValue: initialValue, // Gunakan initialValue di sini
            maxLines: null, // Agar teks dapat memanjang
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              filled: true,
              fillColor: Warna().AbuForm,
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ),
              border: const UnderlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
            ),
            textAlignVertical: TextAlignVertical.top,
            expands: true, // Memungkinkan field untuk mengisi ruang vertikal yang diberikan
            scrollPhysics: const BouncingScrollPhysics(), // Menambahkan efek gulir
          ),
        ),
      ],
    );
  }
}
