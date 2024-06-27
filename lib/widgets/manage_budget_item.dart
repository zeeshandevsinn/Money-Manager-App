import 'package:flutter/material.dart';

class ManageBudgetItem extends StatelessWidget {
  const ManageBudgetItem({
    Key? key,
    required this.backgroundGradientColor,
    required this.circleColor,
    required this.icon,
    required this.text,
    required this.textColor,
  }) : super(key: key);

  final List<Color> backgroundGradientColor;
  final Color circleColor;
  final Widget icon;
  final String text;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: backgroundGradientColor,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(40),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      margin: const EdgeInsets.only(right: 12),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: circleColor,
            ),
            padding: const EdgeInsets.all(6),
            child: icon,
            margin: const EdgeInsets.only(right: 12),
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  fontWeight: FontWeight.w700,
                  color: textColor,
                ),
          ),
        ],
      ),
    );
  }
}
