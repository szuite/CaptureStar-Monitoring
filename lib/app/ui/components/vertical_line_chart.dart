import 'package:capturestarmonitoring/app/constants/constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class VerticalLineChart extends StatelessWidget {
  const VerticalLineChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LineChart(sampleData);
  }
}

LineChartData get sampleData => LineChartData(
      lineTouchData: lineTouchData,
      gridData: gridData,
      titlesData: titlesData,
      borderData: borderData,
      lineBarsData: lineBarsData,
      minX: 0,
      maxX: 14,
      maxY: 6,
      minY: 0,
    );

FlGridData get gridData => FlGridData(
      show: true,
      drawVerticalLine: false,
      drawHorizontalLine: true,
      getDrawingHorizontalLine: (value) {
        return FlLine(
          color: AppThemes.dividerColor,
          strokeWidth: 1,
        );
      },
    );

LineTouchData get lineTouchData => LineTouchData(
      enabled: false,
    );

FlTitlesData get titlesData => FlTitlesData(
      bottomTitles: bottomTitles,
      rightTitles: SideTitles(showTitles: false),
      topTitles: SideTitles(showTitles: false),
      leftTitles: leftTitles(
        getTitles: (value) {
          switch (value.toInt()) {
            case 1:
              return '1';
            case 2:
              return '2';
            case 3:
              return '3';
            case 4:
              return '4';
            case 5:
              return '5';
          }
          return '';
        },
      ),
    );

FlBorderData get borderData => FlBorderData(
      show: true,
      border: const Border(
        bottom: BorderSide(color: AppThemes.dividerColor, width: 1),
        left: BorderSide(color: Colors.transparent),
        right: BorderSide(color: Colors.transparent),
        top: BorderSide(color: Colors.transparent),
      ),
    );

SideTitles leftTitles({required GetTitleFunction getTitles}) => SideTitles(
      getTitles: getTitles,
      showTitles: true,
      margin: 8,
      interval: 1,
      reservedSize: 40,
      getTextStyles: (context, value) => const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
    );

SideTitles get bottomTitles => SideTitles(
      showTitles: true,
      reservedSize: 22,
      margin: 10,
      interval: 1,
      getTextStyles: (context, value) => const TextStyle(
        color: AppThemes.blackPearl,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      getTitles: (value) {
        switch (value.toInt()) {
          case 2:
            return 'SEP';
          case 7:
            return 'OCT';
          case 12:
            return 'DEC';
        }
        return '';
      },
    );

List<LineChartBarData> get lineBarsData => [
      lineChartBarData2_1,
      lineChartBarData2_2,
      lineChartBarData2_3,
    ];

LineChartBarData get lineChartBarData2_1 => LineChartBarData(
      isCurved: false,
      colors: const [AppThemes.chartBlue],
      barWidth: 2,
      isStrokeCapRound: true,
      dotData: FlDotData(show: false),
      belowBarData: BarAreaData(show: false),
      spots: const [
        FlSpot(1, 1),
        FlSpot(3, 4),
        FlSpot(5, 1.8),
        FlSpot(7, 5),
        FlSpot(10, 2),
        FlSpot(12, 2.2),
        FlSpot(13, 1.8),
      ],
    );

LineChartBarData get lineChartBarData2_2 => LineChartBarData(
      isCurved: false,
      colors: const [AppThemes.purple],
      barWidth: 2,
      isStrokeCapRound: true,
      dotData: FlDotData(show: false),
      spots: const [
        FlSpot(1, 1),
        FlSpot(3, 2.8),
        FlSpot(7, 1.2),
        FlSpot(10, 2.8),
        FlSpot(12, 2.6),
        FlSpot(13, 3.9),
      ],
    );

LineChartBarData get lineChartBarData2_3 => LineChartBarData(
      colors: const [AppThemes.yellow],
      barWidth: 2,
      isStrokeCapRound: true,
      dotData: FlDotData(show: false),
      belowBarData: BarAreaData(show: false),
      spots: const [
        FlSpot(1, 3.8),
        FlSpot(3, 1.9),
        FlSpot(6, 5),
        FlSpot(10, 3.3),
        FlSpot(13, 4.5),
      ],
    );
