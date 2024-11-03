import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pblsemester5/halaman/halamanLogin.dart';
import 'package:pblsemester5/utils/warna.dart';
import 'package:pblsemester5/widget/tombol/tombolPendek2.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class HalamanOtp extends StatefulWidget {
  const HalamanOtp({super.key});

  @override
  State<HalamanOtp> createState() => _HalamanOtpState();
}

class _HalamanOtpState extends State<HalamanOtp> {
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
          'Kode OTP',
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
                        'Masukkan Kode OTP yang telah kami kirimkan ke nomor yang telah anda daftarkan',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            color: Warna().AbuHuruf,
                            fontSize: 10),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: OTPTextField(
                          length: 5,
                          width: MediaQuery.of(context).size.width,
                          fieldWidth: 20,
                          style: const TextStyle(fontSize: 17),
                          textFieldAlignment: MainAxisAlignment.spaceAround,
                          fieldStyle: FieldStyle.underline,
                          onCompleted: (pin) {
                            print("Completed: $pin");
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      tombolPendek2(
                        warnaTombol: Warna().BiruTombol,
                        warnaText: Warna().PutihHuruf,
                        tekan: () { // Bungkus Navigator di dalam lambda
                          Navigator.push(
                           context,
                           MaterialPageRoute(builder: (context) => const HalamanLogin()),
                         );
                        },
                      textTombol: 'Konfirmasi',
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
