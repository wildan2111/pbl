import 'package:flutter/material.dart';
import 'package:pblsemester5/utils/warna.dart';
import 'package:pblsemester5/widget/tombol/tombolPendek2.dart';

class CheckoutCard extends StatelessWidget {
  const CheckoutCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 20,
      ),
      // height: 174,
      decoration: BoxDecoration(
        color: Warna().PutihBackground,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: const Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row(
            //   children: [
            //     Container(
            //       padding: const EdgeInsets.all(10),
            //       height: 40,
            //       width: 40,
            //       decoration: BoxDecoration(
            //         color: const Color(0xFFF5F6F9),
            //         borderRadius: BorderRadius.circular(10),
            //       ),
            //       child: SvgPicture.asset("assets/icons/receipt.svg"),
            //     ),
            //     const Spacer(),
            //     const Text("Add voucher code"),
            //     const SizedBox(width: 8),
            //     Icon(
            //       Icons.arrow_forward_ios,
            //       size: 12,
            //       color: Warna().BiruHuruf,
            //     )
            //   ],
            // ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      text: "Total:\n",
                      children: [
                        TextSpan(
                          text: "RP337.15",
                          style: TextStyle(fontSize: 16, color: Warna().HitamHuruf,),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: tombolPendek2(
                        warnaTombol: Warna().BiruTombol,
                        warnaText: Warna().PutihHuruf,
                        textTombol: 'check out',
                      )
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
