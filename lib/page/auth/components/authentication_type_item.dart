import 'package:kamino_app/utils/constants.dart';
import 'package:flutter/material.dart';

class AuthenticationTypeItem extends StatelessWidget {
  const AuthenticationTypeItem({
    Key? key,
    required this.text,
    required this.isActive,
    required this.onTap,
  }) : super(key: key);

  final String text;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding:
            const EdgeInsets.only(top: 16, bottom: 16, left: 50, right: 35),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          gradient: isActive
              ? const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    yellowColor,
                    orangeYellowColor,
                  ],
                )
              : null,
        ),
        child: Center(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: isActive ? Colors.white : blackColor,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
      ),
    );
  }
}
