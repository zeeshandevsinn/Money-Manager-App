import 'package:kamino_app/utils/constants.dart';
import 'package:kamino_app/utils/k_dimensions.dart';
import 'package:flutter/material.dart';

class OnBoardingButton extends StatelessWidget {
  const OnBoardingButton({
    Key? key,
    this.maximumSize,
    required this.text,
    this.gradiantColor = blueGrediantColor,
    required this.onPressed,
    this.isIconShow = true,
  }) : super(key: key);

  final VoidCallback onPressed;
  final List<Color> gradiantColor;
  final String text;
  final Size? maximumSize;
  final bool isIconShow;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            lightBlueColor,
            darkBlueColor,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff207CFE).withOpacity(0.3),
            offset: const Offset(0.0, 15.0),
            blurRadius: 35.0,
          ),
        ],
        borderRadius: BorderRadius.circular(50),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          minimumSize: const Size(double.infinity, 50),
          maximumSize: maximumSize,
          primary: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text,
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 18,
                  ),
            ),
            const SizedBox(
              width: 12,
            ),
            if (isIconShow) const Icon(Icons.arrow_forward),
          ],
        ),
      ),
    );
  }
}
