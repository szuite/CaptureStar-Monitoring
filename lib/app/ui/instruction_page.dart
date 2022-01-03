import 'package:flutter/material.dart';
import 'package:capturestarmonitoring/app/constants/constants.dart';

class InstructionPage extends StatelessWidget {
  const InstructionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('안내사항'),
        backgroundColor: AppThemes.whiteLilac,
        elevation: 0,
        foregroundColor: AppThemes.blackPearl,
      ),
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Container(
            padding: const EdgeInsets.only(left: 28.0, right: 28.0, top: 28.0),
            child: Text('1. ID 발급, 비밀번호 변경 등은 관리 회사인 온테스트에서만 가능합니다. \n'
                '2. 모든 정보는 www.on-pv.com 과 동일한 데이터를 사용하여 제공됩니다. \n'
                '3. ~~~ \n'
                '4. ~~~ \n', style: theme.bodyText1?.copyWith(fontSize: 14.0),),
          ),
        ),
      ),
    );
  }
}