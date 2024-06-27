import 'package:kamino_app/utils/constants.dart';
import 'package:kamino_app/utils/k_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CreditCardItem extends StatelessWidget {
  const CreditCardItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Container(
              height: 190,
              width: size.width / 2.5,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      offset: const Offset(0.0, 1.0), //(x,y)
                      blurRadius: 1.0,
                    ),
                  ],
                  gradient: LinearGradient(
                    colors: redGrediantColor,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: const [
                      CircleAvatar(radius: 14, backgroundColor: Colors.white38),
                      Positioned(
                        left: 16,
                        child: CircleAvatar(
                            radius: 14, backgroundColor: Colors.white38),
                      )
                    ],
                  ),
                  const SizedBox(height: 25),
                  Text(
                    'Credit Card',
                    style: GoogleFonts.nunito(
                        color: Colors.white.withOpacity(0.5),
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        '....',
                        style: GoogleFonts.nunito(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '2468',
                        style: GoogleFonts.nunito(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(Kimages.simIcon),
                      Text(
                        '11/24',
                        style: GoogleFonts.nunito(
                            color: Colors.white,
                            fontSize: 11,
                            height: 1.5454,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Positioned(
              right: -170,
              top: -120,
              child: CircleAvatar(
                radius: 120,
                backgroundColor: const Color(0xff0D1636).withOpacity(0.1),
              ),
            ),
            Positioned(
              left: -170,
              bottom: -120,
              child: CircleAvatar(
                radius: 120,
                backgroundColor: const Color(0xff0D1636).withOpacity(0.1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
