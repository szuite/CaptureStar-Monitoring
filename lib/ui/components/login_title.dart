import 'package:capturestarmonitoring/constants/app_themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class LoginTitle extends StatelessWidget {
  const LoginTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 28, top: 60),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Capture Star M', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: AppThemes.titleColor, fontFamily: 'Roboto'),),
          SizedBox(height: 16.0,),
          Text('태양광 모니터링 시스템', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppThemes.titleColor),)
        ],
      ),
    );
  }
}
