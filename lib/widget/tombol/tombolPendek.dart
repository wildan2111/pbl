import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class tombolPendek extends StatelessWidget {
  const tombolPendek(
      {super.key,
      this.tekan,
      this.textTombol,
      this.warnaText,
      this.warnaTombol});

  final String? textTombol;
  final Widget? tekan;
  final Color? warnaTombol;
  final Color? warnaText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (e) => tekan!,
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: warnaTombol!,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Center(
          child: Text(
            textTombol!,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: warnaText!,
            ),
          ),
        ),
      ),
    );
  }
}
