import 'package:capturestarmonitoring/app/controller/date_picker_notifier.dart';
import 'package:flutter/material.dart';
import 'package:capturestarmonitoring/app/constants/constants.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

import 'components.dart';

class DatePickerForm extends StatefulWidget {
  const DatePickerForm({this.title, this.notifyParent, Key? key}) : super(key: key);

  final String? title;
  final Function? notifyParent;

  @override
  DatePickerFormState createState() => DatePickerFormState();
}

class DatePickerFormState extends State<DatePickerForm> {
  final dateStr = ['Daily', 'Period'];
  final controller = Get.put(DatePickerNotifier());

  DateTime? _initialDateTime;

  DateTime? _startDateTime;
  DateTime? _endDateTime;

  // 일별 날짜 추출 함수
  Future _showDatePickerPop(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _initialDateTime!,
      firstDate: DateTime(2020),
      lastDate: DateTime(DateTime.now().year + 20),
      builder: (context, child) {
        return Theme(
          data: AppThemes.lightTheme,
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        // Hive - 일별 날짜 저장
        Hive.box('calendar').put('${widget.title}Date', picked);
        print('picked : $picked');
      });

      widget.notifyParent!(dateStr[0]);
    }
  }

  // 기간별 날짜 추출 함수
  Future _showDateRangePickerPop(BuildContext context) async {
    DateTimeRange? pickedRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year),
      lastDate: DateTime(DateTime.now().year + 2),
      builder: (context, child) {
        return Theme(
          data: AppThemes.lightTheme.copyWith(
            primaryColor: Colors.blue,
            colorScheme: const ColorScheme.light(primary: Colors.blue),
            buttonTheme:
                const ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );

    if (pickedRange != null) {
      print('picked range ${pickedRange.start} ${pickedRange.end}');
      setState(() {
        // Hive - 기간별 날짜 저장
        Hive.box('calendar').put('${widget.title}StartDate', pickedRange.start);
        Hive.box('calendar').put('${widget.title}EndDate', pickedRange.end);
      });

      widget.notifyParent!(dateStr[1]);
    }
  }

  String _changeDateFormat(DateTime? date) {
    String strDate = DateFormat("yyyy년 MM월 dd일").format(date!);
    return strDate;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    _initialDateTime = Hive.box('calendar').get('${widget.title}Date');
    _initialDateTime ??= DateTime.now();

    _startDateTime = Hive.box('calendar').get('${widget.title}StartDate');
    _endDateTime = Hive.box('calendar').get('${widget.title}EndDate');

    if (_startDateTime == null || _endDateTime == null) {
      _startDateTime = DateTime.now();
      _endDateTime = DateTime.now();
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 일별 TextButton
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '일별',
              style: theme.headline4,
            ),
            const SizedBox(
              height: 4.0,
            ),
            TextButton(
                style: DatePickerButtonStyle.outlinedButton,
                child: Text(_changeDateFormat(_initialDateTime)),
                onPressed: () => _showDatePickerPop(context)),
          ],
        ),

        const SizedBox(
          width: 10,
        ),

        // 기간별 TextButton
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '기간별',
              style: theme.headline4,
            ),
            const SizedBox(
              height: 4.0,
            ),
            Row(
              children: [
                TextButton(
                  style: DatePickerButtonStyle.outlinedButton,
                  child: Text(_changeDateFormat(_startDateTime)),
                  onPressed: () => _showDateRangePickerPop(context),
                ),
                const SizedBox(width: 4),
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 4.0, horizontal: 7.0),
                  decoration:
                      CustomDecorations.rangeFrameBox(color: AppThemes.blue),
                  child: const Text(
                    '부터',
                    style: TextStyle(color: AppThemes.white),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 4.0,
            ),
            Row(
              children: [
                TextButton(
                  style: DatePickerButtonStyle.outlinedButton,
                  child: Text(_changeDateFormat(_endDateTime)),
                  onPressed: () => _showDateRangePickerPop(context),
                ),
                const SizedBox(width: 4),
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 4.0, horizontal: 7.0),
                  decoration:
                      CustomDecorations.rangeFrameBox(color: AppThemes.red),
                  child: const Text(
                    '까지',
                    style: TextStyle(color: AppThemes.white),
                  ),
                )
              ],
            )
          ],
        ),
      ],
    );
  }
}
