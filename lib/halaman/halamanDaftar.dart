import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pblsemester5/halaman/halamanLogin.dart';
import 'package:pblsemester5/utils/warna.dart';
import 'package:pblsemester5/widget/form/form.dart';
import 'package:pblsemester5/widget/tombol/tombolPendek2.dart';

class halamanDaftar extends StatefulWidget {
  const halamanDaftar({super.key});

  @override
  State<halamanDaftar> createState() => _halamanDaftarState();
}

class _halamanDaftarState extends State<halamanDaftar> {
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
            icon: const Icon(Icons.arrow_back_ios_sharp)),
        title: Text(
          'Daftar',
          style: GoogleFonts.poppins(
            color: Warna().HitamHuruf,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                  color: Warna().Putih,
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Daftarkan diri anda dengan memasukkan Nomor Telepon dan Password yang ingin anda buat',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            color: Warna().AbuHuruf,
                            fontSize: 10),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const form(
                        namaForm: 'No.Telpon',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const form(
                        namaForm: 'Password',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const form(
                        namaForm: 'Ulangi Password',
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      tombolPendek2(
                        warnaTombol: Warna().BiruTombol,
                        warnaText: Warna().PutihHuruf,
                        tekan: () { 
                          Navigator.push(
                           context,
                           MaterialPageRoute(builder: (context) => const HalamanLogin()),
                         );
                        },
                        textTombol: 'Daftarkan',
                      )
                    ],
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
