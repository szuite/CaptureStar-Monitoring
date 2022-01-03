import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:capturestarmonitoring/app/constants/constants.dart';

class CustomerCenterPage extends StatelessWidget {
  const CustomerCenterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('고객센터'),
        backgroundColor: AppThemes.whiteLilac,
        elevation: 0,
        foregroundColor: AppThemes.blackPearl,
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(
              left: 28.0, right: 28.0, top: 28.0, bottom: 28.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(
                    left: 12.0, right: 12.0, top: 12.0, bottom: 12.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: AppThemes.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      '작성자',
                      style: theme.bodyText1,
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: const Color.fromRGBO(244, 244, 244, 1.0),
                      ),
                      child: const TextField(
                        maxLines: 1,
                        style: TextStyle(fontSize: 15),
                        decoration: InputDecoration(
                            hintText: '홍길동',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(left: 12.0)),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    AutoSizeText(
                      '연락처',
                      style: theme.bodyText1,
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Container(
                      height: 44,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: const Color.fromRGBO(244, 244, 244, 1.0)),
                      child: const TextField(
                        maxLines: 1,
                        style: TextStyle(fontSize: 15),
                        decoration: InputDecoration(
                            hintText: '010-1111-1111',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(left: 12.0)),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    AutoSizeText(
                      '이메일',
                      style: theme.bodyText1,
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Container(
                      height: 44,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: const Color.fromRGBO(244, 244, 244, 1.0),
                      ),
                      child: const TextField(
                        maxLines: 1,
                        style: TextStyle(fontSize: 15),
                        decoration: InputDecoration(
                            hintText: 'ontest@on-test.co.kr',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(left: 12.0)),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(
                      left: 12.0, right: 12.0, top: 12.0, bottom: 12.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: AppThemes.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        '문의 내용',
                        style: theme.bodyText1,
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Expanded(
                        child: Container(
                          height: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: const Color.fromRGBO(244, 244, 244, 1.0),
                          ),
                          child: const TextField(
                            style: TextStyle(fontSize: 15),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(left: 12.0),
                                hintText: '문의 내용을 입력해주세요.'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
