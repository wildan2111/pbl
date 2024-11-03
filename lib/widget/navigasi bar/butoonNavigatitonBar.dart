import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pblsemester5/halaman/halamanDashboard.dart';
import 'package:pblsemester5/halaman/halamanPesanan.dart';
import 'package:pblsemester5/halaman/profile/halamanProfile.dart';
import 'package:pblsemester5/utils/warna.dart';

class ButtonNavigationBar extends StatefulWidget {
  const ButtonNavigationBar({super.key});

  @override
  State<ButtonNavigationBar> createState() => _ButtonNavigationBarState();
}

class _ButtonNavigationBarState extends State<ButtonNavigationBar> {
  int _memilihIndex = 0;
  final _halaman = [
    const HalamanDashboard(),
    const HalamanPesanan(),
    const HalamanProfile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Warna().Putih,
      body: _halaman[_memilihIndex],
      bottomNavigationBar: ClipRRect(
        child: Container(
          height: 80,
          decoration: BoxDecoration(
            color: Warna().Putih,
          ),
          child: BottomNavigationBar(
            backgroundColor: Warna().Putih,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Warna().BiruTombol,
            unselectedItemColor: Warna().AbuHuruf,
            selectedLabelStyle: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
            ),
            currentIndex: _memilihIndex,
            onTap: _onItemOnTapped,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.archive_rounded),
                label: 'pesanan',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'profile',
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onItemOnTapped(int index) {
    setState(() {
      _memilihIndex = index;
    });
  }
}
