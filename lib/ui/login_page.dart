import 'package:capturestarmonitoring/constants/app_themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'components/login_form.dart';
import 'components/login_title.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        child: Container(
          color: AppThemes.whiteLilac,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              // 제목 타이틀
              const LoginTitle(),

              const SizedBox(
                height: 20,
              ),

              // 이미지 파일
              Container(
                height: 261,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/login_image.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),

              const Expanded(
                child: SizedBox(),
              ),

              // 로그인 Form
              const LoginForm(),
            ],
          ),
        ),
      ),
      key: _formKey,
    );
  }
}
