import 'package:kamino_app/utils/constants.dart';
import 'package:kamino_app/widgets/budget_limit_item_view.dart';
import 'package:kamino_app/widgets/custom_manage_appbar.dart';
import 'package:kamino_app/widgets/manage_budget_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ManageAllScreen extends StatefulWidget {
  const ManageAllScreen({Key? key}) : super(key: key);

  @override
  State<ManageAllScreen> createState() => _ManageAllScreenState();
}

class _ManageAllScreenState extends State<ManageAllScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const CustomManageAppBar()),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    const Text(
                      "Manage",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                    ),
                    const Spacer(),
                    Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(12),
                      child: SvgPicture.asset('assets/icons/edit.svg'),
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
                      child: const Icon(Icons.calendar_today),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      const ManageBudgetItem(
                        backgroundGradientColor: blueGrediantColor,
                        circleColor: Colors.white,
                        icon: Icon(Icons.credit_card),
                        text: 'All Budget',
                        textColor: primaryColor,
                      ),
                      ManageBudgetItem(
                        backgroundGradientColor: [
                          Colors.grey.withOpacity(0.2),
                          Colors.grey.withOpacity(0.2),
                        ],
                        circleColor: purpleColor,
                        icon:
                            const Icon(Icons.credit_card, color: Colors.white),
                        text: 'Payment',
                        textColor: blackColor,
                      ),
                      const ManageBudgetItem(
                        backgroundGradientColor: [
                          yellowColor,
                          orangeYellowColor,
                        ],
                        circleColor: Colors.white,
                        icon: Icon(Icons.credit_card),
                        text: 'Budget',
                        textColor: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),
              _budgetView(yellowGrediantColor, "\$3,000"),
              _budgetView([purpleColor, deepBlueColor], "\$4,000"),
            ],
          ),
        ],
      ),
    );
  }

  _budgetView(List<Color> gradientColor, String money) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              Container(
                height: 42,
                width: 42,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: gradientColor),
                  borderRadius: BorderRadius.circular(21),
                ),
                child: const Icon(Icons.credit_card, color: Colors.white),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "3 Events",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
                  ),
                  SizedBox(height: 2),
                  Text(
                    "Budget",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                money,
                style:
                    const TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        const BudgetLimitItemView(
          icon: 'assets/images/mango_icon.png',
          text: 'Monthly limit',
          incomeText: '\$540 used',
          budgetText: '\$1240',
          percentage: .77,
          percentageColor: orangeYellowColor,
        ),
        const BudgetLimitItemView(
          icon: 'assets/images/mango_icon.png',
          text: 'Weekly limit',
          incomeText: '\$540 used',
          budgetText: '\$1240',
          percentage: .5,
          percentageColor: purpleColor,
        ),
        const BudgetLimitItemView(
          icon: 'assets/images/mango_icon.png',
          text: 'Daily limit',
          incomeText: '\$540 used',
          budgetText: '\$1240',
          percentage: .8,
          percentageColor: purpleColor,
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
