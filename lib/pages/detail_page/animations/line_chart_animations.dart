import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartWidget extends StatelessWidget {
  final List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

   LineChartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => LineChart(
    LineChartData(

      minY: 0,
      maxY: 6,
      titlesData:FlTitlesData(
       leftTitles: AxisTitles(axisNameWidget: const Text("Change"),axisNameSize: 25),
        topTitles: AxisTitles(axisNameWidget: const Text("Year"),axisNameSize: 25)
      ),
      gridData: FlGridData(
        show: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),

      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d), width: 1),
      ),
      lineBarsData: [
        LineChartBarData(
          spots: [
             FlSpot(Random().nextInt(5).toDouble(), 3),
            FlSpot(Random().nextInt(5).toDouble(), 1),
            FlSpot(Random().nextInt(5).toDouble(), 2),
            FlSpot(Random().nextInt(5).toDouble(), 5),

          ],
          isCurved: true,
          barWidth: 5,
          // dotData: FlDotData(show: false),
          belowBarData: BarAreaData(
            show: true,

          ),
        ),
      ],
    ),
  );
}






