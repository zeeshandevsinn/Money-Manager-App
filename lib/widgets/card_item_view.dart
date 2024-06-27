import 'package:kamino_app/utils/constants.dart';
import 'package:kamino_app/utils/k_images.dart';
import 'package:flutter/material.dart';

class CardItemView extends StatelessWidget {
  const CardItemView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            purpleColor,
            deepBlueColor,
          ],
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 27, horizontal: 24),
      margin: const EdgeInsets.only(top: 16, bottom: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Current Balance',
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Colors.white54,
                        ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '\$5,750,20',
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: 28,
                        ),
                  ),
                ],
              ),
              Image.asset(Kimages.masterCardLogo),
            ],
          ),
          const SizedBox(height: 70),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '5282 3456 7890 1281',
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Colors.white.withOpacity(0.9),
                    ),
              ),
              Text(
                '09/25',
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
