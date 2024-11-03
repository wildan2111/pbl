import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pblsemester5/halaman/halamanChat.dart';
import 'package:pblsemester5/halaman/halamanPemesananProduk.dart';
import 'package:pblsemester5/utils/warna.dart';
import 'package:pblsemester5/widget/tombol/tombolPesanan.dart';
import 'package:readmore/readmore.dart';

class HalamanDetaiProduk extends StatefulWidget {
  const HalamanDetaiProduk({super.key});

  @override
  State<HalamanDetaiProduk> createState() => _HalamanDetaiProdukState();
}

class _HalamanDetaiProdukState extends State<HalamanDetaiProduk> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Warna().PutihBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Warna().BiruBackground,
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 8,
                      left: 8,
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.arrow_back_ios_sharp),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 8, 8, 0),
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Warna().BiruBackground,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 8, 8, 0),
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Warna().BiruBackground,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 8, 8, 0),
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Warna().BiruBackground,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 8, 8, 0),
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Warna().BiruBackground,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 20, 0, 0),
                child: Text(
                  'Atap',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: Warna().BiruHuruf,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                child: Text(
                  'Nama Genteng',
                  style: GoogleFonts.poppins(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Warna().HitamHuruf,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                child: Text(
                  'Rp.2.500 / biji',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Warna().MerahHuruf,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 5, 0, 0),
                child: Container(
                  height: 20,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Warna().HitamHuruf,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 30, 0, 0),
                child: Text(
                  'Deskripsi',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Warna().HitamHuruf,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: ReadMoreText(
                  'Atap genteng adalah material penutup atap yang terbuat dari tanah liat, beton, atau keramik yang dibentuk menjadi lembaran-lembaran kecil dengan berbagai ukuran dan desain. Genteng menawarkan keunggulan dalam hal ketahanan terhadap cuaca, daya tahan yang panjang, dan kemampuan untuk mempertahankan suhu interior bangunan tetap sejuk. Warna dan bentuk genteng yang bervariasi memungkinkan fleksibilitas desain, sehingga cocok untuk berbagai gaya arsitektur. Selain itu, pemasangan atap genteng juga relatif mudah dan memerlukan perawatan minimal, menjadikannya pilihan populer bagi banyak pemilik rumah dan bangunan komersial.',
                  trimLines: 5,
                  colorClickableText: Warna().BiruHuruf,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: '...Baca Selengkapnya',
                  trimExpandedText: 'Kecilkan',
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.poppins(
                    color: Warna().HitamHuruf,
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    height: 1.5,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 30, 0, 0),
                child: Text(
                  'Spesifikasi Lainnya',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Warna().HitamHuruf,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                child: Text(
                  'Stok Genteng   : 10.000 bijin \nMinimal Pembelian    : 1000 biji',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: Warna().HitamHuruf,
                    height: 1.5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Warna().Putih,
        shape: const CircularNotchedRectangle(),
        notchMargin: 6.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TombolPesanan(
                  textTombol: 'Chat',
                  warnaTombol: Warna().PutihTombol,
                  warnaText: Warna().AbuHuruf,
                  icon: Icons.message,
                  tekan: const HalamanChat(),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TombolPesanan(
                  textTombol: 'Pesan Sekarang',
                  warnaTombol: Warna().BiruTombol,
                  warnaText: Warna().PutihHuruf,
                  icon: Icons.add_shopping_cart_rounded,
                  tekan: const HalamanPemesananProduk(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
