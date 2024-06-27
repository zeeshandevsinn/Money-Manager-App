import 'package:kamino_app/utils/constants.dart';
import 'package:kamino_app/utils/k_images.dart';
import 'package:kamino_app/widgets/budget_limit_item_view.dart';
import 'package:kamino_app/widgets/my_line_chart.dart';
import 'package:kamino_app/widgets/transaction_card_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ManageLimitScreen extends StatefulWidget {
  const ManageLimitScreen({Key? key}) : super(key: key);

  @override
  State<ManageLimitScreen> createState() => _ManageLimitScreenState();
}

class _ManageLimitScreenState extends State<ManageLimitScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(12),
            child: SvgPicture.asset('assets/icons/edit.svg', color: blackColor),
          ),
          const SizedBox(width: 10),
          Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(12),
            child: const Icon(Icons.calendar_today, color: blackColor),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView(
          children: [
            const Text(
              'Monthly limit',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: blackColor,
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              'Data overview',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: blackColor,
              ),
            ),
            const SizedBox(height: 16),
            const MyLineChart(),
            const SizedBox(height: 24),
            const BudgetLimitItemView(
              icon: 'assets/images/mango_icon.png',
              text: '\$1,250',
              incomeText: '\$540 used',
              budgetText: '\$1240 Left',
              percentage: .5,
              percentageColor: purpleColor,
              isDetails: true,
            ),
            const SizedBox(height: 24),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: const [
                  ManageLimitContainer(
                    gradientColors: [
                      lightBlueColor,
                      darkBlueColor,
                    ],
                    text: 'Diamond bank',
                  ),
                  SizedBox(width: 15),
                  ManageLimitContainer(
                    gradientColors: [
                      purpleColor,
                      deepBlueColor,
                    ],
                    text: 'Reset All months',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Transaction list',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: blackColor,
              ),
            ),
            const SizedBox(height: 24),
            _transactionCard(Kimages.trendingDown, "Food & Drink",
                "02.00 pm, 19 Jun 2021", "-\$23"),
            _transactionCard(Kimages.trendingDown, "Food & Drink",
                "02.00 pm, 19 Jun 2021", "-\$23"),
            _transactionCard(Kimages.trendingDown, "Food & Drink",
                "02.00 pm, 19 Jun 2021", "-\$23"),
            _transactionCard(Kimages.trendingDown, "Food & Drink",
                "02.00 pm, 19 Jun 2021", "-\$23"),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  _transactionCard(String image, String title, String subTitle, String price) {
    return TransactionCardItem(
      subTitle: subTitle,
      price: price,
      image: image,
      title: title,
    );
  }
}

class ManageLimitContainer extends StatelessWidget {
  const ManageLimitContainer({
    Key? key,
    required this.gradientColors,
    required this.text,
  }) : super(key: key);

  final List<Color> gradientColors;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(36),
      ),
      padding: const EdgeInsets.all(14),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: gradientColors,
              ),
            ),
            padding: const EdgeInsets.all(14),
            margin: const EdgeInsets.only(right: 8),
            child: Center(
              child: SvgPicture.asset(
                'assets/icons/trending-up.svg',
              ),
            ),
          ),
          Text(
            text,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: blackColor,
            ),
          ),
        ],
      ),
    );
  }
}
