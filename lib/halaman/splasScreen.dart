import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pblsemester5/halaman/awalScreen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 200),
      () {
        Get.to(const awalScreen());
      },
    );

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/background/background splash.png',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Image.asset('assets/logo/logo gentengku 1.png'),
        ),
      ),
    );
  }
}
