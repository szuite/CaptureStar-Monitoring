import 'package:capturestarmonitoring/constants/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../main_page.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return SizedBox(
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width,

      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.0),
            topRight: Radius.circular(40.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
              top: 40.0, left: 28.0, right: 28.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: [
              // ID 입력 Form
              TextFormField(
                decoration: InputDecoration(
                  labelText: '아이디',
                  icon: SvgPicture.asset(
                    'assets/images/user.svg',
                    width: 20,
                    height: 20,
                  ),
                ),
              ),

              const SizedBox(
                height: 12.0,
              ),

              // Password 입력 Form
              TextFormField(
                decoration: InputDecoration(
                  labelText: '비밀번호',
                  icon: SvgPicture.asset(
                    'assets/images/padlock.svg',
                    width: 20,
                    height: 20,
                  ),
                ),
              ),

              const SizedBox(
                height: 16.0,
              ),

              const Text(
                '아이디나 비밀번호를 잊으셨나요?',
                style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.normal,
                    color: AppThemes.dodgerBlue),
              ),

              const Expanded(
                child: SizedBox(),
              ),

              // Login 버튼
              Padding(
                padding: const EdgeInsets.only(bottom: 80),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: AppThemes.blue,
                        minimumSize: const Size(double.infinity, 62),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: Text('로그인', style: theme.button),
                    onPressed: () => Get.to(MainPage()),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
