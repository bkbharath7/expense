import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class MyGraph extends StatelessWidget {
const  MyGraph({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LineChart(
          curve: Curves.decelerate,
          duration: const Duration(milliseconds: 100),
          LineChartData(
            borderData: FlBorderData(show: false),
            minX: 0,
            maxX: 11,
            minY: 0,
            maxY: 6,
            lineTouchData: const LineTouchData(enabled: true),
            titlesData:const FlTitlesData(
                show: false,
                bottomTitles: AxisTitles(drawBelowEverything: false)),
            gridData:const FlGridData(
              drawHorizontalLine: false,
              drawVerticalLine: false,
            ),
            lineBarsData: [
              // The red line
              LineChartBarData(
                  aboveBarData: BarAreaData(show: false),
                  belowBarData: BarAreaData(
                      show: true,
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromARGB(255, 218, 224, 247),
                          Color.fromARGB(255, 202, 220, 236),
                          Color.fromARGB(255, 239, 243, 247),
                          Colors.white
                        ],
                      )),
                  spots: [
                  const  FlSpot(0, 4),
                  const  FlSpot(1.5, 5),
                  const  FlSpot(2.5, 3),
                  const  FlSpot(3.5, 5.5),
                  const  FlSpot(4.9, 4),
                  const  FlSpot(6.8, 6),
                  const  FlSpot(8.8, 4),
                  const  FlSpot(13, 4)
                  ],
                  isCurved: true,
                  barWidth: 6,
                  color:const Color.fromARGB(255, 132, 3, 252),
                  dotData:const FlDotData(show: false)),
            ],
          ),
        ),
      ),
    );
  }
}
