import 'dart:convert';

import 'package:capturestarmonitoring/app/constants/constants.dart';
import 'package:capturestarmonitoring/app/controller/date_picker_notifier.dart';
import 'package:capturestarmonitoring/app/data/model/model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

class VerticalBarChart extends StatefulWidget {
  const VerticalBarChart({this.title, required this.colors, this.flag, Key? key}) : super(key: key);

  final String? flag;
  final String? title;
  final Color colors;

  @override
  _VerticalBarChartState createState() => _VerticalBarChartState();
}

class _VerticalBarChartState extends State<VerticalBarChart> {
  List<PowerGenerationModel> chartData = [];
  Color barChartColor = Colors.black;

  final controller = Get.put(DatePickerNotifier());

  DateTime? _initialDateTime;

  DateTime? _startDateTime;
  DateTime? _endDateTime;

  String? jsonAsset = 'assets/json/data2.json';

  @override
  Widget build(BuildContext context) {

    _initialDateTime = Hive.box('calendar').get('${widget.title}Date');
    _initialDateTime ??= DateTime.now();


    _startDateTime = Hive.box('calendar').get('${widget.title}StartDate');
    _endDateTime = Hive.box('calendar').get('${widget.title}EndDate');

    if (_startDateTime == null || _endDateTime == null) {
      _startDateTime = DateTime.now();
      _endDateTime = DateTime.now();
    }

    // Model 클래스 API 호출 (_startDateTime, _endDateTime) --> Json 파일 변환
    barChartColor = widget.colors;

    switch (widget.flag) {
      case 'Daily':
        jsonAsset = 'assets/json/data2.json';
        break;
      case 'Period':
        jsonAsset = 'assets/json/data.json';
    }

    return FutureBuilder(
      future: getJsonFromAssets(jsonAsset!),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          loadChartData();
          return BarChart(
            _createSampleData(),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }

  @override
  void initState() {
    loadChartData();
    super.initState();
  }

  Future loadChartData() async {
    final String jsonString = await getJsonFromAssets(jsonAsset!);
    final dynamic jsonResponse = json.decode(jsonString);

    chartData.clear();

    for (Map<String, dynamic> i in jsonResponse) {
      chartData.add(PowerGenerationModel.fromJson(i));
    }
  }

  Future<String> getJsonFromAssets(String jsonAsset) async {
    return await rootBundle.loadString(jsonAsset);
  }

  BarChartData _createSampleData() {
    return BarChartData(
        backgroundColor: Colors.transparent,
        borderData: FlBorderData(
            show: true,
            border: const Border(
                bottom: BorderSide(color: AppThemes.dividerColor, width: 1.0))),
        barTouchData: barTouchData,
        alignment: BarChartAlignment.spaceBetween,
        titlesData: titlesData,
        //barGroups: barGroups,
        barGroups: _mainGroupData(chartData),
        gridData: gridData,
        minY: 0,
        maxY: 80);
  }

  FlGridData get gridData => FlGridData(
        show: true,
        drawHorizontalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: AppThemes.dividerColor,
            strokeWidth: 1,
          );
        },
      );

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        leftTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        rightTitles: SideTitles(showTitles: false),
        bottomTitles: SideTitles(
          showTitles: true,
          getTitles: (value) {
            switch (widget.flag) {
              case 'Daily':
                return getDateFromJsonString(
                    chartData[value.toInt()].date.toString(), "hh:mm");
              case 'Period':
                return getDateFromJsonString(
                    chartData[value.toInt()].date.toString(), "MM/dd");
            }
            return getDateFromJsonString(
                chartData[value.toInt()].date.toString(), "hh:mm");
          },
        ),
      );

  String getDateFromJsonString(String date, String s) {
    return DateFormat(s).format(DateTime.parse(date)).toString();
  }

  BarTouchData get barTouchData => BarTouchData(
        enabled: true,
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.transparent,
          tooltipMargin: 10,
          tooltipPadding: const EdgeInsets.all(5),
          direction: TooltipDirection.auto,
          fitInsideHorizontally: true,
          fitInsideVertically: true,
        ),
      );

  List<BarChartGroupData> _mainGroupData(List<PowerGenerationModel> chartData) {
    int index = 0;
    List<BarChartGroupData> data = [];
    for (var item in chartData) {
      var itemData = _makeGroupData(index, item.powerGeneration);
      data.add(itemData);
      index++;
    }
    return data;
  }

  BarChartGroupData _makeGroupData(int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          y: y,
          width: 30,
          borderRadius: BorderRadius.circular(8.0),
          colors: [barChartColor],
        ),
      ],
      showingTooltipIndicators: [0],
    );
  }
}

/*
class VerticalBarChart extends StatelessWidget {
  const VerticalBarChart(BarChartData createSampleData,
      {Key? key, required this.colors})
      : super(key: key);

  final Color colors;

  factory VerticalBarChart.withSampleData(Color colors) {
    return VerticalBarChart(
      _createSampleData(),
      colors: colors,
    );
  }


  @override
  Widget build(BuildContext context) {
    barChartColor = colors;
    return BarChart(
      _createSampleData(),
    );
  }

  static BarChartData _createSampleData() {
    return BarChartData(
        backgroundColor: Colors.transparent,
        borderData: FlBorderData(
            show: true,
            border: const Border(
                bottom: BorderSide(color: AppThemes.dividerColor, width: 1.0))),
        barTouchData: barTouchData,
        alignment: BarChartAlignment.spaceBetween,
        titlesData: titlesData,
        barGroups: barGroups,
        gridData: gridData,
        minY: 0,
        maxY: 80);
  }
}*/
