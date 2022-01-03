// import 'package:capturestarmonitoring/constants/app_themes.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
//
// // DatePicker Controller
//
// class DatePickerController extends GetxController {
//   DateTime? dateTime = DateTime.now();
//   String? _strDate = DateFormat("yyyy년 MM월 dd일").format(DateTime.now());
//   String? startDate = DateFormat("yyyy년 MM월 dd일").format(DateTime.now());
//   String? endDate = DateFormat("yyyy년 MM월 dd일").format(DateTime.now());
//
//   get strDate => _strDate;
//   set strDate(dateTime) => _strDate = _strDate;
//
//   Future showDatePickerPop(BuildContext context) async {
//     DateTime? selectedDate = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2020),
//       lastDate: DateTime(DateTime.now().year + 20),
//       builder: (context, child) {
//         return Theme(
//           data: AppThemes.lightTheme,
//           child: child!,
//         );
//       },
//     );
//
//     if (selectedDate != null) {
//       _strDate = changeDateFormat(selectedDate);
//       update();
//     }
//   }
//
//   Future showDateRangePickerPop(BuildContext context) async {
//     DateTimeRange? pickedRange = await showDateRangePicker(
//       context: context,
//       firstDate: DateTime(2020),
//       lastDate: DateTime(DateTime.now().year + 20),
//       builder: (context, child) {
//         return Theme(
//           data: AppThemes.lightTheme.copyWith(
//             primaryColor: Colors.blue,
//             colorScheme: const ColorScheme.light(primary: Colors.blue),
//             buttonTheme: const ButtonThemeData(
//               textTheme: ButtonTextTheme.primary
//             ),
//           ),
//           child: child!,
//         );
//       },
//     );
//
//     if (pickedRange != null) {
//       startDate = changeDateFormat(pickedRange.start);
//       endDate = changeDateFormat(pickedRange.end);
//
//       print('picked range ${pickedRange.start} ${pickedRange.end}');
//       update();
//     }
//   }
//
//   String changeDateFormat(DateTime? date) {
//     String strDate = DateFormat("yyyy년 MM월 dd일").format(date!);
//     return strDate;
//   }
// }
