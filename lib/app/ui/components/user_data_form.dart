import 'package:flutter/material.dart';

import 'custom_decorations.dart';

// 유저 정보, 아파트 정보 출력

class UserDataForm extends StatelessWidget {
  const UserDataForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      decoration: CustomDecorations.userFrameBox(),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            // DB 데이터 연동, 추후 수정 필요
            Text('고덕 - 아파트 BIPV'),
            Text('해동엔지니어링 님'),
          ],
        ),
      ),
    );
  }
}
