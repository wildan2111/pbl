import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pblsemester5/halaman/halamanDaftar.dart';
import 'package:pblsemester5/halaman/halamanLogin.dart';
import 'package:pblsemester5/utils/warna.dart';
import 'package:pblsemester5/widget/tombol/tombolPendek.dart';

class awalScreen extends StatefulWidget {
  const awalScreen({super.key});

  @override
  State<awalScreen> createState() => _awalScreenState();
}

class _awalScreenState extends State<awalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Warna().PutihBackground,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
                child: SizedBox(
                  height: 260,
                  width: 260,
                  child: Image.asset(
                    'assets/logo/gambar_logo_awal-removebg-preview.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/background/background_halaman_awal.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                  child: Center(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        Text(
                          'Selamat Datang Di Gentengku',
                          style: GoogleFonts.poppins(
                            color: Warna().PutihHuruf,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Aplikasi terpercaya untuk berbagai kebutuhan genteng anda',
                          style: GoogleFonts.poppins(
                            color: Warna().PutihHuruf,
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        tombolPendek(
                          tekan: const HalamanLogin(),
                          textTombol: 'Login',
                          warnaText: Warna().BiruHuruf,
                          warnaTombol: Warna().PutihTombol,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        tombolPendek(
                          tekan: const halamanDaftar(),
                          textTombol: 'Daftar',
                          warnaText: Warna().PutihHuruf,
                          warnaTombol: Warna().BiruTombol,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
