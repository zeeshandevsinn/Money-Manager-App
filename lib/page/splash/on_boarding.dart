import 'package:kamino_app/utils/constants.dart';
import 'package:kamino_app/utils/k_dimensions.dart';
import 'package:kamino_app/utils/k_strings.dart';
import 'package:flutter/material.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({
    Key? key,
    required this.image,
    required this.text,
  }) : super(key: key);

  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image),
        const SizedBox(height: Kdimensions.paddingSizeExtraLarge + 16),
        Text(
          text,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline5!.copyWith(
                color: blackColor,
                fontWeight: FontWeight.w800,
                fontSize: 28,
              ),
        ),
        const SizedBox(height: Kdimensions.paddingSizeLarge),
        Text(
          Kstrings.onBoardingTextCaption,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                color: captionColor,
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
        ),
      ],
    );
  }
}
