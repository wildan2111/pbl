import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pblsemester5/halaman/halamanDetailProduk.dart';
import 'package:pblsemester5/utils/warna.dart';

class ProdukPendek extends StatelessWidget {
  const ProdukPendek({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (e) => const HalamanDetaiProduk(),
          ),
        );
      },
      child: Container(
        height: 190,
        width: 160,
        decoration: BoxDecoration(
          color: Warna().Putih,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Image.asset(
                  'assets/background/background splash.png',
                  fit: BoxFit.cover,
                  height: 95,
                  width: 160,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
              child: Text(
                'Nama Genteng',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  color: Warna().HitamHuruf,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
              child: Text(
                'Nama Perusahaan',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 9,
                  color: Warna().BiruHuruf,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 10, 0, 0),
              child: Text(
                'Rp. 2.500 / biji',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                  color: Warna().MerahHuruf,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 10, 0, 0),
              child: Text(
                'Stok : 100000',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 9,
                  color: Warna().MerahHuruf,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
