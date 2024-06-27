import 'package:kamino_app/utils/constants.dart';
import 'package:kamino_app/widgets/custom_manage_appbar.dart';
import 'package:kamino_app/widgets/my_line_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const CustomManageAppBar()),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      const Text(
                        "Report",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w700),
                      ),
                      const Spacer(),
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
                Row(
                  children: const [
                    Expanded(
                      child: ReportInfoItem(
                        gradientColors: [
                          lightBlueColor,
                          darkBlueColor,
                        ],
                        text: 'Beginning',
                        price: '+ \$4,302',
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: ReportInfoItem(
                        gradientColors: [
                          yellowColor,
                          orangeYellowColor,
                        ],
                        text: 'Current',
                        price: '- \$4,302',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const MyLineChart(),
                const SizedBox(height: 20),
                const Text(
                  'Transaction list',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: blackColor,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(36),
                  ),
                  padding: const EdgeInsets.all(14),
                  child: Row(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              yellowColor,
                              orangeYellowColor,
                            ],
                          ),
                        ),
                        padding: const EdgeInsets.all(14),
                        margin: const EdgeInsets.only(right: 8),
                        child: Center(
                          child: SvgPicture.asset(
                            'assets/icons/trending-down.svg',
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Text(
                              'Net income',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: blackColor,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              '\$6,000',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: blackColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.more_horiz, color: blackColor),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ReportInfoItem extends StatelessWidget {
  const ReportInfoItem({
    Key? key,
    required this.gradientColors,
    required this.text,
    required this.price,
  }) : super(key: key);

  final List<Color> gradientColors;
  final String text;
  final String price;

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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                text,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: blackColor,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                price,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: blackColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
