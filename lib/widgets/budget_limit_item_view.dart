import 'package:kamino_app/page/routes.dart';
import 'package:kamino_app/utils/constants.dart';
import 'package:flutter/material.dart';

class BudgetLimitItemView extends StatelessWidget {
  const BudgetLimitItemView({
    Key? key,
    required this.icon,
    required this.text,
    required this.incomeText,
    required this.budgetText,
    required this.percentage,
    required this.percentageColor,
    this.isDetails = false,
  }) : super(key: key);

  final String icon;
  final String text;
  final String incomeText;
  final String budgetText;
  final double percentage;
  final Color percentageColor;
  final bool isDetails;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.manageLimit);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Row(
          children: [
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(12),
              child: Image.asset(icon),
              margin: const EdgeInsets.only(right: 20),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        text,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: blackColor,
                        ),
                      ),
                      if (!isDetails) const Icon(Icons.more_horiz),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        incomeText,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: blackColor.withOpacity(0.7),
                        ),
                      ),
                      Text(
                        budgetText,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: blackColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: LinearProgressIndicator(
                      value: percentage,
                      backgroundColor: Colors.grey.withOpacity(0.4),
                      valueColor:
                          AlwaysStoppedAnimation<Color>(percentageColor),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
