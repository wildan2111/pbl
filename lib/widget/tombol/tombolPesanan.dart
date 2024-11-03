import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TombolPesanan extends StatelessWidget {
  const TombolPesanan({
    super.key,
    this.tekan,
    this.textTombol,
    this.warnaText,
    this.warnaTombol,
    this.icon,
  });

  final String? textTombol;
  final Widget? tekan;
  final Color? warnaTombol;
  final Color? warnaText;
  final IconData? icon;

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
        padding: const EdgeInsets.all(0),
        decoration: BoxDecoration(
          border: Border.all(color: warnaText!, width: 2.0),
          color: warnaTombol!,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null)
                Icon(
                  icon,
                  color: warnaText!,
                  size: 14,
                ),
              if (icon != null)
                const SizedBox(
                  width: 8,
                ),
              Text(
                textTombol!,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: warnaText!,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
