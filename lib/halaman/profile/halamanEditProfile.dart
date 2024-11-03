// lib/pages/HalamanEditProfile.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pblsemester5/utils/warna.dart';
import 'package:pblsemester5/widget/tombol/tombolPendek2.dart';
import '../../models/user_model.dart';
import '../../service/user_service.dart';

class HalamanEditProfile extends StatefulWidget {
  const HalamanEditProfile({super.key});

  @override
  State<HalamanEditProfile> createState() => _HalamanEditProfileState();
}

class _HalamanEditProfileState extends State<HalamanEditProfile> {
  UserModel? userModel;
  TextEditingController namaController = TextEditingController();
  TextEditingController noTelponController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    UserService userService = UserService();
    userModel = await userService.fetchUserProfile();
    if (userModel != null) {
      setState(() {
        namaController.text = userModel!.nama;
        noTelponController.text = userModel!.noTelpon;
        emailController.text = userModel!.email;
        alamatController.text = userModel!.alamat;
        // Jika password juga ingin dimuat
        passwordController.text = userModel!.password;
      });
    }
  }

  Future<void> _saveProfile() async {
    if (userModel != null) {
      userModel!.nama = namaController.text;
      userModel!.noTelpon = noTelponController.text;
      userModel!.email = emailController.text;
      userModel!.alamat = alamatController.text;
      userModel!.password = passwordController.text; // Tambahkan jika ingin memperbarui password

      UserService userService = UserService();
      bool success = await userService.updateUserProfile(userModel!);
      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Profile updated successfully')),
        );
        Navigator.of(context).pop();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to update profile')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (userModel == null) {
      return const Center(child: CircularProgressIndicator());
    }

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
          'Edit Profile',
          style: GoogleFonts.poppins(
            color: Warna().HitamHuruf,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
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
              padding: const EdgeInsets.fromLTRB(25, 50, 25, 8),
              child: Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        width: 120,
                        height: 120,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: const Image(image: AssetImage('assets/sempel/download(1).jpeg')),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Warna().BiruTombol,
                          ),
                          child: Icon(
                            Icons.edit,
                            color: Warna().Putih,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Form(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: namaController,
                            decoration: const InputDecoration(labelText: 'Nama'),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: noTelponController,
                            decoration: const InputDecoration(labelText: 'No.Telpon'),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: emailController,
                            decoration: const InputDecoration(labelText: 'Email'),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: passwordController,
                            obscureText: true,
                            decoration: const InputDecoration(labelText: 'Password'),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: alamatController,
                            decoration: const InputDecoration(labelText: 'Alamat'),
                          ),
                          const SizedBox(height: 30),
                          tombolPendek2(
                            warnaTombol: Warna().BiruTombol,
                            warnaText: Warna().PutihHuruf,
                            tekan: _saveProfile,
                            textTombol: 'Simpan',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
