import 'package:kamino_app/utils/constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyLineChart extends StatefulWidget {
  const MyLineChart({Key? key}) : super(key: key);

  @override
  State<MyLineChart> createState() => _MyLineChartState();
}

class _MyLineChartState extends State<MyLineChart> {
  final List<double> data = [32, 87, 45, 34, 87, 34, 54];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: blackColor.withOpacity(0.1),
        ),
      ),
      height: 250,
      margin: const EdgeInsets.only(top: 8),
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
        child: LineChart(mainData()),
      ),
    );
  }

  String getDayName(int day) {
    final now = DateTime.now();
    final formatter = DateFormat('E');
    String formatted = formatter.format(now.add(Duration(days: day)));
    return formatted;
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) =>
            FlLine(color: orangeYellowColor, strokeWidth: 0.5),
        horizontalInterval: 10,
        getDrawingVerticalLine: (value) =>
            FlLine(color: orangeYellowColor, strokeWidth: 0.5),
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 10,
          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                return getDayName(value.toInt());
              case 1:
                return getDayName(value.toInt());
              case 2:
                return getDayName(value.toInt());
              case 3:
                return getDayName(value.toInt());
              case 4:
                return getDayName(value.toInt());
              case 5:
                return getDayName(value.toInt());
              case 6:
                return getDayName(value.toInt());
            }
            return '';
          },
          margin: 8,
        ),
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        leftTitles: SideTitles(
          showTitles: true,
          getTitles: (value) {
            return '${value.toInt()}';
          },
          reservedSize: 26,
          margin: 12,
        ),
      ),
      borderData: FlBorderData(show: false),
      lineBarsData: [
        LineChartBarData(
          spots: List.generate(
            data.length,
            (index) => FlSpot(index.toDouble(), data[index]),
          ),
          isCurved: true,
          colors: [yellowColor, orangeYellowColor],
        ),
      ],
    );
  }
}
