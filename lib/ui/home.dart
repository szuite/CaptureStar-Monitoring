import 'package:capturestarmonitoring/constants/app_themes.dart';
import 'package:capturestarmonitoring/ui/components/pwr_generation_gridview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'components/conversion_status_form.dart';
import 'components/weather_info_form.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 28, top: 40, right: 28, bottom: 34),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Home 제목
                  Text(
                    'Home',
                    style: theme.headline2,
                  ),

                  const SizedBox(
                    height: 28,
                  ),

                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 0.2,
                          blurRadius: 5,
                          offset: const Offset(0.2, 5),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('고덕 - 아파트 BIPV'),
                          Text('해동엔지니어링 님'),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 28,
                  ),

                  Text(
                    '발전현황',
                    style: theme.headline3,
                  ),

                  const SizedBox(
                    height: 28,
                  ),

                  // 발전현황 Form
                  Container(
                    height: 210,
                    color: Colors.black54,
                  ),

                  const SizedBox(
                    height: 32,
                  ),

                  const PowerGenerationGridView(),

                  const SizedBox(
                    height: 28,
                  ),

                  const Text(
                    '기상정보',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: AppThemes.black30,
                        fontFamily: 'Roboto'),
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  // 기상정보 Form
                  const WeatherInfoForm(),

                  Container(
                    color: Color.fromRGBO(221, 221, 221, 1.0),
                    height: 2,
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  const Text(
                    '변환현황',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: AppThemes.black30,
                        fontFamily: 'Roboto'),
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  // 변환현황 Form
                  const ConversionStatusForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
