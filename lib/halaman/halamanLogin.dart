import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pblsemester5/halaman/halamanDashboard.dart';
import 'package:pblsemester5/utils/warna.dart';
import 'package:pblsemester5/widget/tombol/tombolPendek2.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HalamanLogin extends StatefulWidget {
  const HalamanLogin({super.key});

  @override
  State<HalamanLogin> createState() => _HalamanLoginState();
}

class _HalamanLoginState extends State<HalamanLogin> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isPasswordHidden = true;

  // Simpan token setelah login berhasil
  Future<void> saveUserToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  // Login ke API
  Future<void> loginUser() async {
    try {
      final response = await http.post(
        Uri.parse('http://10.0.2.2:8000/api/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'noTelpon': phoneController.text,
          'password': passwordController.text,
        }),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        await saveUserToken(responseData['jwt-token']); // Simpan token
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HalamanDashboard()),
        );
      } else {
        _showErrorDialog('Login gagal. Periksa kembali kredensial Anda.');
      }
    } catch (e) {
      _showErrorDialog('Terjadi kesalahan saat melakukan login.');
    }
  }

  // Tampilkan dialog error
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Warna().PutihBackground,
      appBar: AppBar(
        backgroundColor: Warna().Putih,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios_sharp),
        ),
        title: Text(
          'Masuk',
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
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                color: Warna().Putih,
              ),
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Text(
                        'Masuk dengan Nomor Telpon dan Password yang telah terdaftar',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          color: Warna().AbuHuruf,
                          fontSize: 10,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      controller: phoneController,
                      decoration: const InputDecoration(
                        labelText: 'No. Telpon',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: passwordController,
                      obscureText: _isPasswordHidden,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: Icon(_isPasswordHidden
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _isPasswordHidden = !_isPasswordHidden;
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    tombolPendek2(
                      warnaTombol: Warna().BiruTombol,
                      warnaText: Warna().PutihHuruf,
                      tekan: () {
                        if (phoneController.text.isNotEmpty &&
                            passwordController.text.isNotEmpty) {
                          loginUser();
                        } else {
                          _showErrorDialog('Nomor telepon dan password harus diisi.');
                        }
                      },
                      textTombol: 'Masuk',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}