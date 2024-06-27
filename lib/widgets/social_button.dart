import 'package:kamino_app/utils/constants.dart';
import 'package:kamino_app/utils/k_dimensions.dart';
import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    Key? key,
    required this.onPress,
    required this.icon,
    required this.text,
  }) : super(key: key);

  final VoidCallback onPress;
  final String icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: greyColor,
      ),
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          minimumSize: const Size(double.infinity, 50),
          primary: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(icon),
              const SizedBox(width: Kdimensions.paddingSizeSmall + 4),
              Text(
                text,
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
