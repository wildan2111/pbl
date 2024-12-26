import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pblsemester5/halaman/profile/halamanProfile.dart';
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
  bool _isLoading = false;

  // Simpan token dan data pengguna setelah login berhasil
  Future<void> saveUserData(String token, String namaPengguna) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    await prefs.setString('namaPengguna', namaPengguna);
  }

  // Login ke API
  Future<void> loginUser() async {
    if (!RegExp(r'^[0-9]{10,15}$').hasMatch(phoneController.text)) {
      _showErrorDialog('Nomor telepon tidak valid.');
      return;
    }
    if (passwordController.text.isEmpty || passwordController.text.length < 8) {
      _showErrorDialog('Password minimal 8 karakter.');
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final response = await http
          .post(
            Uri.parse('http://127.0.0.1:8000/api/login'),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({
              'noTelpon': phoneController.text.trim(),
              'password': passwordController.text.trim(),
            }),
          )
          .timeout(const Duration(seconds: 10), onTimeout: () {
        throw Exception('Request timeout. Silakan coba lagi.');
      });

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        await saveUserData(responseData['jwt-token'], responseData['user']['namaPengguna']);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HalamanProfile()),
        );
      } else {
        final errorData = jsonDecode(response.body);
        final errorMessage = errorData['error'] ?? 'Login gagal. Silakan coba lagi.';
        _showErrorDialog(errorMessage);
      }
    } catch (e) {
      _showErrorDialog(e.toString());
    } finally {
      setState(() {
        _isLoading = false;
      });
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
                    const SizedBox(height: 20),
                    _isLoading
                        ? const CircularProgressIndicator()
                        : tombolPendek2(
                            warnaTombol: Warna().BiruTombol,
                            warnaText: Warna().PutihHuruf,
                            tekan: () {
                              loginUser();
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
