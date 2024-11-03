import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class tombolPendek2 extends StatelessWidget {
  const tombolPendek2({
    super.key,
    this.tekan,
    this.textTombol,
    this.warnaText,
    this.warnaTombol,
  });

  final String? textTombol;
  final VoidCallback? tekan;
  final Color? warnaTombol;
  final Color? warnaText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tekan,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: warnaTombol!,
            borderRadius: const BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: Center(
            child: Text(
              textTombol!,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: warnaText!,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
