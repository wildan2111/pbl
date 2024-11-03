
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pblsemester5/utils/warna.dart';
import 'package:pblsemester5/widget/form/form.dart';
import 'package:pblsemester5/widget/form/formBesar.dart';
import 'package:pblsemester5/widget/ringkasan/ringkasanProduk.dart';

class HalamanPemesananProduk extends StatefulWidget {
  const HalamanPemesananProduk({super.key});

  @override
  State<HalamanPemesananProduk> createState() => _HalamanPemesananProdukState();
}

class _HalamanPemesananProdukState extends State<HalamanPemesananProduk> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Warna().PutihBackground,
      appBar: AppBar(
        backgroundColor: Warna().Putih,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios_sharp),
        ),
        title: Text(
          'Pemesanan',
          style: GoogleFonts.poppins(
            color: Warna().HitamHuruf,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Warna().Putih,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 25, 15, 25),
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          'Masukkan data \npemesanan dibawah',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            color: Warna().AbuHuruf,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        const form(
                          namaForm: 'Nama Penerima',
                        ),
                        const SizedBox(
                          height: 9,
                        ),
                        const FormBesar(
                          namaForm: 'Alamat',
                        ),
                        const SizedBox(
                          height: 9,
                        ),
                        const RingkasanProduk(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
