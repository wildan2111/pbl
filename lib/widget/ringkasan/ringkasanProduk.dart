import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pblsemester5/utils/warna.dart';

class RingkasanProduk extends StatelessWidget {
  const RingkasanProduk(
      {super.key,
      this.Deskripsi,
      this.gambarGenteng,
      this.hargaGenteng,
      this.namaGenteng});

  final String? gambarGenteng;
  final String? namaGenteng;
  final int? hargaGenteng;
  final Text? Deskripsi;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Produk Genteng yang ingin dibeli',
            style: GoogleFonts.poppins(
              color: Warna().AbuHuruf,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Warna().AbuForm,
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: Row(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Warna().BiruTombol,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 10, 8, 0),
                      child: Text(
                        'Nama Genteng',
                        style: GoogleFonts.poppins(
                          color: Warna().HitamHuruf,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 3, 8, 8),
                      child: Text(
                        'Rp. 2.500 / biji',
                        style: GoogleFonts.poppins(
                          color: Warna().AbuHuruf,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
