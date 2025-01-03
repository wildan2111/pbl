import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pblsemester5/utils/warna.dart';
import 'package:pblsemester5/widget/form/formReadOnly.dart'; // Import form read-only
import 'package:pblsemester5/widget/form/formBesarReadOnly.dart'; // Import form besar read-only
import 'package:pblsemester5/widget/tombol/tombolPendek2.dart';
import '../../models/user_model.dart';
import '../../service/user_service.dart';
import 'halamanEditProfile.dart'; // Import halaman edit profile

class HalamanProfile extends StatefulWidget {
  const HalamanProfile({super.key});

  @override
  State<HalamanProfile> createState() => _HalamanProfileState();
}

class _HalamanProfileState extends State<HalamanProfile> {
  UserModel? userModel;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    UserService userService = UserService();
    userModel = await userService.fetchUserProfile();
    setState(() {
      isLoading = false;
    });
  }

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
          'Profile',
          style: GoogleFonts.poppins(
            color: Warna().HitamHuruf,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : userModel == null
              ? const Center(child: Text("Gagal memuat data profil."))
              : SingleChildScrollView(
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
                                    child: Image.asset(
                                        'assets/sempel/download(1).jpeg'),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 30),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(30, 30, 30, 30),
                              child: Column(
                                children: [
                                  formReadOnly(
                                    namaForm: 'Nama',
                                    value: userModel?.nama ?? '',
                                  ),
                                  const SizedBox(height: 10),
                                  formReadOnly(
                                    namaForm: 'No.Telpon',
                                    value: userModel?.noTelpon ?? '',
                                  ),
                                  const SizedBox(height: 10),
                                  formReadOnly(
                                    namaForm: 'Email',
                                    value: userModel?.email ?? '',
                                  ),
                                  // const SizedBox(height: 10),
                                  // formReadOnly(
                                  //   namaForm: 'Password',
                                  //   value: '********',
                                  // ),
                                  const SizedBox(height: 10),
                                  FormBesarReadOnly(
                                    namaForm: 'Alamat',
                                    value: userModel?.alamat ?? '',
                                  ),
                                  const SizedBox(height: 30),
                                  tombolPendek2(
                                    warnaTombol: Warna().BiruTombol,
                                    warnaText: Warna().PutihHuruf,
                                    tekan: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const HalamanEditProfile(),
                                        ),
                                      );
                                    },
                                    textTombol: 'Edit Profile', // Tombol untuk edit
                                  ),
                                ],
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
